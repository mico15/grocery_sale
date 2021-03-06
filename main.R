setwd("D:/kaggle/grocery_sale")
raw.train <- read.csv("train.csv", header=T)
raw.test <- read.csv("test.csv", header=T, 
                     colClasses = c("integer", "Date", "integer", "integer", "logical"), 
                     col.names = c("id", "date", "store_nbr", "item_nbr", "onpromotion"))
raw.holidays <- read.csv("holidays_events.csv", header=T,
                         colClasses = c("Date", "factor", "factor", "character", "character", "logical"), 
                         col.names = c("date", "type", "locale", "locale_name", "description", "transferred"))
raw.items <- read.csv("items.csv", header=T,
                      colClass = c("integer", "factor", "integer", "integer"), 
                      col.names = c("item_nbr", "family", "class", "perishable"))
raw.oil <- read.csv("oil.csv", header=T, 
                    colClass = c("Date", "numeric"), 
                    col.names = c("date", "dcoilwtico"))
raw.stores <- read.csv("stores.csv", header=T, 
                       colClass = c("integer", "factor", "factor", "factor", "factor"), 
                       col.names = c("store_nbr", "city", "state", "type", "cluster"))
raw.transactions <- read.csv("transactions.csv", header=T, 
                             colClass = c("Date", "integer", "integer"), 
                             col.names = c("date", "store_nbr", "transactions"))


library("dplyr")
mydat <- raw.train[(nrow(raw.train)-10**6):nrow(raw.train), ] %>% 
  mutate(date = as.Date(date, format="%Y-%m-%d")) %>%
  filter(., date >= 2017-08-01)
