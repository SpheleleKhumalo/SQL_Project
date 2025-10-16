SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date:: DATE AS date 
FROM 
    job_postings_fact
LIMIT 10;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'Africa/Johannesburg' AS date_time 
FROM 
    job_postings_fact
LIMIT 10;