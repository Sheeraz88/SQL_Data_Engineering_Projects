/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/
SELECT DISTINCT C.skills,count(A.*) as skill_demand_count
FROM job_postings_fact AS A
INNER JOIN
skills_job_dim AS B
ON A.job_id=B.job_id
INNER JOIN skills_dim AS C
ON B.skill_id=C.skill_id
where A.job_title_short='Data Engineer'
and A.job_work_from_home=True
group by C.skills
order by skill_demand_count desc
limit 10

/*  ----------Result---------
┌────────────┬────────────────────┐
│   skills   │ skill_demand_count │
│  varchar   │       int64        │
├────────────┼────────────────────┤
│ sql        │              29221 │
│ python     │              28776 │
│ aws        │              17823 │
│ azure      │              14143 │
│ spark      │              12799 │
│ airflow    │               9996 │
│ snowflake  │               8639 │
│ databricks │               8183 │
│ java       │               7267 │
│ gcp        │               6446 │
└────────────┴────────────────────┘

*/
