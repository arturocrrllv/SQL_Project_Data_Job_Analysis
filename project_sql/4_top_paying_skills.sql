/*
Question: What are the top skills based On salary? 
- Look at the average salary associated with each skill for Data Analyst positions 
- Focuses on roles with specified salaries, regardless of location 
- Why? It reveals how different skills impact salary levels for Data Analysts and 
he Ips identify the most financially rewarding skills to acquire or improve 
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) avg_salary,
    COUNT(j.job_id) total_jobs
FROM job_postings_fact j
INNER JOIN skills_job_dim sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    -- AND job_work_from_home = TRUE
GROUP BY 1
HAVING COUNT(j.job_id) > 25
ORDER BY 2 DESC
LIMIT 30;