/*
Write a query to find companies (include company name) that have posted jobs offering health insurance,
 where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter.
*/

SELECT 
    com.name,
    jobs.job_health_insurance,
    jobs.job_posted_date::date
FROM
    job_postings_fact as jobs
INNER JOIN company_dim as com on jobs.company_id=com.company_id
WHERE
    job_health_insurance = true AND
    EXTRACT(quarter from jobs.job_posted_date) = 2 AND
    EXTRACT(YEAR from jobs.job_posted_date) =2023
limit 100;