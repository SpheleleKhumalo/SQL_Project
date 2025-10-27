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

/*

Results CSV format:

"job_id","job_title","salary_year_avg","company_name","skills"
903380,"80405862 - Data Engineer","249000.0","Standard Bank Group","sql"
903380,"80405862 - Data Engineer","249000.0","Standard Bank Group","azure"
903380,"80405862 - Data Engineer","249000.0","Standard Bank Group","oracle"
903380,"80405862 - Data Engineer","249000.0","Standard Bank Group","hadoop"
327180,"Data Architect","165000.0","Luno","databricks"
327180,"Data Architect","165000.0","Luno","aws"
327180,"Data Architect","165000.0","Luno","spark"
631175,"Data Scientist (Machine Learning Modelling)","157500.0","Standard Bank Group","sql"
631175,"Data Scientist (Machine Learning Modelling)","157500.0","Standard Bank Group","python"
631175,"Data Scientist (Machine Learning Modelling)","157500.0","Standard Bank Group","r"
631175,"Data Scientist (Machine Learning Modelling)","157500.0","Standard Bank Group","sas"
631175,"Data Scientist (Machine Learning Modelling)","157500.0","Standard Bank Group","sas"
859102,"Data Scientist","157500.0","Luno","sql"
859102,"Data Scientist","157500.0","Luno","python"
859102,"Data Scientist","157500.0","Luno","r"
859102,"Data Scientist","157500.0","Luno","matlab"
859102,"Data Scientist","157500.0","Luno","redshift"
859102,"Data Scientist","157500.0","Luno","spark"
859102,"Data Scientist","157500.0","Luno","hadoop"
859102,"Data Scientist","157500.0","Luno","tableau"
859102,"Data Scientist","157500.0","Luno","looker"
859102,"Data Scientist","157500.0","Luno","cognos"
1230912,"Data Scientist","157500.0","Standard Bank Group","sql"
1230912,"Data Scientist","157500.0","Standard Bank Group","python"
1230912,"Data Scientist","157500.0","Standard Bank Group","r"
1230912,"Data Scientist","157500.0","Standard Bank Group","sas"
1230912,"Data Scientist","157500.0","Standard Bank Group","sas"
144346,"Manager, Data Engineering","155500.0","Standard Bank Group","sql"
144346,"Manager, Data Engineering","155500.0","Standard Bank Group","python"
144346,"Manager, Data Engineering","155500.0","Standard Bank Group","sas"
144346,"Manager, Data Engineering","155500.0","Standard Bank Group","sas"
1285010,"Supervisory Data Scientist","149946.5","U.S. Department of Labor","sql"
1285010,"Supervisory Data Scientist","149946.5","U.S. Department of Labor","sql server"
920628,"Data Engineer","147500.0","Standard Bank Group","sql"
920628,"Data Engineer","147500.0","Standard Bank Group","spark"
75917,"Analyst, Data Engineer","147500.0","Standard Bank Group","sql"
75917,"Analyst, Data Engineer","147500.0","Standard Bank Group","sass"
75917,"Analyst, Data Engineer","147500.0","Standard Bank Group","spark"
105925,"Manager, Data Engineer30","147500.0","Standard Bank Group","sql"
105925,"Manager, Data Engineer30","147500.0","Standard Bank Group","spark"

*/