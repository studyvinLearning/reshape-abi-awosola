data(federalistPapers, package='syllogi') #the federalist paper data

#fed.list <- federalistPapers

#Create a data frame that paper number, author, journal, date
#Determine the day of the week that each paper was published.
#Get the count of papers by day of the week and author
#create a new data frame that has authors as column names and dates of publication as the values



collection <- list()

for (i in 1:length(federalistPapers)) {
 collection[[i]] <- federalistPapers[[i]]$meta
}

# Extracting data from the list
numbers <- sapply(collection, function(x) x$number)
authors <- sapply(collection, function(x) x$author)
journals <- sapply(collection, function(x) x$journal)
dates <- sapply(collection, function(x) x$date)


# Creating a data frame
df <- data.frame(Number = numbers,
                 Author = authors,
                 Journal = journals,
                 stringsAsFactors = FALSE)

df$Date <- as.Date(dates)

# The day of the week that each paper was published
df$Week_Day <- weekdays(df$Date)

head(df)

# The count of papers by day of the week and author
aggregate(Journal ~ Week_Day + Author, data = df, FUN = length)

#  New data frame that has authors as column names and dates
# of publication as the values
dates_author <- split(df$Date, df$Author)

author_date_freq <- sapply(dates_author, length)

Names <- names(dates_author)


# Create a data frame combining authors and dates
dates_author_df <- data.frame(
  Author = rep(Names, author_date_freq),
  Date = unlist(dates_author),
  row.names = NULL
)

# convert Date column to Date format
dates_author_df$Date <- as.Date(dates_author_df$Date)

head(dates_author_df)


library(tidyr)

# Makes a row index to ensure unique rows after spreading
dates_author_df$row_index <- seq_len(nrow(dates_author_df))

# Spreads or changes the data into wide data type
wide_df <- spread(dates_author_df, Author, Date)

wide_df