/*
I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.
Put salary into different buckets
Define what's a high, standard, or low salary with our own conditions
Why? It is easy to determine which job postings are worth looking at based on salary. 
Bucketing is a common practice in data analysis when viewing categories.
I only want to look at data analyst roles
Order from highest to lowest
*/

-- mine
SELECT
    salary_year_avg as salary,
    CASE
        when salary_year_avg > 100000 then 'Data Scientist'
        when salary_year_avg BETWEEN 50000 AND 80000 then 'Data Analyst'
        else 'Business Analyst'
    end as salary_wise
FROM
    job_postings_fact
WHERE
    job_title_short='Data Analyst'
ORDER BY    
    salary_wise DESC;


-- copilot
SELECT 
    salary_year_avg AS salary, 
    CASE 
        WHEN salary_year_avg > 100000 THEN 'High' 
        WHEN salary_year_avg BETWEEN 50000 AND 80000 THEN 'Standard' 
        ELSE 'Low' 
    END AS salary_bucket 
FROM job_postings_fact 
WHERE job_title_short = 'Data Analyst' 
ORDER BY salary DESC;


--comment 

SELECT 
    salary_year_avg,
    job_title_short,
    CASE
        WHEN salary_year_avg = 650000.0 THEN 'highest_salary'
        WHEN salary_year_avg = 25000.0 THEN 'lowest_salary'
        ELSE 'standard'
    END AS salary_range
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC