1.   Find all the Toy Story movies:
Q:   SELECT * FROM movies where title like '%Toy Story%';
2.   Find all the movies directed by John Lasseter:
Q:   SELECT * FROM movies where director = 'John Lasseter'
3.   Find all the movies (and director) not directed by John Lasseter:
Q:   SELECT * FROM movies where director != 'John Lasseter';
4.   Find all the WALL-* movies:
Q:   SELECT * FROM movies where title like 'WALL-%';
5.   List all directors of Pixar movies (alphabetically), without duplicates:
Q:   SELECT distinct(director) AS director FROM movies order by director;
6.   List the last four Pixar movies released (ordered from most recent to least):
Q:   SELECT * from movies  order by year DESC limit 4;
7.   List the first five Pixar movies sorted alphabetically:
Q:   select * from movies  order by title ASC limit 5;
8.   List the next five Pixar movies sorted alphabetically:
Q:   select * from movies  order by title ASC limit 5,5;
9.   List all the Canadian cities and their populations:
Q:   SELECT city, population FROM north_american_cities where country = 'Canada';
10.  Order all the cities in the United States by their latitude from north to south :
Q:   select city, latitude from north_american_cities where country = 'United States' order by latitude DESC;
11.  List all the cities west of Chicago, ordered from west to east:
Q:   SELECT city FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude;
12.  List the two largest cities in Mexico (by population):
Q:   SELECT city from north_american_cities where country = 'Mexico' order by population DESC limit 2;
13.  List the third and fourth largest cities (by population) in the United States and their population:
Q:   SELECT city, population from north_american_cities WHERE country = 'United States' order by population DESC limit 2,2;
14.  Find the domestic and international sales for each movie:
Q:   select title, domestic_sales, international_sales from movies JOIN boxoffice on movies.id = boxoffice.movie_id;
15.  Show the sales numbers for each movie that did better internationally rather than domestically:
Q:   select title, international_sales, domestic_sales  from movies JOIN boxoffice on movies.id = boxoffice.movie_id where International_sales > Domestic_sales;
16.  List all the movies by their ratings in descending order:
Q:   select title, rating from movies join boxoffice on movies.id = boxoffice.movie_id order by rating DESC;
17.  Find the list of all buildings that have employees:
Q:   select distinct(building) AS building from employees;
18.  Find the name and role of all employees who have not been assigned to a building:
Q:   select name, role from employees where building is null;
19.  Find the names of the buildings that hold no employees :
Q:   SELECT DISTINCT building_name FROM buildings LEFT JOIN employees ON building_name = employees.building WHERE employees.building IS NULL;
20.  List all movies and their combined sales in millions of dollars:
Q:   SELECT DISTINCT(title), (domestic_sales+international_sales)/1000000 AS combined_sales FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;
21.  List all movies and their ratings in percent:
Q:   SELECT title, rating*10 AS ratings_in_percents from movies JOIN boxoffice ON movies.id = boxoffice.movie_id;
22.  List all movies that were released on even number years:
Q:   SELECT title, year from movies JOIN boxoffice ON movies.id = boxoffice.movie_id where year%2 = 0;
23.  Find the longest time that an employee has been at the studio:
Q:   SELECT * from employees order by years_employed DESC limit 1;
24.  For each role, find the average number of years employed by employees in that role:
Q:   SELECT role, avg(years_employed) AS avg_years_employed from employees group by role;
25.  Find the total number of employee years worked in each building:
Q:   SELECT building, sum(years_employed) AS sum_years_worked from employees group by building;
26.  Find the number of Artists in the studio (without a HAVING clause):
Q:   SELECT count(*) AS number_of_artists from employees where role = 'Artist';
27.  Find the number of Employees of each role in the studio:
Q:   SELECT role, count(*) AS number_of_each_role from employees group by role; 
28.  Find the total number of years employed by all Engineers:
Q:   SELECT role, sum(years_employed) from employees where role = 'Engineer';
29.  Find the number of movies each director has directed :
Q:   SELECT director, count(distinct(title)) AS number_of_movies FROM movies group by director;
30.  Find the total domestic and international sales that can be attributed to each director:
Q:   SELECT director, sum(domestic_sales + international_sales) as total from movies join boxoffice on movies.id = boxoffice.movie_id group by director;
31.  Add the studios new production, Toy Story 4 to the list of movies (you can use any director):
Q:   INSERT INTO movies VALUES (4, "Toy Story 4", "John Lasseter", 2024, 100);
32.  Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice tableL:  
Q:   INSERT INTO Boxoffice VALUES (4, 8.7, 340000000, 270000000);
33.  The director for A Bugs Life is incorrect, it was actually directed by John Lassete:
Q:   UPDATE movies SET director = 'John Lasseter' WHERE id = 2;
34.  The year that Toy Story 2 was released is incorrect, it was actually released in 1999:
Q:   UPDATE movies SET year = 1999 WHERE title = 'Toy Story 2';
35.  Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich:
Q:   UPDATE movies SET title = 'Toy Story 3' and director = 'Lee Unkrich' WHERE id = 11;
36.  This database is getting too big, lets remove all movies that were released before 2005:
Q:   DELETE FROM movies where year < 2005;
37.  Andrew Stanton has also left the studio, so please remove all movies directed by him:
Q:   DELETE FROM movies where director = 'Andrew Stanton';
38.  Create a new table named Database with the following columns:
     *Name A string (text) describing the name of the database
     *Version A number (floating point) of the latest version of this database
     *Download_count An integer count of the number of times this database was downloaded
Q:   CREATE TABLE Database (
     name text,
     version float,
     download_count int );
39.  Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in:
Q:   ALTER TABLE movies add column aspect_ratio float;
40.  Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English:
Q:   Alter table movies add column language text default 'English';
41.  clean up by removing the Movies table:
Q:   DROP table movies;
42.  drop the BoxOffice table:
Q:   DROP table boxoffice;