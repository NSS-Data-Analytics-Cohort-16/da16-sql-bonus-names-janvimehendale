-- SQL Names
-- Save a script containing the query you used to answer each question and your answer (as a comment).
-- 1.	How many rows are in the names table? 1957046
SELECT 
	COUNT(*)
FROM names;
-------------------------------------------------------------------------------------------
-- 2.	How many total registered people appear in the dataset? 1957046
SELECT 
	COUNT(num_registered) AS total_registered
FROM names;
--------------------------------------------------------------------------------------------
-- 3.	Which name had the most appearances in a single year in the dataset?
--The names appeared twice in the respective years
SELECT 
	name,
	COUNT(name) AS most_appearance, year
FROM names
GROUP BY name, year
ORDER BY most_appearance DESC, year;

-------------------------------------------------------------------------------------------

-- 4.	What range of years are included?
--1880-2018
SELECT
	MIN(year) AS min_year,
	MAX(year) AS max_year
FROM names;
-------------------------------------------------------------------------------------------

-- 5.	What year has the largest number of registrations?
-- Year 2008 has the max registrations - 35079
SELECT
	year,
	COUNT(num_registered) AS no_of_registrations
FROM names
GROUP BY year
ORDER BY no_of_registrations DESC;

-------------------------------------------------------------------------------------------

-- 6.	How many different (distinct) names are contained in the dataset? - 98400
SELECT
	COUNT(DISTINCT name)
FROM names;

-------------------------------------------------------------------------------------------
-- 7.	Are there more males or more females registered?
--Males - 800519 , Females - 1156527, so more females

SELECT 
	COUNT(*) FILTER (WHERE gender= 'M') AS male_count,
	COUNT(*) FILTER (WHERE gender= 'F') AS female_count
FROM names;
	
-------------------------------------------------------------------------------------------

-- 8.	What are the most popular male and female names overall (i.e., the most total registrations)?
--481 names with 139 registration each - Male
--446 names with 139 registration each - Female
SELECT 
	name, 
	COUNT(name) As male_name
FROM names
WHERE gender = 'M'
GROUP BY name
ORDER BY male_name DESC;

SELECT 
	name, 
	COUNT(name) As female_name
FROM names
WHERE gender = 'F'
GROUP BY name
ORDER BY female_name DESC;


SELECT 
	name,
	COUNT(name) FILTER (WHERE gender= 'M') AS most_popular_male, 
	COUNT(name) FILTER (WHERE gender= 'F') AS most_popular_female
FROM names
GROUP BY name
ORDER BY COUNT(name) DESC;

-------------------------------------------------------------------------------------------
-- 9.	What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

-------------------------------------------------------------------------------------------

-- 10.	Which year had the most variety in names (i.e. had the most distinct names)?

-------------------------------------------------------------------------------------------

-- 11.	What is the most popular name for a girl that starts with the letter X?

-------------------------------------------------------------------------------------------

-- 12.	How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

-------------------------------------------------------------------------------------------

-- 13.	Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

-------------------------------------------------------------------------------------------

-- 14.	What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

-------------------------------------------------------------------------------------------

-- 15.	How many names have made an appearance in every single year since 1880?

-------------------------------------------------------------------------------------------

-- 16.	How many names have only appeared in one year?

-------------------------------------------------------------------------------------------

-- 17.	How many names only appeared in the 1950s?

-------------------------------------------------------------------------------------------

-- 18.	How many names made their first appearance in the 2010s?

-------------------------------------------------------------------------------------------

-- 19.	Find the names that have not be used in the longest.

-------------------------------------------------------------------------------------------

-- 20.	Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.