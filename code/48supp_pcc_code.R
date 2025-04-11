## NOTE: This code was taken from the {sensitivity} package in R written by
## Gilles Pujol and Bertrand Iooss. The full package has too many dependencies
## that does not reliably install across my machines. This is the only function
## we use from the package so I copy it here to minimize errors.
##
## Source: https://github.com/cran/sensitivity/blob/master/R/pcc.R
library(boot)

#        Bootstrap statistics (overlay for the boot package)
#                         Gilles Pujol 2006


# bootstats(b, conf = 0.95, type = "norm")
# b : object of class 'boot'
# confidence : confidence level for bootstrap bias-corrected confidence
#   intervals
# type : type of confidence interval, "norm" or "basic"
#
# returns : a data.frame of bootstrap statistics

bootstats <- function(b, conf = 0.95, type = "norm") {
    p <- length(b$t0)
    lab <- c("original", "bias", "std. error", "min. c.i.", "max. c.i.")
    out <- as.data.frame(matrix(
        nrow = p, ncol = length(lab),
        dimnames = list(NULL, lab)
    ))

    for (i in 1:p) {
        # original estimation, bias, standard deviation

        out[i, "original"] <- b$t0[i]
        out[i, "bias"] <- mean(b$t[, i]) - b$t0[i]
        out[i, "std. error"] <- sd(b$t[, i])

        # confidence interval

        if (type == "norm") {
            ci <- boot::boot.ci(b, index = i, type = "norm", conf = conf)
            if (!is.null(ci)) {
                out[i, "min. c.i."] <- ci$norm[2]
                out[i, "max. c.i."] <- ci$norm[3]
            }
        } else if (type == "basic") {
            ci <- boot::boot.ci(b, index = i, type = "basic", conf = conf)
            if (!is.null(ci)) {
                out[i, "min. c.i."] <- ci$basic[4]
                out[i, "max. c.i."] <- ci$basic[5]
            }
        } else if (type == "bias corrected") {
            z0_hat <- qnorm(sum(b$t[, i] <= b$t0[i]) / b$R)
            modif_quantiles <- pnorm(2 * z0_hat + qnorm(c((1 - conf) / 2, 1 - (1 - conf) / 2)))
            out[i, "min. c.i."] <- quantile(b$t[, i], probs = modif_quantiles[1])
            out[i, "max. c.i."] <- quantile(b$t[, i], probs = modif_quantiles[2])
        }
    }

    return(out)
}

# Partial Correlation Coefficients
#
# Gilles Pujol 2006
# Bertrand Iooss 2020 for Semi-Partial Correlation Coefficients and logistic model

estim.pcc <- function(data, semi, logistic, i = 1:nrow(data)) {
    d <- data[i, ]
    p <- ncol(d) - 1
    pcc <- numeric(p)
    for (j in 1:p) {
        Xtildej.lab <- paste(colnames(d)[c(-1, -j - 1)], collapse = "+")
        if (!logistic) {
            lm.Y <- lm(formula(paste(colnames(d)[1], "~", Xtildej.lab)), data = d)
        } else {
            lm.Y <- glm(formula(paste(colnames(d)[1], "~", Xtildej.lab)), family = "binomial", data = d)
        }
        lm.Xj <- lm(formula(paste(colnames(d)[j + 1], "~", Xtildej.lab)), data = d)
        if (!semi) {
            pcc[j] <- cor(d[1] - fitted(lm.Y), d[j + 1] - fitted(lm.Xj))
        } else {
            pcc[j] <- cor(d[1], d[j + 1] - fitted(lm.Xj))
        }
    }
    pcc
}


pcc <- function(X, y, rank = FALSE, semi = FALSE, logistic = FALSE, nboot = 0, conf = 0.95) {
    data <- cbind(Y = y, X)

    if (logistic) rank <- FALSE # Impossible to perform logistic regression with a rank transformation

    if (rank) {
        for (i in 1:ncol(data)) {
            data[, i] <- rank(data[, i])
        }
    }

    if (nboot == 0) {
        pcc <- data.frame(original = estim.pcc(data, semi, logistic))
        rownames(pcc) <- colnames(X)
    } else {
        boot.pcc <- boot::boot(data, estim.pcc, semi = semi, logistic = logistic, R = nboot)
        pcc <- bootstats(boot.pcc, conf, "basic")
        rownames(pcc) <- colnames(X)
    }

    out <- list(
        X = X, y = y, rank = rank, nboot = nboot, conf = conf,
        call = match.call()
    )
    class(out) <- "pcc"
    if (!semi) {
        if (!rank) {
            out$PCC <- pcc
        } else {
            out$PRCC <- pcc
        }
    } else {
        if (!rank) {
            out$SPCC <- pcc
        } else {
            out$SPRCC <- pcc
        }
    }
    return(out)
}
