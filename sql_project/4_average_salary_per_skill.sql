/*
- Note: salary figures are in USD ($).
*/

/*
Question: Which skills are associated with the highest average salaries for data roles in Cape Town, Durban, and Johannesburg?
- Focus on Data Scientist, Data Analyst, and Data Engineer roles.
- Include only job postings with specified (non-NULL) annual salaries.
- Calculate the average salary for each skill across qualifying roles.
- Return the top 10 skills ranked by highest average salary.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN('Data Scientist', 'Data Analyst', 'Data Engineer') AND 
    job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 10