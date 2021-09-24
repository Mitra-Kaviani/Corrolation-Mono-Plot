##Reading input data (csv)
data <- read.csv("C:/Users/Mitra/Dropbox/Dara _RA Job/Food Poisoning Paper/Results/Yelp/Cross Correlation & Graphs/Yelp_2018_cyc.csv")
data$Date <- NULL #ignore "Date" column

##Installing libraries
#install.packages("corrplot")
#install.packages("FactoMineR")
#install.packages("factoextra")

##Defining libraries
library(FactoMineR)
library(factoextra)
library(corrplot)

##PCA
res.pca <- PCA(data, graph = FALSE)
print(res.pca)
##PCA Interpretation 
##Extracting principal components variances
eig.val <- get_eigenvalue(res.pca)
eig.val 
##Visualizing the variances 
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))# Bar charts 
var <- get_pca_var(res.pca)
var
fviz_pca_var(res.pca, col.var = "black")#balck and white
head(var$cos2, 4)

##Making correlation circle to show collrelation between variables and a PC
corrplot(var$cos2, is.corr=FALSE)
##Color by cos2 values: quality on the factor map
fviz_cos2(res.pca, choice = "var", axes = 1:2)
options(ggrepel.max.overlaps = Inf)
fviz_pca_var(res.pca, col.var = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE)
