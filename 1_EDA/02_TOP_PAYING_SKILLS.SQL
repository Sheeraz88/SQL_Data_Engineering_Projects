/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT DISTINCT C.skills,count(A.*) as skill_demand_count,
round(median(A.salary_year_avg),0) as median_salary
FROM job_postings_fact AS A
INNER JOIN
skills_job_dim AS B
ON A.job_id=B.job_id
INNER JOIN skills_dim AS C
ON B.skill_id=C.skill_id
where A.job_title_short='Data Engineer'
and A.job_work_from_home=True
group by C.skills
having skill_demand_count>100
order by median_salary desc
limit 25

/*
  ----------------Result--------------------------
┌────────────┬────────────────────┬───────────────┐
│   skills   │ skill_demand_count │ median_salary │
│  varchar   │       int64        │    double     │
├────────────┼────────────────────┼───────────────┤
│ rust       │                232 │      210000.0 │
│ terraform  │               3248 │      184000.0 │
│ golang     │                912 │      184000.0 │
│ spring     │                364 │      175500.0 │
│ neo4j      │                277 │      170000.0 │
│ gdpr       │                582 │      169616.0 │
│ zoom       │                127 │      168438.0 │
│ graphql    │                445 │      167500.0 │
│ mongo      │                265 │      162250.0 │
│ fastapi    │                204 │      157500.0 │
│ django     │                265 │      155000.0 │
│ bitbucket  │                478 │      155000.0 │
│ crystal    │                129 │      154224.0 │
│ atlassian  │                249 │      151500.0 │
│ c          │                444 │      151500.0 │
│ typescript │                388 │      151000.0 │
│ kubernetes │               4202 │      150500.0 │
│ airflow    │               9996 │      150000.0 │
│ node       │                179 │      150000.0 │
│ css        │                262 │      150000.0 │
│ ruby       │                736 │      150000.0 │
│ redis      │                605 │      149000.0 │
│ ansible    │                475 │      148798.0 │
│ vmware     │                136 │      148798.0 │
│ jupyter    │                400 │      147500.0 │
└────────────┴────────────────────┴───────────────┘
Top 5:

Rust — $210K
Terraform — $184K
Golang — $184K
Spring — $175.5K
Neo4j — $170K
*/