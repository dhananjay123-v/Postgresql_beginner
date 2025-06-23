/*
Question: What skills are required for the top-paying data analyst jobs? 
Use the top 10 highest-paying Data Analyst jobs from first query
Add the specific skills required for these roles Why? 
It provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries
*/


SELECT
    company.company_id,
    company.name as company_name,
    job_title_short as Jobs,
    salary_year_avg as salary,
    t1.skills
 
FROM
    job_postings_fact as jobs
LEFT JOIN company_dim as company ON jobs.company_id=company.company_id
LEFT JOIN skills_job_dim as t2 ON jobs.job_id=t2.job_id
LEFT JOIN skills_dim as t1 ON t2.skill_id=t1.skill_id
WHERE
    jobs.job_title_short='Data Analyst'
    AND salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10



-- CTEs

WITH top_jobs AS (
    SELECT
        jobs.job_id,
        company.name AS company_name,
        jobs.job_title AS job_title,
        jobs.salary_year_avg AS salary
    FROM
        job_postings_fact AS jobs
    LEFT JOIN company_dim AS company ON jobs.company_id = company.company_id
    WHERE
        jobs.job_title_short = 'Data Analyst'
        AND jobs.job_location = 'Anywhere'
        AND jobs.salary_year_avg IS NOT NULL
    ORDER BY
        jobs.salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_jobs.job_id,
    top_jobs.company_name,
    top_jobs.job_title,
    top_jobs.salary,
    skills_dim.skills AS skill
FROM
    top_jobs
INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_jobs.salary DESC;

