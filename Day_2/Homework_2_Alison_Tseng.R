# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

AlisonTsengData <- read.csv("/Users/Ian/Documents/R_Class/Day_2/Data.csv")


# 2. Peek at the top few rows

head(AlisonTsengData, 10)
# Also head(AlisonTsengData)


# 3. Peek at the top few rows for only a few columns

AlisonTsengData[1:10, c(2, 4, 5, 6)]
# Also head(AlisonTsengData[ , c(2, 4, 5, 6)])


# 4. How many rows does your data have?

length(AlisonTsengData$ENGLISH_WORD)
# Also nrow(AlisonTsengData)
# There are 1307 rows in my data set


# 5. Get a summary for every column

summary(AlisonTsengData)


# 6. Get a summary for one column

summary(AlisonTsengData$ENGLISH_WORD)
# Also summary(AlisonTsengData[ , "ENGLISH_WORD"])
# Also summary(AlisonTsengData["ENGLISH_WORD"])
# Also summary(AlisonTsengData[["ENGLISH_WORD"]])
# Also summary(AlisonTsengData[ , 2])
# Also summary(AlisonTsengData[2])
# Also summary(AlisonTsengData[[2]])


# 7. Are any of the columns giving you unexpected values?

# Not anymore (saving the Excel file as a CSV file did not initially work properly, and every column had an NA).


# 8. Select a few key columns, make a vector of the column names

# Vector of values in four columns.
c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
# Why did the above command dummy code my categorical variables? When I removed AlisonTsengData$NUMBER_OF_TRANSLATIONS, the command also dummy coded my variables.

# Vector of column names.
c("AlisonTsengData$ENGLISH_WORD", "AlisonTsengData$NUMBER_OF_TRANSLATIONS", "AlisonTsengData$AMBIGUITY", "AlisonTsengData$AMBIGUITY_SOURCE")
# Also columns <- c("AlisonTsengData$ENGLISH_WORD", "AlisonTsengData$NUMBER_OF_TRANSLATIONS", "AlisonTsengData$AMBIGUITY", "AlisonTsengData$AMBIGUITY_SOURCE")


# 9. Create a new data.frame with just that subset of columns
#    from #8
#    - do this in at least TWO different ways

library(dplyr)

ShortenedData <- c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
New1 <- data.frame(ENGLISH_WORD = ShortenedData[1:1307], NUMBER_OF_TRANSLATIONS = ShortenedData[1308:2614], AMBIGUITY = ShortenedData[2615:3921], AMBIGUITY_SOURCE = ShortenedData[3922:5228])
New1

New2 <- data.frame(ENGLISH_WORD = AlisonTsengData$ENGLISH_WORD, NUMBER_OF_TRANSLATIONS = AlisonTsengData$NUMBER_OF_TRANSLATIONS, AMBIGUITY = AlisonTsengData$AMBIGUITY, AMBIGUITY_SOURCE = AlisonTsengData$AMBIGUITY_SOURCE)
New2

# Also New <- AlisonTsengData[ , columns]


# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8

# Data frame with two columns.
ShortenedData <- c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
New3 <- data.frame(Column1 = ShortenedData[1:10], Column2 = ShortenedData[5219:5228])
New3

# Data frame with one column.
ShortenedData <- c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
New4 <- data.frame(Column1 = ShortenedData[c(1:10, 5219:5228)])
New4


# 11. Create a new data.frame that is a random sample of half of the rows.

# Data frame with two columns.
ShortenedData <- c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
New5 <- data.frame(Column1 = sample(ShortenedData, 1307), Column2 = sample(ShortenedData, 1307))
New5

# Data frame with one column.
ShortenedData <- c(AlisonTsengData$ENGLISH_WORD, AlisonTsengData$NUMBER_OF_TRANSLATIONS, AlisonTsengData$AMBIGUITY, AlisonTsengData$AMBIGUITY_SOURCE)
New6 <- data.frame(Column1 = sample(ShortenedData, 2614))
New6

# 12. Find a comparison in your data that is interesting to make

# I do not need a non-default test.

# Vector Method.
Ambiguous <- AlisonTsengData$NUMBER_OF_TRANSLATIONS[AlisonTsengData$AMBIGUITY == "Ambiguous"]
Unambiguous <- AlisonTsengData$NUMBER_OF_TRANSLATIONS[AlisonTsengData$AMBIGUITY == "Unambiguous"]
AvU_Vector <- t.test(Ambiguous, Unambiguous)
save(AvU_Vector, file = "AvU_Vector.RData")

# Formula Method.
AvU_Formula <- t.test(NUMBER_OF_TRANSLATIONS ~ AMBIGUITY, data = AlisonTsengData)
save(AvU_Formula, file = "AvU_Formula.RData")

# 13. Repeat #12 for TWO more comparisons

# I do not need a non-default test.

# Vector Method.
Form <- AlisonTsengData$NUMBER_OF_TRANSLATIONS[AlisonTsengData$AMBIGUITY_SOURCE == "Form"]
Meaning <- AlisonTsengData$NUMBER_OF_TRANSLATIONS[AlisonTsengData$AMBIGUITY_SOURCE == "Meaning"]
Form_Meaning <- AlisonTsengData$NUMBER_OF_TRANSLATIONS[AlisonTsengData$AMBIGUITY_SOURCE == "Form and Meaning"]
FvM <- t.test(Form, Meaning)
save(FvM, file = "FvM.RData")
FvFM <- t.test(Form, Form_Meaning)
save(FvFM, file = "FvFM.RData")
MvFM <- t.test(Meaning, Form_Meaning)
save(MvFM, file = "MvFM.RData")

# I cannot do the formula method because the formula method requires exactly two levels of the independent variable, and there are three levels of the AMBIGUITY_SOURCE independent variable.


# 14. Save all results from #12 and #13 in an .RData file

Homework_2_Alison_Tseng <- c(AvU_Vector, AvU_Formula, FvM, FvFM, MvFM)
save(Homework_2_Alison_Tseng, file = "Homework_2_Alison_Tseng.RData")
Homework_2_Alison_Tseng


# 15. Email me your version of this script, PLUS the .RData
#     file from #14
