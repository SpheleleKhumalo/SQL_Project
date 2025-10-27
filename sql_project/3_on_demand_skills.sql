/*
- Note: salary figures are in USD ($).
*/

/*
Question: What are the top 5 most in-demand skills for high-paying data roles in Cape Town, Durban, and Johannesburg?
- Focus on roles titled Data Scientist, Data Analyst, and Data Engineer.
- Include only jobs located in the three specified cities.
- Count how many times each skill appears across qualifying job postings.
- Return the top 5 skills based on demand frequency.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short IN('Data Scientist', 'Data Analyst', 'Data Engineer') AND 
        job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa')  
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
Results:

[
  {
    "skills": "sql",
    "demand_count": "2255"
  },
  {
    "skills": "python",
    "demand_count": "1871"
  },
  {
    "skills": "sas",
    "demand_count": "932"
  },
  {
    "skills": "r",
    "demand_count": "892"
  },
  {
    "skills": "aws",
    "demand_count": "807"
  }
]
*/