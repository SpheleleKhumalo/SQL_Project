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


/*
Results CSV format

"job_id","job_title","job_location","job_schedule_type","salary_year_avg","job_posted_date","company_name"
903380,"80405862 - Data Engineer","Johannesburg, South Africa","Full-time","249000.0","2023-05-12 12:00:29","Standard Bank Group"
327180,"Data Architect","Johannesburg, South Africa","Full-time","165000.0","2023-03-23 15:34:43","Luno"
631175,"Data Scientist (Machine Learning Modelling)","Johannesburg, South Africa","Full-time","157500.0","2023-06-08 02:56:57","Standard Bank Group"
1230912,"Data Scientist","Johannesburg, South Africa","Full-time","157500.0","2023-02-11 19:22:49","Standard Bank Group"
859102,"Data Scientist","Johannesburg, South Africa","Full-time","157500.0","2023-03-27 07:33:03","Luno"
144346,"Manager, Data Engineering","Johannesburg, South Africa","Full-time","155500.0","2023-10-11 14:25:49","Standard Bank Group"
1285010,"Supervisory Data Scientist","Durban, South Africa","Full-time","149946.5","2023-08-11 20:17:32","U.S. Department of Labor"
920628,"Data Engineer","Johannesburg, South Africa","Full-time","147500.0","2023-08-25 19:13:51","Standard Bank Group"
546140,"Analyst, Data Engineer","Johannesburg, South Africa","Full-time","147500.0","2023-02-17 16:45:55","Standard Bank Group"
75917,"Analyst, Data Engineer","Johannesburg, South Africa","Full-time","147500.0","2023-04-19 22:06:19","Standard Bank Group"
801643,"Data Engineer, Group Anti Financial Crime","Johannesburg, South Africa","Full-time","147500.0","2023-01-10 23:41:36","Standard Bank Group"
105925,"Manager, Data Engineer30","Johannesburg, South Africa","Full-time","147500.0","2023-02-17 13:45:51","Standard Bank Group"
950558,"Data Engineer","Cape Town, South Africa","Full-time","147500.0","2023-02-25 13:55:45","Ozow"
500395,"Production Data Engineer","Johannesburg, South Africa","Full-time","133000.0","2023-02-09 14:38:49","Standard Bank Group"
436362,"Lead Data Engineer","Johannesburg, South Africa","Full-time","131580.0","2023-05-02 06:24:58","iOLAP"
379809,"Lead Data Scientist","Johannesburg, South Africa","Full-time","114516.0","2023-09-25 13:44:19","Standard Bank Group"
253402,"Data Analyst - Insurance","Johannesburg, South Africa","Full-time","111175.0","2023-08-21 19:13:27","Standard Bank Group"
704017,"Senior Data Analyst II","Cape Town, South Africa","Full-time","111175.0","2023-06-30 19:22:53","Impact"
1365919,"Data Analyst - Marketing","Cape Town, South Africa","Full-time","111175.0","2023-06-21 12:42:44","takealot.com"
1718997,"Marketplace Operations Data Analyst","Cape Town, South Africa","Full-time","111175.0","2023-01-17 04:02:42","takealot.com"
1245722,"Data Specialist","Johannesburg, South Africa","Full-time","109500.0","2023-03-08 09:20:46","Experian"
601938,"Data Manager","Johannesburg, South Africa","Full-time","105650.0","2023-06-28 14:05:13","Standard Bank Group"
719231,"Data Analyst","Cape Town, South Africa","Full-time","105000.0","2023-05-31 10:26:51","takealot.com"
1757639,"Data Analyst - Growth","Cape Town, South Africa","Full-time","100500.0","2023-08-15 09:30:44","Kuda Technologies Ltd"
1394080,"Associate Data Analyst II","Cape Town, South Africa","Full-time","98500.0","2023-04-04 23:47:09","Impact"
40138,"Data Engineer","Johannesburg, South Africa","Full-time","97444.0","2023-08-17 19:16:46","Standard Bank Group"
195060,"Data Scientist","Johannesburg, South Africa","Full-time","90670.0","2023-07-28 12:17:50","Inlumi"
613207,"Head, Data Analytics, Business Insights and Monitoring","Johannesburg, South Africa","Full-time","81900.0","2023-05-04 15:16:18","Standard Bank Group"
1695957,"Credit Data Scientist (Africa Regions)","Johannesburg, South Africa","Full-time","70000.0","2023-07-10 18:40:53","Standard Bank Group"
51023,"Manager, Data Scientist CTR","Johannesburg, South Africa","Full-time","69962.5","2023-04-20 00:06:12","Standard Bank Group"
283335,"Engineer, Data X2","Johannesburg, South Africa","Full-time","69300.0","2023-07-07 07:25:15","Standard Bank Group"
1226861,"Engineer, Data","Johannesburg, South Africa","Full-time","69300.0","2023-03-08 14:20:53","Standard Bank Group"
897612,"80410343 - Engineer, Data","Johannesburg, South Africa","Full-time","69300.0","2023-03-06 13:13:40","Standard Bank Group"
1154949,"Engineer, Data","Johannesburg, South Africa","Full-time","69300.0","2023-08-16 08:52:34","Standard Bank Group"
202024,"Data Enginner","Johannesburg, South Africa","Full-time","69300.0","2023-08-18 20:16:26","Standard Bank Group"
450825,"Big Data Infrastructure Engineer","Cape Town, South Africa","Full-time","69300.0","2023-06-07 22:56:57","Impact"
19984,"Lead Consultant, Advanced Analytics, Data and Decision Science","Cape Town, South Africa","Full-time","69300.0","2023-01-31 03:24:42","Quantium"
328243,"Engineer, Data","Johannesburg, South Africa","Full-time","69300.0","2023-07-05 17:22:58","Standard Bank Group"
9735,"Head, Data Decision Science","Johannesburg, South Africa","Full-time","69300.0","2023-01-28 17:45:41","Standard Bank Group"
941439,"Manager, Data Analytics, CHNW","Johannesburg, South Africa","Full-time","69300.0","2023-04-03 19:42:09","Standard Bank Group"
1154152,"Head, Data Analytics, Card","Johannesburg, South Africa","Full-time","63000.0","2023-01-18 07:25:40","Standard Bank Group"
1520966,"Data Analyst - Risk Management (CIB)","Johannesburg, South Africa","Full-time","53014.0","2023-05-14 03:48:07","Standard Bank Group"
613085,"Data Analyst, Execution, CTR","Johannesburg, South Africa","Full-time","51014.0","2023-02-07 07:24:11","Standard Bank Group"
1193161,"Data Analyst (Splunk)","Johannesburg, South Africa","Full-time","51014.0","2023-01-19 19:09:02","Standard Bank Group"
850001,"Data Science Graduate Programme","Johannesburg, South Africa","Full-time","44100.0","2023-05-12 11:02:58","Standard Bank Group"
23285,"Data Analytic Manager","Johannesburg, South Africa","Full-time","44100.0","2023-01-25 13:02:33","Standard Bank Group"
137326,"80412439 - Engineer, Data","Johannesburg, South Africa","Full-time","44100.0","2023-04-19 11:06:19","Standard Bank Group"
62029,"Engineer, Data","Johannesburg, South Africa","Full-time","44100.0","2023-02-09 22:38:43","Standard Bank Group"
144209,"Manager, Data Science (Machine Learning)","Johannesburg, South Africa","Full-time","44100.0","2023-06-07 17:56:57","Standard Bank Group"
1258879,"Analyst, Data Quality","Johannesburg, South Africa","Full-time","44100.0","2023-07-07 09:25:08","Standard Bank Group"
1100809,"Manager, Data Science","Johannesburg, South Africa","Full-time","44100.0","2023-02-19 21:21:08","Standard Bank Group"
313190,"Analyst, Data Quality","Johannesburg, South Africa","Full-time","44100.0","2023-05-03 20:39:27","Standard Bank Group"
1189644,"80389998 - Engineer, Data","Johannesburg, South Africa","Full-time","44100.0","2023-05-12 10:00:26","Standard Bank Group"
840844,"Specialist, Data Quality","Johannesburg, South Africa","Full-time","44100.0","2023-01-29 03:45:44","Standard Bank Group"

*/
