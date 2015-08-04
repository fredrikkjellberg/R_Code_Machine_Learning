mtcars # Built-in R data set stored in a data frame

# Have a quick look at your data

#A data frame has the variables of a data set as columns and the observations as rows. This will be a familiar concept for those coming from different statistical software packages such as SAS or SPSS

head(mtcars)

#Another method that is often used to get a rapid overview of your data is the function str(). The function str() shows you the structure of your data set. For a data frame it tells you:
#The total number of observations (e.g. 32 car types)
#The total number of variables (e.g. 11 car features)
#A full list of the variables names (e.g. mpg, cyl … )
#The data type of each variable (e.g. num for car features)
#The first observations
str(mtcars)

#lets create our own data set!


planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune");
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883); 
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67);
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE);

# Create the data frame:
planets_df  <-data.frame(planets,type,diameter,rotation,rings)


#Similar to vectors and matrices, you select elements from a data frame with the help of square brackets [ ]. By using a comma, you can indicate what to select from the rows and the columns respectively. For example:
my_data_frame[1,2] #selects from the first row in my_data_frame the second element.
#my_data_fram[row,column]
my_data_frame[1:3,2:4] #selects rows 1,2,3 and columns 2,3,4 in my_data_frame.
#Sometimes you want to select all elements of a row or column. To do this, you can use the follwing. my_data_frame[1, ] selects all elements of the first row. Let us now apply this technique on planets_df!

head(planets_df)
planets_df
# All data from the first three planets
closest_planets_df <- planets_df[1:3,]

# All data from the last three planets
furthest_planets_df <- planets_df[6:8,]

# Have a look:
closest_planets_df
furthest_planets_df

#Maybe you want to select only the first 3 elements of the variable 'type'. One way to do this is: 
planets_df[1:3,1] #. A possible disadvantage of this approach is that you have to know (or look up) the position of the variable 'type', which gets hard if you have a lot of variables. It is often easier to just make use of the variable name, e.g. 
planets_df[1:3,"type"]. # where type = type in datafram

#so for exmaple if I want to select last 6 from diam
# Do selection on both rows and columns
furthest_planets_diameter <- planets_df[3:8,"diameter"]
