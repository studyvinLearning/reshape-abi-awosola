[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/xHqu4j_w)


In ths exercise,

1. We use data(federalistPapers, package='syllogi') to get the federalist paper data
   in order to:
* Create a data frame with paper number, author, journal, date;

* determine the day of the week that each paper was published;
  
* get the count of papers by day of the week and author; and
  
* create a new data frame that has authors as column names and dates of publication as the 
  values.

2. We downloaded and read in the givren bloodPressure.RDS file which has each row as the

   information of a person. Blood pressure is measured with two values: systolic and diastolic
   
   each persons blood pressure was measured every day for a month.

We:

* reshape the data to only have 4 columns: person, date, systolic/diastolic, and the value;

* fix the date to be in the nice format for R; and

* calculate the mean diastolic and the mean systolic by the days of the week.
