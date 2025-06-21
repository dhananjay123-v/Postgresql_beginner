/*
Find the count of the number of remote job postings per skill
Display the top 5 skills by their demand in remote jobs
Include skill ID, name, and count of postings requiring the skill
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
        job_work_from_home = TRUE 
        --AND jobs.job_title_short='Data Analyst'         -- found specify job-title
    GROUP BY    
        skill_id
)

SELECT 
    skills.skill_id as skill_id,
    skills as skills_name,
    skill_count
FROM job_count_skill
INNER JOIN skills_dim as skills ON job_count_skill.skill_id=skills.skill_id
ORDER BY    
    skill_count DESC
LIMIT 5;


