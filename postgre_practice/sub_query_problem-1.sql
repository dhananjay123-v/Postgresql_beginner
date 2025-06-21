/*
Identify the top 5 skills that are most frequently mentioned in job postings. 
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table 
and then join this result with the skills_dim table to get the skill names.

*/

SELECT skills
FROM skills_dim
WHERE skill_id IN (
    SELECT skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(*) DESC
    LIMIT 5
);


