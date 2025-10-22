/*
- Note: salary figures are in USD ($).
*/

/*
Question: What are the top-paying data roles in key South African cities?
- Identify the highest paying roles titled Data Scientist, Data Analyst, or Data Engineer.
- Focus only on job postings with specified (non-NULL) annual salaries.
- Filter results to Cape Town, Durban, and Johannesburg locations.
- Sort by salary in descending order to highlight top-paying opportunities.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short IN ('Data Scientist', 'Data Analyst', 'Data Engineer') AND 
    job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC



