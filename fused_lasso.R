library(tidyverse)
library(oro.nifti)
library(jsonlite)
library(genlasso)
library(MLmetrics)

data.path <- "/media/jan/TOSHIBA EXT/SMHDD_22/data/"

X_train <- read_csv(paste0(data.path, "X_train_f1_red.csv"))
y_train <- read_csv(paste0(data.path, "y_train_f1_red.csv"))

X_test <- read_csv(paste0(data.path, "X_test_red.csv"))
y_test <- read_csv(paste0(data.path, "y_test_red.csv"))

clf <- fusedlasso2d(y=y_train$`0`,
                    X=as.matrix(X_train),
                    gamma=10,
                    dim1=25,
                    dim2=34*23, 
                    maxsteps=3000,
                    approx=TRUE,
                    verbose=TRUE)

saveRDS(clf, file = paste0(data.path, "fused_lasso_clf3000.rds"))

# calculate f1-score on test set
coefs <- coef(clf, lambda_min)
prediction <- predict.genlasso(clf, lambda=lambda_min, Xnew=as.matrix(X_test))
y_pred <- round(prediction$fit)

F1_Score(y_test$`0`, y_pred)
