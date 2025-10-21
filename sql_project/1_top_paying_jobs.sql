/*
- Note salary is in USD($) currency.
*/

/*
Question: What are top paying Data Scientist jobs?
- Identify the highest paying Data Scientist roles that are avilable Cape Town, Durban and Johannesburg.
- Focuses on jobs posting with specified salaries(remove NULL).
- Insight
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
    job_title_short = 'Data Scientist' AND 
    job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC

/*
Question: What are top paying Data Analyst jobs?
- Identify the highest paying Data Analyst roles that are avilable Cape Town, Durban and Johannesburg.
- Focuses on jobs posting with specified salaries(remove NULL).
- Insight
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
    job_title_short = 'Data Analyst' AND 
    job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC

/*
Question: What are top paying Data Engineer jobs?
- Identify the highest paying Data Engineer roles that are avilable Cape Town, Durban and Johannesburg.
- Focuses on jobs posting with specified salaries(remove NULL).
- Insight
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
    job_title_short = 'Data Engineer' AND 
    job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC

