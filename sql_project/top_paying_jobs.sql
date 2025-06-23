/*

Question:

What are the top-paying data analyst jobs?
Identify the top 10 highest-paying Data Analyst roles that are available remotely.
Focuses on job postings with specified salaries (remove nulls).
Why? Highlight the top-paying opportunities for Data Analysts, offering insights into emp

*/

SELECT
    company.company_id,
    company.name as company_name,
    job_title_short as Jobs,
    salary_year_avg as salary,
    job_work_from_home as remote_job
FROM
    job_postings_fact as jobs
LEFT JOIN company_dim as company ON jobs.company_id=company.company_id
WHERE
    job_title_short='Data Analyst'
    AND job_work_from_home is TRUE 
    AND salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
