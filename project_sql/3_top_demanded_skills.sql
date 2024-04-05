/*
Question: What are the most in-demand skills for data analysts? 
- Join job postings to inner join table similar to query 2 
- Identify the top 5 in—demand skills for a data analyst. 
- Focus on all job postings. 
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers. 
*/

SELECT
    skills,
    COUNT(sj.job_id) total_jobs
FROM job_postings_fact j
INNER JOIN skills_job_dim sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;