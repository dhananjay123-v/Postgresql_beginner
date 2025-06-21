/*
Get the corresponding skill and skill type for each job posting in q1
Includes those without any skills, too
Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/

-- Left join

SELECT
    job_title_short as jobs_title,
    t1.skills,
    t1.type
FROM
    job_postings_fact as jobs
LEFT JOIN skills_job_dim as t2 ON  jobs.job_id=t2.job_id
LEFT JOIN skills_dim as t1 ON t2.skill_id=t1.skill_id
WHERE EXTRACT(QUARTER FROM jobs.job_posted_date) = 1
    and jobs.salary_year_avg > 70000


-- Union


-- Jobs WITH skills
SELECT 
    j.job_id,
    j.job_title,
    j.salary_year_avg,
    j.job_posted_date,
    s.skills,
    s.type AS skill_type
FROM job_postings_fact j
LEFT JOIN skills_job_dim sj ON j.job_id = sj.job_id
LEFT JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE EXTRACT(MONTH FROM j.job_posted_date) IN (1, 2, 3)
  AND j.salary_year_avg > 70000

UNION

-- Jobs WITHOUT skills (NULL skill info)
SELECT 
    j.job_id,
    j.job_title,
    j.salary_year_avg,
    j.job_posted_date,
    NULL AS skills,
    NULL AS type
FROM job_postings_fact j
LEFT JOIN skills_job_dim sj ON j.job_id = sj.job_id
WHERE sj.job_id IS NULL
  AND EXTRACT(MONTH FROM j.job_posted_date) IN (1, 2, 3)
  AND j.salary_year_avg > 70000;
