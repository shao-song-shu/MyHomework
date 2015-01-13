# 1. Run a t-test with the sleep data set
#   a. save the values as objects/variables first,
#      then supply as arguments to t.test()

# Determine the dependent variable and the levels of the dependent variable in the "sleep" dataframe
summary(sleep)
# Create an object (group1) that contains the values in the "extra" column in the "sleep" dataframe that correspond to "1" in the "group" column in the "sleep" dataframe
group1 <- sleep$extra[sleep$group == 1]
# Create an object (group2) that contains the values in the "extra" column in the "sleep" dataframe that correspond to "2" in the "group" column in the "sleep" dataframe
group2 <- sleep$extra[sleep$group == 2]
# Peform a t-test that compares group1 and group2
t.test(group1, group2)

#   b. try skipping that step and referring to the values directly

# Determine the dependent variable and the levels of the dependent variable in the "sleep" dataframe
summary(sleep)
# Perform a t-test that compares the values in the "extra" column in the "sleep" dataframe that correspond to "1" in the "group" column in the "sleep" dataframe and the values in the "extra" column in the "sleep" dataframe that correspond to "2" in the "group" column in the "sleep" dataframe
t.test(sleep$extra[sleep$group == 1], sleep$extra[sleep$group == 2])


# 2. Do the same thing with the "iris" data set
#    - compare sepal width
#    - all three pairwise comparisons

# Determine the dependent variable and the levels of the dependent variable in the "iris" dataframe
summary(iris)
# Create an object (setosa) that contains the values in the "Sepal.Width" column in the "iris" dataframe that correspond to "setosa" in the "Species" column in the "iris" dataframe
setosa <- iris$Sepal.Width[iris$Species == "setosa"]
# Create an object (versicolor) that contains the values in the "Sepal.Width" column in the "iris" dataframe that correspond to "versicolor" in the "Species" column in the "iris" dataframe
versicolor <- iris$Sepal.Width[iris$Species == "versicolor"]
# Create an object (virginica) that contains the values in the "Sepal.Width" column in the "iris" dataframe that correspond to "virginica" in the "Species" column in the "iris" dataframe
virginica <- iris$Sepal.Width[iris$Species == "virginica"]
# Peform a t-test that compares setosa and versicolor
t.test(setosa, versicolor)
# Peform a t-test that compares setosa and virginica
t.test(setosa, virginica)
# Peform a t-test that compares versicolor and virginica
t.test(versicolor, virginica)


# 3. Do the same thing again on "women" data
#    - compare the two columns
#    - (yes, this doesn't make much sense as a comparison,
#      it's just a programming exercise)

# Determine the dependent variable and the levels of the dependent variable in the "women" dataframe
summary(women)
# Perform a t-test that compares the "height" column in the "women" dataframe and the "weight" column in the "women" dataframe
t.test(women$height, women$weight)


# 4. Re-do "sleep" t-test (#1 above) as paired

# Determine the dependent variable and the levels of the dependent variable in the "sleep" dataframe
summary(sleep)
# Create an object (group1) that contains the values in the "extra" column in the "sleep" dataframe that correspond to "1" in the "group" column in the "sleep" dataframe
group1 <- sleep$extra[sleep$group == 1]
# Create an object (group2) that contains the values in the "extra" column in the "sleep" dataframe that correspond to "2" in the "group" column in the "sleep" dataframe
group2 <- sleep$extra[sleep$group == 2]
# Peform a pairwise t-test that compares group1 and group2
t.test(group1, group2, paired = TRUE)


# 5. Run a true "Student's" t.test for #1





# 6. Try the "formula" method for t.test()
#    a. Read the help
#    b. Look at the "formula" argument
#    c. Try to use that to replicate the results from #1 above

sleep.test <- t.test(extra ~ group, data = sleep)
save(sleep.test, file = "sleep_test.RData")

# 7. Run a Wilcoxon Signed Rank test for the comparisons
#    in #1 through #3
#    - use help.search to find a function to do this


# 8. Run a correlation test on the "women" data
#    a. Pearson
#    b. Spearman


# 9. save all results (and only those results!) in an
#    .RData object
#    - try to think of (at least) two ways to do this


# 10. clean, comment, and save this script with your answers


# 11. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
