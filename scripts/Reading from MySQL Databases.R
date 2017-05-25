# 4.13 Reading from MySQL Databases
# Problem
# You want access to data stored in a MySQL database.
# 
# Solution
# Install the RMySQL package on your computer.
# Open a database connection using the dbConnect function.
# Use dbGetQuery to initiate a SELECT and return the result sets.
# Use dbDisconnect to terminate the database connection when you are done.
# Discussion
# This recipe requires that the RMySQL package be installed on your computer. 
# That package requires, in turn, the MySQL client software. 
# If the MySQL client software is not already installed and configured, consult the MySQL documentation or your 
# system administrator.
# 
# Use the dbConnect function to establish a connection to the MySQL database. 
# It returns a connection object which is used in subsequent calls to RMySQL functions:
  
library(RMySQL)
con <- dbConnect(MySQL(), user="userid", password="pswd",
                 host="hostname", client.flag=CLIENT_MULTI_RESULTS)

# Setting client.flag=CLIENT_MULTI_RESULTS is necessary to correctly handle multiple result sets.
# Even if your queries return a single result set, you must set client.flag this way because MySQL might include 
# additional status result sets after your data.
# The username, password, and host parameters are the same parameters used for accessing MySQL
# through the mysql client program. 
# The example given here shows them hard-coded into the dbConnect call. 
# Actually, that is an ill-advised practice. It puts your password out in the open, creating a security problem.
# It also creates a major headache whenever your password or host change, requiring you to hunt down the hard-coded values.
# I strongly recommend using the security mechanism of MySQL instead. 
# Put those three parameters into your MySQL configuration file, which is $HOME/.my.cnf on Unix and C:\my.cnf on Windows.
# Make sure the file is unreadable by anyone except you. 
# The file is delimited into sections with markers such as [client]. 
# Put the parameters into the [client] section, so that your config file will contain something like this:
  
[client]
user = userid
password = password
host = hostname

# Once the parameters are defined in the config file, you no longer need to supply them in the dbConnect call, which then becomes much simpler:
  
con <- dbConnect(MySQL(), client.flag=CLIENT_MULTI_RESULTS)

# Use the dbGetQuery function to submit your SQL to the database and read the result sets.
# Doing so requires an open database connection:
  
sql <- "SELECT * from SurveyResults WHERE City = 'Chicago'"
rows <- dbGetQuery(con, sql)

# You will need to construct your own SQL query, of course; this is just an example.
# You are not restricted to SELECT statements. Any SQL that generates a result set is OK.
# I generally use CALL statements, for example, because all my SQL is encapsulated in stored procedures
# and those stored procedures contain embedded SELECT statements.

# Using dbGetQuery is convenient because it packages the result set into a data frame and returns the data frame.
# This is the perfect representation of an SQL result set. 
# The result set is a tabular data structure of rows and columns, and so is a data frame.
# The result set's columns have names given by the SQL SELECT statement,
# and R uses them for naming the columns of the data frame.

# After the first result set of data, MySQL can return a second result set containing status information.
# You can choose to inspect the status or ignore it, but you must read it. Otherwise, MySQL will complain that there are unprocessed result sets and then halt. So call dbNextResult if necessary:
  
  if (dbMoreResults(con)) dbNextResult(con)
Call dbGetQuery repeatedly to perform multiple queries, checking for the result status after each call (and reading it, if necessary). When you are done, close the database connection using dbDisconnect:
  
  dbDisconnect(con)
Here is a complete session that reads and prints three rows from my database of stock prices. The query selects the price of IBM stock for the last three days of 2008. It assumes that the username, password, and host are defined in the my.cnf file:
  
  > con <- dbConnect(MySQL(), client.flag=CLIENT_MULTI_RESULTS)
> sql <- paste("select * from DailyBar where Symbol = 'IBM'",
               +              "and Day between '2008-12-29' and '2008-12-31'")
> rows <- dbGetQuery(con, sql)
> if (dbMoreResults(con)) dbNextResults(con)
> print(rows)
Symbol        Day       Next OpenPx HighPx LowPx ClosePx AdjClosePx
1    IBM 2008-12-29 2008-12-30  81.72  81.72 79.68   81.25      81.25
2    IBM 2008-12-30 2008-12-31  81.83  83.64 81.52   83.55      83.55
3    IBM 2008-12-31 2009-01-02  83.50  85.00 83.50   84.16      84.16
HistClosePx  Volume OpenInt
1       81.25 6062600      NA
2       83.55 5774400      NA
3       84.16 6667700      NA
> dbDisconnect(con)
[1] TRUE
See Also
See Recipe 3.9 and the documentation for RMySQL, which contains more details about configuring and using the package.

R can read from several other RDBMS systems, including Oracle, Sybase, PostgreSQL, and SQLite. For more information, see the R Data Import/Export guide, which is supplied with the base distribution (Recipe 1.6) and is also available on CRAN at http://cran.r-project.org/doc/manuals/R-data.pdf