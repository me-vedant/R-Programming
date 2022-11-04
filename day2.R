setwd("E:/04_R_Programming/04 R Programming/Datasets/")
data()
r93 <-read.csv("E:/04_R_Programming/04 R Programming/Datasets/Cars93.csv",sep = ",")
str(r93)
r93
table(r93$Type)
r94 <-read.csv("E:/04_R_Programming/04 R Programming/Datasets/Cars93.csv")
table(r93$Price.Category)
r94[c(1:10),c(2,4,5)]
#------frequency tables
survey<- read.csv("E:/04_R_Programming/04 R Programming/Datasets/survey.csv")
table(survey$Sex, useNA = "ifany")
table(survey$Wr.Hnd, useNA = "ifany")
#---------proportion
a<- c(10,20,30,50)
sum(a)     # this is what proportioning means
a/sum(a)

prop.table(a) # this automatically divides each element with its sum
prop.table(table(r93$Manufacturer,r93$Price))*100

#-------
r93$Affordability<-ifelse(r93$Price > 30, "EXP" , "Afford")
c<-table(r93$Manufacturer, r93$Affordability)
prop.table(c)*100

w2<-table(r93$Min.Price)
prop.table(w2)*100


mean(survey$Pulse, na.rm =T)
sd(survey$Pulse), na.rm =T)
summary(survey$Pulse)
quantile(survey$Pulse, na.rm=T)

attach(survey)
mean(Pulse, na.rm =T)
detach(survey)
#------ creating your own function
m_to_k <- function(m){
  kms<- m/1000
  kms
}
m_to_k(123456)
# cm to mts conversion function
cm_to_m <- function(cm) {
  ms<- cm/1000
  ms
}
cm_to_m(10000)


#assign
#1
f_to_c <- function(f) {
  c<- (f-32)*(5/9)
  c
}
f_to_c(32)

#2
  coeff_var <- function(i) {
    m<-mean(i)
    s<- sd(i)
   coeff<-(s/m)*100
   coeff
  }
  coeff_var(r93$Price)
 
 
  coeff_inverse <- function(a) {
    avg<-mean(a)
    std<- sd(a)
    coe<-(std/avg)*100
    coe
  }
  coeff_inverse(r93$Price)
  
  g <- c(9.34, 8.42,NA,1.345,0.56,0,NA,7.89)

  impute_func <- function(g) {
    avg<-mean(g, na.rm=T)
    i<-ifelse(is.na(g)==T , avg,g)
    i
  }
  impute_func(g)
  
  
  impute_mean <- function(g){
    m <- mean(g,na.rm = T)
    i <- ifelse(is.na(g)==T,m,g)
    list(imputed =i, avg = m)
  }
  impute_mean(g)
  
  #===========================DATES===============================================
  #as.Date is function used to convert char to Date
  
  cd1 <- "1999-06-16"
  cd2 <- "1998-07-20"
  dt1 <- as.Date(cd1)
  dt2 <- as.Date(cd2)
  dt1
  dt2
  dt1-dt2
  unclass(dt1)
  unclass(dt2)
  unclass(dt1) -  unclass(dt2)
  Sys.Date() 
  class(dt1)
  ##
  cd3<- "Monday,10 October 2022"
  dt3<- as.Date(cd3, format = "%A, %d %B %Y") 
  dt3+5
  ##
  dft<- "20, October 2015 13:30:43"
  dft<- strptime(dft,"%d, %B %Y %H:%M:%S")
  dft
  class(dft)
  ## sequence of date
  translate<- seq.Date(from= Sys.Date() ,length =10, by='week')
  translate
                        seq(1:5)
  #================lubridate pckg============================== 
  library(lubridate) 
  cdt1 <- "12-Jan-2022"
  dt1 <- dmy(cdt1)
  dt1
  
  #============================================================
  cdt <- c("12-Nov-2022","13-Jun-2022")
  dt <- dmy(cdt)
  
  day(dt)
  month(dt,label = T)
  year(dt)
  wday(dt)
  wday(dt, label = T)
  month(dt) <- month(dt) +1
   month(dt) 
  #=================================================================
   library(lubridate)
   order <- read.csv("E:/04_R_Programming/04 R Programming/Datasets/Orders.csv")
   form <- dmy(order$Order.Date)
   cbind(day<-month(form))
   order$month <- month(form)
   order$Day <- day(form)
   order$year <- year(form)
   order$AfterOneYear <- Orders$Date 
   year(order$AfterOneYear) <- year(order$AfterOneYear) + 1
   
   #=============================
   # tidyverse
  
   #arrange function 
  library(tidyverse)
   s_cars <- arrange(r93, Price)
   s_cars2 <- arrange(r93, Type,Price)
   s_cars3 <- arrange(r93, Type,desc(Price))
# select function  
    sel_cars <- select(r93, Model, Type, Price)
    sel_cars2 <- select(r93, Model:Max.Price)
    sel_cars3 <- select(r93, starts_with("MPG"))
    sel_cars3 <- select(r93, contains("in"))
    
#subsetting
    sscars <- filter(r93, Manufacturer %in% c("Audi","Ford"))
#rename
    rcars<- rename(r93, Min=Min.Price , Max=Max.Price)
#mutate (make new column)
    m_cars<- mutate(r93, Price_range = Max.Price - Min.Price , Ratio = Weight/Passengers)
#summarize
    sum_car <- summarise(r93, avg_price = mean(Price, na.rm = T))
# grouping
    grp_car<- group_by(r93, Type, Price)
    grp_car

    # pipeline
grp_car2<- r93 %>% group_by(Type,Price)
    