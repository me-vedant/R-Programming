#1. Subset the dataset Orders in the folder datasets to create a dataset with only “Online” payment.
o1 <- read.csv("E:/04_R_Programming/04 R Programming/Datasets/Orders.csv")
#2. Consider the dataset mtcars. Output (write) the data in this data set into a csv file and name the csv file as
#mtcars.csv.
d1 <- data("mtcars")
mtcars
w1 <- write.csv(mtcars,"E:/04_R_Programming/lab_EXEC_MTCARS.csv")
#3. Consider the dataset diamonds in the folder datasets. Subset the dataset with criteria as cut=Premium and
#color=J
d2 <- read.csv2("E:/04_R_Programming/04 R Programming/Datasets/Diamonds.csv")
ss <- subset(d2, cut=="Premium" & color =="J")
#4. Consider the dataset diamonds in the folder datasets. Create a data frame object which stores just variables
#carat, color, depth and price

df2 <- data.frame(d2$carat, d2$color, d2$depth, d2$price)
#5. Consider the dataset mtcars. Choose the 2nd, 18th, 30th and 12th rows
q2<- mtcars[c(2,12,18,30),]


#==================================================================================
a1 <-read.csv("E:/04_R_Programming/Cls wrk/breast-cancer-wisconsin.data",header = F)
colnames(a1) <- c("Sample","Clump_thick","Uni_Cell_size","Uni_cell_shape","Adhesion","Single_Epi_cell_sz","bare_nuc",
                  "bland_chro","normal_nuc","mitoses","class")
new_csv_Breast_cancer <- mtcars,"E:/04_R_Programming/lab_EXEC_MTCARS.csv")
