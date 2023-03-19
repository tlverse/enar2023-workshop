################################################################################
# - Prediction tasks with sl3
# - Constructing and fitting a super learner (SL) in sl3
# - Looking up learner documentation
# - Modifying learner parameters
# - Difference between R6 (sl3) and S3 (most R packages) methods 
################################################################################

### 0. Load Data and R packages
library(data.table)
washb_data <- fread(
  paste0(
    "https://raw.githubusercontent.com/tlverse/tlverse-data/master/",
    "wash-benefits/washb_data.csv"
  ),
  stringsAsFactors = TRUE
)
head(washb_data)

library(devtools)
install_github("tlverse/sl3@devel")

### 1. Define the prediction task with `make_sl3_Task`
library(sl3)
washb_task <- make_sl3_Task(
  data = washb_data,
  outcome = "whz",
  covariates = c("tr", "fracode", "month", "aged", "sex", "momage", "momedu", 
                 "momheight", "hfiacat", "Nlt18", "Ncomp", "watmin", "elec", 
                 "floor", "walls", "roof", "asset_wardrobe", "asset_table", 
                 "asset_chair", "asset_khat", "asset_chouki", "asset_tv", 
                 "asset_refrig", "asset_bike", "asset_moto", "asset_sewmach", 
                 "asset_mobile")
)

# let's examine the task
washb_task

### 2. Instantiate the SL with `Lrnr_sl`
sl3_list_learners(properties = "continuous")

lrn_glm <- Lrnr_glm$new()
lrn_mean <- Lrnr_mean$new()
lrn_ridge <- Lrnr_glmnet$new(alpha = 0)
lrn_lasso <- Lrnr_glmnet$new(alpha = 1)
lrn_polspline <- Lrnr_polspline$new()
lrn_earth <- Lrnr_earth$new()
lrn_hal <- Lrnr_hal9001$new(max_degree = 2, num_knots = c(3,2), nfolds = 5)
lrn_ranger <- Lrnr_ranger$new()
lrn_xgb <- Lrnr_xgboost$new()
lrn_gam <- Lrnr_gam$new()
lrn_bayesglm <- Lrnr_bayesglm$new()
stack <- Stack$new(
  lrn_glm, lrn_mean, lrn_ridge, lrn_lasso, lrn_polspline, lrn_earth, lrn_hal, 
  lrn_ranger, lrn_xgb, lrn_gam, lrn_bayesglm
)

sl <- Lrnr_sl$new(learners = stack, metalearner = Lrnr_nnls$new())

### 3. Fit the SL to the task with `train`
set.seed(4197)
sl_fit <- sl$train(task = washb_task)


library(hal9001)
sl_fit_predict <- sl_fit$predict(task = washb_task)
#### Additional functionality

# cross-validated predictive performance
cv_risk_table <- sl_fit$cv_risk(eval_fun = loss_squared_error)
cv_risk_table[,c(1:3)]

# cross-validated predictive performance of SL
set.seed(569)
cv_sl_fit <- cv_sl(lrnr_sl = sl_fit, task = washb_task, 
                   eval_fun = loss_squared_error)
cv_sl_fit$cv_risk[,c(1:2)]

