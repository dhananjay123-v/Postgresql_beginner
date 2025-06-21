/*  
Find the companies that have the most job openings.
Get the total number of job postings per company id (job_posting_fact)
Return the total number of jobs with the company name (company_dim)
*/


-- without CTEs
SELECT  
    jobs.company_id,
    company.name as company_name,
    count(jobs.job_id) as total_jobs
FROM    
    job_postings_fact as jobs
INNER JOIN company_dim as company on jobs.company_id=company.company_id
GROUP BY    
    jobs.company_id,
    company.name
ORDER BY    
    total_jobs DESC




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
    company_job_count.total_jobs
from    
    company_dim
left join company_job_count on company_job_count.company_id=company_dim.company_id
Order BY    
    company_job_count.total_jobs DESC