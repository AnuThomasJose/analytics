#IIML
#Day1

mtcars
?mtcars   #help on mtcars

#class(mtcars)  #will give you the datatype

#x='a'
#class(x)

y= c(1,3.5,5) #concatenation
#class(y)   #will give you numeric type

#y = 1:5   #will initiate a vector

#class(as.integer(y)) #typeconversion

#as.integer(y)

print(y)



?str
summary(mtcars)




#vectors ---------


#Single Dimension of 1 datatype only


(x = 1:75)
#x  #print x or (x=1:50) will do initiation and print together

x[6]

(x4 = rnorm(n=100, mean=60, sd=10)) #way of creating normally distributed values with the given figures

plot(x) #plot any functin

plot(density(x4))
hist(x4)  #histogram
hist(x4, breaks=24, col = 1:24)    #histogram with colour


range(x4);max(x4)  #semicolon executes both together
mean(x4);median(x4)
boxplot(x4)    

plot(sort(x4),type="l")
plot(x4, type='l')   #line plot

(mean(x4[x4>65])) #mean of values greater than 64

x4[1:10]
x4[-c(1:10)] #prints all values except 1 to 10

x4[x4>65]
length(x4[x4>65])   #gives the no. of data grtr than 64
sum(x4>65)

rev(x4)

sum(19,67)


#matrices ----------
#2D of 1 datatype

data = c(10,20,30,40,50,60) #vector
(ml = matrix(data = data, nrow = 2))   #matrix
#(ml = matrix(data =data, nrow=2, byrow=T))  #row wise

rownames(ml) = c('R1','R2')
colnames(ml) = c('C1','C2','C3')

ml

ml[2,3]
ml['R1',]   #print the first row

ml[,'C1']

colSums(ml)
rowSums(ml)

colMeans(ml)
rowMeans(ml)


apply(ml,1,FUN=min) # 2nd para = 1 for row, 2 for col
apply(ml,2,FUN=max)       #APPLY FUNCTION


apply(ml[, 'C2', drop=F],2,FUN=max) #to find a max in a particular column



#dataframe
(rollno = paste('IIML',1:13,sep = '-'))
(name=paste('Student',1:13,sep ='&'))
(age = round(runif(13,min=24,max=32),2))   #uniform distribution
(marks = trunc(rnorm(13, mean=60,sd =10)))   #nrmal
(gender = sample(c('M','F'),size=13,replace=T,prob=c(.7,.3)))  #replace true?
table(gender)     #since the sample size is very samll, it wont fllow the same propotion each time you are executing
                    #hence applying seed command
set.seed(345)  #kuch bhi pos value chalega as param
(grade = sample(c('Ex','Good','Sat'), size=13, replace=T, prob=c(.6,.3,.1)))
table(grade)    # gives in numbers
prop.table(table(grade))   #Gives in propotion 
sapply(list(rollno,name,age,marks,gender,grade),length)

(students = data.frame(rollno,name,age,marks,gender,grade, stringsAsFactors = F)) #StringAsFactor ensures all string values not converted to Factors



write.csv(students,'data/students.csv', row.names=F) #importing the data to an excel file in the folder data;
                      #rownames kept false to avoid listing the rownames

(df1 = read.csv('data/students.csv'))   #fetchback the data from a local excel file


(df2=read.csv('https://raw.githubusercontent.com/DUanalytics/rAnalytics/master/data/students.csv'))
   #fetchback the data from the given url


(df3 = read.csv(file.choose()))   #when you dont know the clear path of the local file


#installing the deployer library --- from the package menu

library(dplyr)  #loading library

students %>% group_by(gender) %>% tally()   #piping operator %>%  tally counts
students %>% group_by(gender) %>% summarise(mean(age), n(), min(marks),max(marks))
students %>% group_by(gender,grade) %>% summarise(mean(age))


students %>% group_by(grade) %>% summarise(mean(age))

class(students)
summary(students)
students$gender = factor(students$gender)  #creating gender as factor from string
str(students)
students$grade = factor(students$grade, ordered=T, levels=c('Ex','Sat','Good'))
str(students)



#try from the git file of sir-----IIM/ld4-dplyr.R







