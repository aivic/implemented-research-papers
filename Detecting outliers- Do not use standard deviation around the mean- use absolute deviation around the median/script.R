library(stats)

# read sales_vs_rainfall.csv dataset file
raw.data <- read.csv("sales_vs_rainfall.csv")

# visualising the data - Outlier detected
plot(raw.data)
boxplot(raw.data$sales_in_inr)

# Number of outliers using boxplot
length(boxplot(raw.data$sales_in_inr)$out)         # 1 outlier

# Outlier detection with proposed approach in paper
M <- median(raw.data$sales_in_inr)                 # median
md <- mad(raw.data$sales_in_inr)                   # Mean absolute deviance
low_outlier <-  M - (3*md)                         # Low outlier critical value
high_outlier <- M + (3*md)                         # High outlier critical value

# low_outlier = -93553.5
# high_outlier = 195553.5

range(raw.data$sales_in_inr)                       # 100 320000

# Finding number of outliers using given approach
cnt = 0
for (i in 1:length(raw.data$sales_in_inr)) {
  if ((raw.data$sales_in_inr[i] < low_outlier) | (raw.data$sales_in_inr[i] > high_outlier)){
    cnt = cnt + 1
  }
}
cnt                                                # 1 outlier detected
