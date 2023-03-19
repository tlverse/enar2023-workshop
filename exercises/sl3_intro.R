################################################################################
# - Prediction tasks with sl3
# - Constructing and fitting a single learner in sl3
# - Learner documentation
# - Modifying learner parameters
# - Difference between R6 (sl3) and S3 (most R packages) methods 
################################################################################

### 0. Load Data and R packages
library(sl3)
library(data.table)
data(cpp_imputed) # subset of data from collaborative perinatal project (CPP)

### 1. Define the prediction task with `make_sl3_Task`
cpp_task <- sl3_Task$new(
  cpp_imputed, outcome = "haz",
  covariates = c("apgar1","apgar5","parity","gagebrth","mage","meducyrs","sexn")
)
# let's examine the task
cpp_task

### 2. Instantiate the learner with `Lrnr_*$new()`
earth_sl3 <- Lrnr_earth$new()
# what is default? ?Lrnr_earth

### 3. Fit the the learner to the task with `train`
set.seed(4738)
earth_fit_sl3 <- earth_sl3$train(task = cpp_task)

### We may want to get predictions from the fitted learner with `predict`
preds_earth_fit_sl3 <- earth_fit_sl3$predict(task = cpp_task)

### specification and predictions from classic implementation, which uses S3
library(earth)
set.seed(4738)
earth_fit_classic <- earth(x = cpp_task$X, y = cpp_task$Y, degree = 2)
preds_earth_fit_classic <- predict(earth_fit_classic, newdata = cpp_task$X, 
                                   type = "response")

############ check equality of predictions
all.equal(preds_earth_fit_sl3, as.numeric(preds_earth_fit_classic))

################################################################################
# specify different earth arguments in the Lrnr wrapper
earth_1way <- Lrnr_earth$new(degree = 1)
set.seed(4738)
earth_1way_fit_sl3 <- earth_1way$train(task = cpp_task)
preds_earth_1way_fit_sl3 <- earth_1way_fit_sl3$predict(task = cpp_task)

# get predictions from classic implementation
set.seed(4738)
earth_fit_classic_1way <- earth(x = cpp_task$X, y = cpp_task$Y)
preds_fit_classic_1way <- predict(earth_fit_classic_1way, newdata = cpp_task$X, 
                                  type = "response")

############ check equality of predictions
all.equal(preds_earth_1way_fit_sl3, as.numeric(preds_fit_classic_1way))
