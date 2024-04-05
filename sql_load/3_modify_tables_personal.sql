
COPY company_dim
FROM 'D:\Users\Arturo\Documents\Cursos\2024\SQL in 4 Hours\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'D:\Users\Arturo\Documents\Cursos\2024\SQL in 4 Hours\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'D:\Users\Arturo\Documents\Cursos\2024\SQL in 4 Hours\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'D:\Users\Arturo\Documents\Cursos\2024\SQL in 4 Hours\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM skills_dim
LIMIT 100;