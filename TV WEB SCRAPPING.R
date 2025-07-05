#install packages(devtools)
#importing libraries
library(rvest)#harvest the data from web page
library(dplyr)#data manipulation
library(robotstxt)#download and pars text files
library(stringr)#to manipulate and transform string
#scrapping website
url<-"https://www.flipkart.com/search?q=led+tv+under+25000+&otracker=AS_Query_HistoryAutoSuggest_3_0&otracker1=AS_Query_HistoryAutoSuggest_3_0&marketplace=FLIPKART&as-show=on&as=off&as-pos=3&as-type=HISTORY"
#allowability
path=paths_allowed(url)
#HTML from the website
web=read_html(url)
View(web)
#SEGREGATING NAMES
names<- web  %>% html_nodes(".KzDlHZ")%>% html_text()
View(names)
#SEGREGATING PRICE
price<- web  %>% html_nodes("._4b5DiR")%>% html_text()
View(price)
#SEGREGATING OPERATING SYSTERM
os<- web  %>% html_nodes(".J\\+igdf:nth-child(1)")%>% html_text()
View(os)
#SEGREGATING HD QUALITY
hd<- web  %>% html_nodes(".J\\+igdf:nth-child(2)")%>% html_text()
View(hd)
#SEGREGATING LAUNCH YEAR
launch_year<- web  %>% html_nodes(".J\\+igdf:nth-child(3)")%>% html_text()
View(launch_year)
#SEGREGATING WARRANTY 
warranty<- web  %>% html_nodes(".J\\+igdf:nth-child(4)")%>% html_text()
View(warranty)
#create data frame
tv=data.frame(names,price,os,hd,launch_year,warranty)
View(tv)
#write the file
write.csv(tv,"flipcart_tv.csv")
#check data type
str(tv)



