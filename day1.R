https://public.tableau.com/app/profile/abhishek.jaywant.lohare/viz/Sample_Coffee_Chain_16681608554630/monthlyareachartofmarkettingContinuousareachart?publish=yes



***NOTE** clear R environment 
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.
******
w <- 4
y<- "s"
h<- w**2
ls()
"vedant" -> v
ls()
v
library(tidyr)
d<- c(3,5,6,7)
d
## append to existing vector 
d<- append(d, c(45,55,65,90))
length(d)
d+3 #vectorization
d*2
name<-c("a","b","c","d")
age<-c(34,72,65,10)

rb<- rbind(name,age)
rb
cb<- cbind(name,age)
cb
class(rb)
df<- data.frame(name,age)
df
data(mtcars)
mtcars
mtcars$disp
class(mtcars$disp)
mean(mtcars$disp)
sd(mtcars$disp)
summary(mtcars$disp)

s<- list(a=6,g=9.43,h="ftr", k=c(4,5,6,7,8))
class(s)
s[4]
s$g

#factor
name<- c("a","b","c")
age<- c(10,20,30)
gdr<- c("f","m","f")
df<- data.frame(name,age,gdr)
df
df$gdr
df$gdr<- factor(df$gdr)

########## missing values

z<- c(10,20,30,NA,50,NA,NA)
z
is.na(z) # NA is ture, rest is false
table(is.na(z)) #gives no of true or false
#or can do it by
sum(is.na(z)) #no of NA present in the vector
a<- 0/0
is.nan(a)  -- gives nan i.e Not defined (0/0, infi/infi)
d<- c(0/0,1/2,1/0,0/1,3,5,1/0,5/0,NA)
d
table(is.nan(d))
is.na(d)
is.infinite(d)
table(is.infinite(d))
m<- matrix(c(9,5,6,7),2,3) ---------  number of row or columns( here 3 ) should be a multiple or submultiple of the data length(9,5,6,7) so it can be m<- matrix(c(9,5,6,7),2,12)
m
name<- c("a","b","c","d")
age<-c(34,45,56)
rb<- rbind(name,age)
rb
data("mtcars")
mtcars
colnames(mtcars)
names(mtcars)
s<- list(a=6,b=77)
colnames(s) #will not give the ans
names(s)# will give the name of the columns
#-==---------------------------------------------
#function setwd - set wrking dir so that everytime you dont have to write file path

setwd("E:/04_R_Programming/04 R Programming/Datasets")

#getwd() in console gets current working dir you are working in 

b2<- read.csv("Bollywood_2015_2.csv",header = F)
b2
colnames(b2)<- c("Movies","BO","Budget","Verdict")
b3<- read.csv("AutoCollision.csv")
b3
b4<- read.csv2("Diamonds.csv")
b4
mem<- read.table("E:/04_R_Programming/04 R Programming/Datasets/members.txt",header =TRUE,
    colClasses = c("character","character","integer"),skip=1,sep=" ")
# skip means skip first line, 
mem
#reading files
library(xlsx) #gives java error use package readxl
bnk<- read.xlsx("bankruptcy.xlsx",3)
#
library(readxl)
bnk<- read_excel("bankruptcy.xlsx",sheet = 3)
#-----------
# writing files
data("ChickWeight")
write.csv(ChickWeight,"E:/04_R_Programming/exported_chick_wt.csv")
#SUBSETTING A VECTOR - SLICE FROM THE DATA
x<- c(12,23,44,555,66,77,88,99,1100,44)
x[x>50] #filter

m= matrix(1:12, 4,3)
m
m[3,] #extracts 3rd row
m[c(2,4), ] #extracts 2nd and 4th  row using c function
m[1,1]
m1<-m[,2, drop = F] #always asisgn so that you can use the obj in your code ahead
m[1:2,c(2,3)]


#-- new exmple
d1<- read.csv2("Diamonds.csv", stringsAsFactors = T)
d1$clarity
d2<- d1[1:50, c(1,2)]
df<- d1[1:50, -c(4:6)] # excluding 4 and 6 printing remaining rows
df
#---------
#filtering the data
#funcs: which, subset, filter
# func : subset

boll<- read.csv("Bollywood_2015.csv")
boll$BO_Collection > 50
sum(boll$BO_Collection > 50)

#subset:
ss<- subset(boll,boll$BO_Collection > 50) 
ss2<- subset(boll,BO_Collection > 50 & Budget > 70,
             select = c(Movie_Name,BO_Collection))


