SELECT 
    job_title_short as jobs,
    job_location as location,
    --job_posted_date::date as date_only,
    job_posted_date at time zone 'UTC' at time zone 'IOT' as date,
    --EXTRACT(DAY from job_posted_date) as day,
    --EXTRACT(MONTH from job_posted_date) as month,
    --EXTRACT(YEAR from job_posted_date) as year
FROM 
    job_postings_fact
LIMIT 10;