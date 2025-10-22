/*
- Note: salary figures are in USD ($).
*/

/*
Question: What are the top-paying data roles in Cape Town, Durban, and Johannesburg?
- Focus on Data Scientist, Data Analyst, and Data Engineer roles.
- Include only jobs with specified (non-NULL) annual salaries.
- Limit to the top 10 highest-paying roles across the three cities.
- Enrich results by joining with associated skills for each job.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC