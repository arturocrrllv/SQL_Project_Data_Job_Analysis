/* 
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top paying opportunities for Data Analysts.
*/

SELECT
    job_title,
    c.name company,
    salary_year_avg salary,
    job_schedule_type,
    job_posted_date::DATE date
FROM job_postings_fact j
LEFT JOIN company_dim c
ON j.company_id = c.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 3 DESC
LIMIT 10;
