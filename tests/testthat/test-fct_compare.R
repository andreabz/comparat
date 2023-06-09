test_that("Errors are correctly handled for t-test", {
  faildf <- data.frame(a = "a",
                       b = "b",
                       c = 3)
  expect_error(fct_ttest(faildf, "c", "d"), "")
  expect_error(fct_ttest(faildf, "c", "b", alternative = "less"), "")
})

# Results from Statistics for Experimenters - design, innovation, and discovery
# Second Edition, Wiley 2005. pag. 78 and 101
test_that("Calculations are correct for t-test and alternative = different", {
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer")$hypotheses[[1]],
    "media di b = media di a"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer")$hypotheses[[2]],
    "media di b ≠ media di a"
  )
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$difference[[1]],
               "1.693")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$difference[[2]],
               "-7.506")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$difference[[3]],
               "10.89")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$test[[1]],
               7.3369)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$test[[2]],
               0.975)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$test[[3]],
               0.4313)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$test[[4]],
               2.3430)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer")$test[[5]],
               0.33935 * 2)
})

test_that("Calculations are correct for t-test and alternative = greater", {
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$hypotheses[[1]],
    "media di b ≤ media di a"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$hypotheses[[2]],
    "media di b > media di a"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$difference[[1]],
    "1.693"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$difference[[2]], "-5.695"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$difference[[3]],
    "Inf"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$test[[1]],
    7.3369
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$test[[2]],
    0.950
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$test[[3]],
    0.4313
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$test[[4]],
    1.8820
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              alternative = "greater")$test[[5]],
    0.3393
  )
})

test_that("Calculations are correct for t-test and confidence = 0.99", {
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              significance = 0.99)$hypotheses[[1]],
    "media di b = media di a"
  )
  expect_equal(
    fct_ttest(tomato_yields, "pounds", "fertilizer",
              significance = 0.99)$hypotheses[[2]],
    "media di b ≠ media di a"
  )
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$difference[[1]],
               "1.693")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$difference[[2]],
               "-11.84")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$difference[[3]],
               "15.22")
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$test[[1]],
               7.3369)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$test[[2]],
               0.995)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$test[[3]],
               0.4313)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$test[[4]],
               3.4450)
  expect_equal(fct_ttest(tomato_yields, "pounds", "fertilizer",
                         significance = 0.99)$test[[5]],
               0.33935 * 2)
})

test_that("Errors are correctly handled for f-test", {
  faildf <- data.frame(a = "a",
                       b = "b",
                       c = 3)
  expect_error(fct_ftest(faildf, "c", "d"), "")
  expect_error(fct_ftest(faildf, "c", "b", alternative = "less"), "")
})

# Results from Support of Microsoft Excel F.TEST function
# https://support.microsoft.com/en-us/office/
#   f-test-function-100a59e7-4108-46f8-8443-78ffacb6c0a7
test_that("Calculations are correct for f-test and alternative = different", {
  expect_equal(
    fct_ftest(ftest_reference, "value", "group")$hypotheses[[1]],
    "varianza di b = varianza di a"
  )
  expect_equal(
    fct_ftest(ftest_reference, "value", "group")$hypotheses[[2]],
    "varianza di b ≠ varianza di a"
  )
  expect_equal(fct_ftest(ftest_reference, "value", "group")$ratio[[1]],
               "1.628")
  expect_equal(fct_ftest(ftest_reference, "value", "group")$ratio[[2]],
               "0.1695")
  expect_equal(fct_ftest(ftest_reference, "value", "group")$ratio[[3]],
               "15.64")
  expect_equal(fct_ftest(ftest_reference, "value", "group")$test$dof,
               c("numeratore" = 4, "denominatore" = 4))
  expect_equal(fct_ftest(ftest_reference, "value", "group")$test$alpha,
                0.975)
  expect_equal(fct_ftest(ftest_reference, "value", "group")$test$fsper,
               1.6281)
  expect_equal(fct_ftest(ftest_reference, "value", "group")$test$ftheo,
               "0.1041, 9.6045")
  expect_equal(fct_ftest(ftest_reference, "value", "group")$test$pvalue,
               0.6483)
})

# Results from Support of Microsoft Excel F.TEST function
# https://support.microsoft.com/en-us/office/
#   f-test-function-100a59e7-4108-46f8-8443-78ffacb6c0a7
test_that("Calculations are correct for Shapiro-Wilk test", {
  expect_equal(
    fct_shapiro(shapirotest_reference)$W %>% round(2),
    0.79
  )
  expect_true(
    fct_shapiro(shapirotest_reference)$pvalue %>% round(3) < 0.01
  )
  expect_equal(
    fct_shapiro(shapirotest_reference)$result,
    "I valori non sono compatibili con una distribuzione normale"
  )
})

# Results from  Tietjen and Moore (August 1972),
# Some Grubbs-Type Statistics for the Detection of Outliers,
# Technometrics, 14(3), pp. 583-597. Also available at
# https://www.itl.nist.gov/div898/handbook/eda/section3/eda35h1.htm
test_that("Errors are correctly handled for GESD outlier test", {
  faildf <- data.frame(a = c(1, 2))
  faildf1 <- data.frame(a = 1:5)
  expect_error(fct_gesd(faildf$a), "")
  expect_error(fct_GESD(faildf1$a, signif = 0.05), "")
})

test_that("Calculations are correct for GESD outlier test", {
  expect_equal(
    fct_gesd(uranium_cps, 0.99)$I[which(fct_gesd(uranium_cps, 0.99)$outlier== TRUE)],
    245.57
  )
})

# Results from UNI ISO 16269-4:2019 - Statistical interpretation of data - Part 4:
# Detection and treatment of outliers. Section 4.3.2.
test_that("Calculations are correct for GESD outlier test", {
  expect_equal(
    fct_gesd(uniiso_16269_4_432)$I[1:3],
    c(12.60, 5.80, -2.21)
  )
  expect_equal(
    fct_gesd(uniiso_16269_4_432)$R[1:3] %>% round(4),
    c(3.6559, 3.2634, 2.1761)
  )
  expect_equal(
    fct_gesd(uniiso_16269_4_432)$lambda[1:3] %>% round(4),
    c(2.7058, 2.6785, 2.6492)
  )
  expect_equal(
    fct_gesd(uniiso_16269_4_432)$outlier[1:3],
    c(TRUE, TRUE, FALSE)
  )
})
