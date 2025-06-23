/*
Question: What are the most in-demand skills for data analysts?
Join job postings to inner join table similar to query 2
Identify the top 5 in-demand skills for a data analyst.
Focus on all job postings.
Why? Retrieves the top 5 skills with the highest demand in the job market,
 providing insights into the most valuable skills for job seekers.
*/

WITH job_count_skill AS (
    SELECT  
        skill_id,
        COUNT(*) AS skill_count
    FROM    
        skills_job_dim AS skill_tbl
    INNER JOIN 
        job_postings_fact AS jobs ON jobs.job_id = skill_tbl.job_id
    WHERE
        jobs.job_title_short='Data Analyst'
    GROUP BY    
        skill_id
)

SELECT 
    skills.skill_id as skill_id,
    skills as skills_name,
    skill_count as skills_Demand
FROM job_count_skill
INNER JOIN skills_dim as skills ON job_count_skill.skill_id=skills.skill_id
ORDER BY    
    skill_count DESC
LIMIT 5;
