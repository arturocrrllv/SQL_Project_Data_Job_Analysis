/* 
Question: What skills are required for the top—paying data analyst jobs? 
- Use the top 10 highest-paying Data Analyst jobs from first query 
- Add the specific skills required for these roles
- Why? lt provides a detailed took at which high-paying jobs demand certain skills, 
        helping job seekers understand which skills to develop that align with top salaries 
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        c.name company,
        salary_year_avg salary
    FROM job_postings_fact j
    LEFT JOIN company_dim c
    ON j.company_id = c.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 4 DESC
    LIMIT 10
)

SELECT
    t.*,
    skills
FROM top_paying_jobs t
INNER JOIN skills_job_dim sj
ON t.job_id = sj.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id;



/*
-- Most Mentions
SELECT
    skills,
    COUNT(*) mentions
FROM top_paying_jobs t
INNER JOIN skills_job_dim sj
ON t.job_id = sj.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id
GROUP BY 1
ORDER BY 2 DESC
*/