SELECT gender, COUNT(*) AS count
FROM hr_clone
WHERE age >= 18 and termdate=''
GROUP BY gender;

SELECT race, COUNT(*) AS count
FROM hr_clone
WHERE age >= 18 and termdate=''
GROUP BY race
ORDER BY count DESC;

SELECT 
  MIN(age) AS youngest,
  MAX(age) AS oldest
FROM hr_clone
WHERE age >= 18;

SELECT 
  CASE 
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+' 
  END AS age_group, 
  COUNT(*) AS count
FROM 
  hr_clone
WHERE 
  age >= 18 and termdate=''
GROUP BY age_group
ORDER BY age_group;

SELECT 
  CASE 
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+' 
  END AS age_group, gender,
  COUNT(*) AS count
FROM 
  hr_clone
WHERE 
  age >= 18 and termdate=''
GROUP BY age_group, gender
ORDER BY age_group, gender;

SELECT location, COUNT(*) as count
FROM hr_clone
WHERE age >= 18 and termdate=''
GROUP BY location;

SELECT ROUND(AVG(DATEDIFF(termdate, hire_date))/365,0) AS avg_length_of_employment
FROM hr_clone
WHERE termdate <> '' AND termdate <= CURDATE() AND age >= 18;

SELECT department, COUNT(*) as count
FROM hr_clone
WHERE age >= 18 and termdate=''
GROUP BY department;


SELECT jobtitle, COUNT(*) as count
FROM hr_clone
WHERE age >= 18 and termdate= ''
GROUP BY jobtitle
ORDER BY jobtitle DESC;

SELECT department, COUNT(*) as total_count, 
    SUM(CASE WHEN termdate <= CURDATE() AND termdate <> '' THEN 1 ELSE 0 END) as terminated_count, 
    (SUM(CASE WHEN termdate <= CURDATE() AND termdate <> '' THEN 1 ELSE 0 END) / COUNT(*))*100 as termination_rate
FROM hr_clone
WHERE age >= 18 
GROUP BY department
ORDER BY termination_rate DESC;

SELECT location_state, COUNT(*) as count
FROM hr_clone
WHERE age >= 18 and termdate= ''
GROUP BY location_state
ORDER BY count DESC;

SELECT 
    YEAR(hire_date) AS year, 
    COUNT(*) AS hires, 
    SUM(CASE WHEN termdate <> '' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations, 
    COUNT(*) - SUM(CASE WHEN termdate <> '' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS net_change,
    ROUND(((COUNT(*) - SUM(CASE WHEN termdate <> '' AND termdate <= CURDATE() THEN 1 ELSE 0 END)) / COUNT(*) * 100),2) AS net_change_percent
FROM 
    hr_clone
WHERE age >= 18
GROUP BY 
    YEAR(hire_date)
ORDER BY 
    YEAR(hire_date) ASC;
    
select count(*) as total_emp
from hr_clone;