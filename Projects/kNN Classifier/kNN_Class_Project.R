# Loading the libraries
library(kknn)
library(rknn)

# Loading and standardizing the data

khan <- read.table("khantrainadd2.csv", header = TRUE, sep = ";")
dim(khan)
names(khan)

# The first step is to standardize the variables, starting with the numerical ones:

var.num = c(3:2310)
khan.est = as.data.frame(scale(khan[, var.num]))
names(khan.est)

# Since we are asked to remove the Gen* variables that end with the same two digits as our ID number,
# in my case, I will remove those ending in 50

var1.elim = paste("Gen", c(1:22), "50", sep = "")
var.elim = list("Gen50", var1.elim)
drop = names(khan.est) %in% var.elim
khan.est = khan.est[, !drop]

# The binary variables already have values 0 or 1, so we don't need to change them,
# we only apply the scale() function (without centering)

khan.est$codlog01 = scale(khan$codlog01, center = FALSE)
khan.est$codlog02 = scale(khan$codlog02, center = FALSE)
khan.est$codlog03 = scale(khan$codlog03, center = FALSE)
khan.est$codlog04 = scale(khan$codlog04, center = FALSE)
khan.est$codlog05 = scale(khan$codlog05, center = FALSE)
khan.est$codlog06 = scale(khan$codlog06, center = FALSE)
khan.est$codlog07 = scale(khan$codlog07, center = FALSE)

# The nominal variables are the variable "cat1" and later "class". Both have 4 classes,
# so we will transform "cat1" into 4 dummy variables, i.e., 8 dummy variables in total (for both "cat1" and "class").

# Creating dummy variables for "cat1"
khan.est$cat1 = 0
khan.est$cat1[khan$cat1 == 1] <- 1
khan.est$cat2 = 0
khan.est$cat2[khan$cat1 == 2] <- 1
khan.est$cat3 = 0
khan.est$cat3[khan$cat1 == 3] <- 1
khan.est$cat4 = 0
khan.est$cat4[khan$cat1 == 4] <- 1

sc1 = sqrt((var(khan.est$cat1) + var(khan.est$cat2) + var(khan.est$cat3) + var(khan.est$cat4)) / 4)
khan.est$cat1 = khan.est$cat1 / sc1
khan.est$cat2 = khan.est$cat2 / sc1
khan.est$cat3 = khan.est$cat3 / sc1
khan.est$cat4 = khan.est$cat4 / sc1

# For the variable "class", we will create the variables "class1", "class2", "class3",
# and "class4" for the cases BL-NHL, EWS, NB, and RMS respectively:

khan.est$class1 = 0
khan.est$class1[khan$class == "BL-NHL"] <- 1
khan.est$class2 = 0
khan.est$class2[khan$class == "EWS"] <- 1
khan.est$class3 = 0
khan.est$class3[khan$class == "NB"] <- 1
khan.est$class4 = 0
khan.est$class4[khan$class == "RMS"] <- 1

sc2 = sqrt((var(khan.est$class1) + var(khan.est$class2) + var(khan.est$class3) + var(khan.est$class4)) / 4)
khan.est$class1 = khan.est$class1 / sc2
khan.est$class2 = khan.est$class2 / sc2
khan.est$class3 = khan.est$class3 / sc2
khan.est$class4 = khan.est$class4 / sc2

# The ordinal variables are "ord1", "ord2" and "ord3". These have 5 classes, except for "ord3" which has 4 classes,
# and we will standardize them in the same way as the quantitative variables

khan.est$ord1 = scale(khan$ord1)
khan.est$ord2 = scale(khan$ord2)
khan.est$ord3 = scale(khan$ord3)

# Finally, we normalize all the variables using the min-max procedure.

khan.norm = data.frame("target" = khan$target, normalize.unit(khan.est))

# We apply the weighted kNN model on the "target" variable with a maximum of k = 30 and using Euclidean distance:

fit.train <- train.kknn(target ~ ., data = khan.norm, kmax = 30, scale = "TRUE", 
                          kernel = c("triangular", "rectangular", "epanechnikov", "biweight",
                                     "triweight", "cos", "inv", "gaussian", "optimal"), 
                          distance = 2)

# We obtain the best kernel and value of k

fit.train$best.parameters  # Best parameters for the kernel function and k value 
fit.train$response         # Type of response variable (continuous, ordinal, nominal)
fit.train$distance         # Minkowski distance parameter

# We find that the best kernel is "inv" and the best k is 4, so now we only need to obtain the error estimate.
# Since the target variable is continuous, we will calculate the mean squared error (MSE):

fitOPT = fit.train$fitted.values[184]  # These are the fitted values for kernel "inv" and k = 4.

MSE_Weighted = mean((khan.norm$target - fitOPT[[1]][1:64])^2)

# Now we apply the random kNN:

p = ncol(khan.norm) - 1
m = trunc(sqrt(ncol(khan.norm)))
rnc = r(p, m, eta = 0.95, method = "binomial")
m
khan.rknn = rknn.cv(data = khan.norm[, -1], y = khan.norm$target, k = 4, r = rnc, mtry = m, seed = 987654321)

# To obtain the support for each predictor:

khan.rknnsupport = rknnRegSupport(data = khan.norm[, -1], y = khan.norm$target, k = 4, r = rnc, mtry = m, seed = 987654321)

# First, we enter the geometric stage to identify the step at which we achieve the best accuracy,
# and starting from the step just before, we move to the linear stage:

khan.rknnselG = rknnBeg(data = khan.norm[, -1], y = khan.norm$target, k = 4, r = rnc, mtry = m, 
                        seed = 987654321, fixed.partition = FALSE, pk = 0.8, stopat = 10)

bestsel1 = prebestset(khan.rknnselG, criterion = "mean_support")

khan.rknnselLIN = rknnBel(data = khan.norm[, bestsel1], y = khan.norm$target, k = 4, r = rnc, mtry = m, 
                          seed = 987654321, fixed.partition = FALSE, d = 1, stopat = 10)

bestsel = bestset(khan.rknnselLIN, criterion = "mean_support")

# Once we have identified the most important attributes, we create our new model using these attributes
# and calculate the mean squared error:

numsel = khan.rknnselLIN$p[18]

sel_mtry = round(0.5 * numsel, 0)

khan.bestsel = rknn.cv(data = khan.norm[, bestsel], y = khan.norm$target, k = 4, r = rnc, mtry = sel_mtry, seed = 232345324)

MSE_Random = mean((khan.norm$target - as.numeric(as.character(khan.bestsel$pred)))^2)