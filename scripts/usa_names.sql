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
--------------------------------------------------------------
--OR

SELECT gender, COUNT(*)
FROM names
GROUP BY gender
ORDER BY COUNT(*) DESC;

-------------------------------------------------------------------------------------------
-- 8.	What are the most popular male and female names overall (i.e., the most total registrations)?
-- multiple names with 139 registration each - Male
--multiple names with 139 registration each - Female
SELECT 
	name AS most_popular_name, 
	gender,
	COUNT(num_registered) AS total_registrations
FROM names
GROUP BY gender, name
ORDER BY total_registrations DESC;

-------------------------------------------------------------------------------------------
-- 9.	What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
F = Darrah, M = Jamarian, multiple entries with count =10
SELECT 
	name, 
	COUNT(*),
	gender
FROM names
WHERE year BETWEEN '2000' AND '2009'
GROUP BY name, gender
ORDER BY COUNT(*) DESC;

-------------------------------------------------------------------------------------------
-- 10.	Which year had the most variety in names (i.e. had the most distinct names)?
--Year 2008
SELECT 
	COUNT(DISTINCT name) AS variety,
	year
FROM names
GROUP BY year
ORDER BY variety DESC;

-------------------------------------------------------------------------------------------
-- 11.	What is the most popular name for a girl that starts with the letter X? - Xenia, 97 count
SELECT
	name,
	COUNT(*) AS count
FROM names
WHERE name ILIKE 'X%'
AND
gender = 'F'
GROUP BY name
ORDER BY count DESC;

-------------------------------------------------------------------------------------------
-- 12.	How many distinct names appear that start with a 'Q', but whose second letter is not 'u - 46
SELECT
	DISTINCT name,
	COUNT(*) AS count
FROM names
WHERE name ILIKE 'Q%'
AND name NOT ILIKE 'Qu%'
GROUP BY name
ORDER BY count DESC;

-------------------------------------------------------------------------------------------
-- 13.	Which is the more popular spelling between "Stephen" and "Steven"? 
--Use a single query to answer this question. - Stephen with 230 count.
SELECT
	name,
	COUNT(*) AS most_popuplar_spelling
FROM names
WHERE name = 'Stephen'
OR
name = 'Steven'
GROUP BY name
ORDER BY most_popuplar_spelling DESC;
	
-------------------------------------------------------------------------------------------
-- 14.	What percentage of names are "unisex" - that is what percentage of names have been used
--both for boys and for girls?--- Need help
SELECT
	DISTINCT name AS unisex_name,
	COUNT(DISTINCT gender) AS gender_count,
	(COUNT(DISTINCT name)*100/COUNT(name)) AS percentage
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) = 2
ORDER BY percentage DESC;

SELECT 
AVG(CASE WHEN gender = 'M' THEN 'male') AS male_count,
(CASE WHEN gender = 'F' THEN 'female') AS female_count
		 --ELSE 'most_unisex' END
FROM names;

------------------------------------------------------------------------------------------

-- 15.	How many names have made an appearance in every single year since 1880? 
-- how to find reoccurrence?
SELECT
	DISTINCT year,
	COUNT(name) 
	FROM names
WHERE 
	year BETWEEN 1880 AND 2018
GROUP BY name, year
ORDER BY year;
--------------------How many names have only appeared in one year?-----------------------------------------------------------------------

-- 16.	How many names have only appeared in one year?
SELECT 
	name, 
	year
FROM names
WHERE  



-------------------------------------------------------------------------------------------

-- 17.	How many names only appeared in the 1950s? -9279

SELECT
	COUNT(DISTINCT name)
FROM names
	WHERE year = '1950';

-------------------------------------------------------------------------------------------

-- 18.	How many names made their first appearance in the 2010s? 31627
SELECT
	COUNT(DISTINCT name)
FROM names
	WHERE year = '2010';
-------------------------------------------------------------------------------------------

-- 19.	Find the names that have not be used in the longest. - 3610
--"Iva"
--"Carolyn"
--"Lovey"
--"Clarabelle"
--"Victoria"
--"Hjalmer"

SELECT
	DISTINCT name
FROM names
	WHERE year < '1890';

-------------------------------------------------------------------------------------------

-- 20.	Come up with a question that you would like to answer using this dataset.
--Then write a query to answer this question.
--Find the count of names starting with different letter, A to Z. 
SELECT 
	COUNT(DISTINCT name)
FROM names
WHERE name ILIKE 'A%'
;

SELECT 
	COUNT(CASE WHEN name ILIKE 'A%' THEN 'A') 
	COUNT(CASE WHEN name ILIKE 'B%' THEN 'B') 
	END AS letter
FROM names;