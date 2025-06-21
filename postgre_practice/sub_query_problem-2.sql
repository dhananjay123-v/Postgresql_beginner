/*
Determine the size category ('Small', 'Medium', or 'Large')
 for each company by first identifying the number of job postings they have. 
 
 Use a subquery to calculate the total job postings per company.
    A company is considered 'Small' if it has less than 10 job postings,
    'Medium' if the number of job postings is between 10 and 50,
     and 'Large' if it has more than 50 job postings. 
     Implement a subquery to aggregate job counts per company before classifying them based on size.
*/

-- using CTEs 
with company_job_count as ( 
    SELECT  
        company_id,
        count(*) as total_jobs
    from
        job_postings_fact   
    GROUP BY
        company_id
)

SELECT  
    company_dim.company_id,
    company_dim.name,   
    company_job_count.total_jobs,
    CASE  
        WHEN company_job_count.total_jobs < 10 THEN 'Small'  
        WHEN company_job_count.total_jobs BETWEEN 10 AND 50 THEN 'Medium'  
        ELSE 'Large'  
    END AS size_category  

from    
    company_dim
left join company_job_count on company_job_count.company_id=company_dim.company_id
Order BY    
    company_job_count.total_jobs DESC



-- sub_query

SELECT  
    company_dim.company_id,  
    company_dim.name,  
    job_counts.total_jobs,  
    CASE  
        WHEN job_counts.total_jobs < 10 THEN 'Small'  
        WHEN job_counts.total_jobs BETWEEN 10 AND 50 THEN 'Medium'  
        ELSE 'Large'  
    END AS size_category  
FROM company_dim  
LEFT JOIN (
    SELECT company_id, COUNT(*) AS total_jobs  
    FROM job_postings_fact  
    GROUP BY company_id  
) AS job_counts ON job_counts.company_id = company_dim.company_id  
ORDER BY job_counts.total_jobs DESC;