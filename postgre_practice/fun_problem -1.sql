/*
Write a query to find the average salary both yearly (salary_year_ave)and hourly (salary hour_avg ) 
for job postings that were posted after June 1, 2023. Group the results by job schedule type.
*/

SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;