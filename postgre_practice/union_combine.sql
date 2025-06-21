/*
Find job postings from the first quarter that have a salary greater than $70K
Combine job posting tables from the first quarter of 2023 (Jan-Mar)
Gets job postings with an average yearly salary > $70,000
1
5
*/

/* -- use this to create table for Q1
-- Q1 Jobs (Jan, Feb, Mar)
CREATE TABLE q1_jobs AS
SELECT * FROM job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023 and
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3);
*/


SELECT
    *
FROM q1_jobs
WHERE
    salary_year_avg > 70000


-- sub_query

SELECT 
    * 
FROM 
(
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL 
    SELECT *  FROM march_jobs
) as q1_table
WHERE 
    salary_year_avg > 70000