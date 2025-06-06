select * from human_resources;

#create clone table 
CREATE TABLE hr_clone
LIKE human_resources;

INSERT hr_clone
SELECT *
FROM human_resources;

SELECT *
FROM hr_clone;

ALTER TABLE hr_clone 
CHANGE COLUMN ï»¿id emp_id varchar(20) NULL;

SET sql_safe_updates = 0;

update hr_clone
SET birthdate = case
when birthdate like '%/%' then DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
when birthdate like '%-%' then DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
else null 
end;

alter table hr_clone
modify column birthdate date;

update hr_clone
SET hire_date = case
when hire_date like '%/%' then DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
when hire_date like '%-%' then DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
else null 
end;

alter table hr_clone
modify column hire_date date;

UPDATE hr_clone
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';














  





