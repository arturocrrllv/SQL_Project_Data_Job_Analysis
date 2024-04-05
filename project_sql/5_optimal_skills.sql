/*
Answer: What are the most optimat skills to learn (aka it's in high demand and a high-paying skill)? 
- Identify skills in high demand and associated with high average salaries for Data Analyst roles 
- Concentrates on remote positions with specified salaries 
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries) , 
offering strategic insights for career development in data analysis 
*/

WITH
    skills_demand AS(
        SELECT
            s.skill_id,
            s.skills,
            COUNT(sj.job_id) demand_count
        FROM job_postings_fact j
        INNER JOIN skills_job_dim sj
        ON j.job_id = sj.job_id
        INNER JOIN skills_dim s
        ON sj.skill_id = s.skill_id
        WHERE 
            job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = TRUE
        GROUP BY 1
    ),
    average_salary AS(
        SELECT
            s.skill_id,
            ROUND(AVG(salary_year_avg),0) avg_salary
        FROM job_postings_fact j
        INNER JOIN skills_job_dim sj
        ON j.job_id = sj.job_id
        INNER JOIN skills_dim s
        ON sj.skill_id = s.skill_id
        WHERE 
            job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
            AND job_work_from_home = TRUE
        GROUP BY 1
    )

SELECT
    skills,
    avg_salary,
    demand_count
FROM skills_demand sk
INNER JOIN average_salary av
ON sk.skill_id = av.skill_id
WHERE demand_count > 30
ORDER BY 2 DESC, 3 DESC;
