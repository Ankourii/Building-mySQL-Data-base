# Building-mySQL-Data-base:
## This project consists in creating a Data-base for a video rental shop in mySQL.

![vrs](https://s.hdnux.com/photos/01/17/43/33/20854464/7/rawImage.jpg)

For this project I have 7 .csv files that I need to create a Data-base in mySQL with. 


The files are:


_actor.csv_

_category.csv_

_film.csv_

_inventory.csv_

_language.csv_

_old_HDD.csv_

_rental.csv_



**Step 1**: Clean the .csv files. See **notebooks** folder for this.

**Step 2**: Create the Data-base. See **creating_and_seeding.sql** in **mySQL** folder for this. 

**Step 3**: Add the data to the Data-base. See **creating_and_seeding.sql** in **mySQL** folder for this.

**Step 4**: Use queries to make observations about the Data-base. See **queries.sql** in **mySQL** folder for this.

**Step 5**: Use the results of the queries to make graphs. See **notebooks** folder for this. 

## Notes:

I did not use file language.csv since all the films where in English so there was no need to specify the language. 
I used old_HDD just so I could merge actor and film, and film and category. 
I removed constant columns from all dataframes. 
I added 3 columns in rental.csv (one column for the day of the week films were rented, one for the day of the week they were returned and one for how long each film was kept by the customer).

# Observations:
*The 3 actors that appear the most in the films in the video rental store are "Sandra Kilmer", "Uma Wood" and "Val Bolger".
*Animation is the most popular category for films in the video store. Followed by Sports and Horror. Games category is the least popular. 
*Saturday, Sunday and Thursday are the busiest days for renting a film at the video store. Tuesday is the least busy. 
*The most popular days for returns are Mondays, Fridays and Wednesdays and the least popular are Saturdays. 


