
#Download and read in the bloodPressure.RDS file

bld.Pres <- readRDS('bloodPressure.RDS')

#each row is a person
#blood pressure is measure with two values: systolic and diastolic
##each persons blood pressure was measured every day for a month
#reshape the data to only have 4 columns: person, date, systolic/diastolic, 
#and the value

#fix the date to be in the nice format for R
#calculate the mean diastolic and the mean systolic by the days of the week

bld.Pres[1,] #Person 1
bld.Pres[21,] #Person 21
bld.Pres[,1] # all row ids
str(bld.Pres)
class(bld.Pres)
dim(bld.Pres)

# Reshape the data to long format
long_dt <- reshape(bld.Pres,
                     direction = 'long',
                     v.names = 'value',
                     idvar = 'person',
                     times = names(bld.Pres)[-1],
                     varying = list(names(bld.Pres)[-1])
                     )

# Remove row names
row.names(long_dt) <- NULL


# Tidy column names, and create type column
long_dt <- within(long_dt, {
  date <- as.Date(sub('.*(2024-jan-[0-9]+).*', '\\1', time), format='%Y-%b-%d')
  type <- ifelse(grepl('systolic', time), 'systolic', 'diastolic')
  time <- NULL
})

head(long_dt)
tail(long_dt)


# Calculate the mean by day of the week
mn_by_day <- aggregate(value ~ weekdays(date) + type, data = long_dt, FUN = mean)
mn_by_day
