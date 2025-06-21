/*
Write a query to count the number of job postings for each month in 2023,
 adjusting the Job_pasted date to be in 'America/New_York' time zone before extracting (hint) the month.
Assume the job_posted_date is stored in UTC. Group by and order by the month
*/

SELECT 
    COUNT(job_id) AS total_jobs,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS mon
    
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY 
    mon
ORDER BY 
    mon;