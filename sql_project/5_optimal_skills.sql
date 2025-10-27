/*
- Note: salary figures are in USD ($).
*/

/*
Question: Which skills are both in high demand and associated with strong average salaries for data roles in Cape Town, Durban, and Johannesburg?
- Focus on Data Scientist, Data Analyst, and Data Engineer roles.
- Include only job postings with specified (non-NULL) annual salaries.
- Calculate demand frequency and average salary per skill.
- Filter to skills with more than 10 job postings to ensure relevance.
- Return skills sorted by demand count in descending order.
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short IN('Data Scientist', 'Data Analyst', 'Data Engineer') AND 
            job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
            salary_year_avg IS NOT NULL 
    GROUP BY 
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short IN('Data Scientist', 'Data Analyst', 'Data Engineer') AND 
        job_location IN ('Cape Town, South Africa', 'Durban, South Africa', 'Johannesburg, South Africa') AND
        salary_year_avg IS NOT NULL
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC

/*

Results:

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "41",
    "avg_salary": "100669.05"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "21",
    "avg_salary": "104516.83"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "14",
    "avg_salary": "116585.07"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "12",
    "avg_salary": "93548.21"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "12",
    "avg_salary": "93548.21"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "11",
    "avg_salary": "75694.32"
  }
]
*/