#进阶1
USE sys
USE myemployees
SELECT last_name FROM employees;
SELECT last_name,salary,email FROM employees
SELECT * FROM employees
SELECT `employee_id`,`first_name`,`email`,`email`
FROM
employees;

SELECT * FROM employees

SELECT 100;
SELECT "jjj:";
SELECT VERSION();

SELECT 100%98 AS 结果;

SELECT last_name 姓,first_name 名 FROM employees;

SELECT salary AS 'out put' FROM employees

SELECT DISTINCT department_id FROM employees;

SELECT CONCAT(`last_name`,'~',`first_name`) AS 姓名 FROM employees;

DESC departments;
SELECT * FROM departments;

SELECT DISTINCT `department_id` FROM employees;

SELECT CONCAT(`first_name`,`last_name`,`email`,`job_id`,`salary`) AS "out_put" FROM employees

SELECT
	IFNULL(commission_pct,0) AS 奖金率,
	commission_pct
FROM
	employees;

#进阶2
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id IN('IT_PORT','AD_VP','AD_PRES');

SELECT
	*
FROM
	employees
WHERE
	last_name LIKE '%a%'



SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=> 0.2;

SELECT salary,last_name
FROM
	employees
WHERE
	salary<18000 AND commission_pct IS NULL;


SELECT
	*
FROM
	employees
WHERE
	salary=12000 OR job_id <> 'IT';


DESC departments


SELECT
	DISTINCT location_id
FROM
	departments

SELECT
	*
FROM
	employees
WHERE
	commission_pct LIKE '%%' OR last_name LIKE '%%';


#进阶三

SELECT
	*
FROM
	employees
WHERE
	department_id>=90
ORDER BY
	hiredate ASC;


SELECT
	*,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM
	employees
ORDER BY
	salary*12*(1+IFNULL(commission_pct,0)) ASC;


SELECT
	*,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM
	employees
ORDER BY
	年薪 ASC;

SELECT
	last_name,salary
FROM
	employees
ORDER BY
	LENGTH(last_name) ASC;


SELECT
	*
FROM
	employees
ORDER BY
	salary ASC,employee_id DESC;

SELECT
	last_name,department_id,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
FROM
	employees
ORDER BY
	年薪 DESC,last_name ASC;


SELECT
	last_name,salary
FROM
	employees
WHERE
	NOT(8000<=salary AND salary<=17000)
ORDER BY
	salary DESC;


SELECT
	*
FROM
	employees
WHERE
	email LIKE '%e%'
ORDER BY
	LENGTH(email) DESC,department_id ASC;


#进阶四
SELECT UPPER('张lfld');

SELECT 
	CONCAT(UPPER(SUBSTR(last_name,1,1)),LOWER(SUBSTR(last_name,2))) out_put
FROM employees;

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT YEAR(NOW());
SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d');
SELECT IF(10<5,'d','x');

SELECT salary 原始工资,department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END AS 新工资
FROM employees


SELECT salary,
CASE
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;

SELECT NOW();



SELECT employee_id,last_name,salary,salary*1.2 AS `new salary`
FROM employees;

SELECT last_name,LENGTH(last_name)
FROM employees
ORDER BY SUBSTR(last_name,1,1)

SELECT 
	CONCAT(last_name,' earns ',salary,' monthly but wants ',salary*3) AS "Dream Salary"
FROM
	employees;

SELECT 
	COUNT(salary)
FROM
	employees;

SELECT SUM(DISTINCT salary)
FROM employees;

SELECT MAX(salary),MIN(salary),SUM(salary),AVG(salary)
FROM employees;

SELECT MAX(hiredate)-MIN(hiredate) AS DIFFRENCE
FROM employees;

SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) AS DIFFRENCE
FROM employees;

SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;


SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;

USE myemployees;

SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;

SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id>102 
GROUP BY manager_id
HAVING MIN(salary)>5000;

SELECT COUNT(*),LENGTH(last_name)
FROM employees
GROUP BY LENGTH(last_name)
HAVING COUNT(*)>5;


SELECT AVG(salary),department_id,job_id
FROM employees
GROUP BY department_id,job_id

SELECT AVG(salary),department_id,job_id
FROM employees
GROUP BY department_id,job_id
HAVING AVG(salary)>10000
ORDER BY AVG(salary) DESC;


SELECT MAX(salary)-MIN(salary) difference
FROM employees

SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary)>=6000;

SELECT AVG(salary),COUNT(*),department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

SELECT COUNT(*),job_id
FROM employees
GROUP BY job_id;

#进阶六
SELECT last_name,department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id
AND e.commission_pct IS NOT NULL;

SELECT city,department_name
FROM locations l,departments d
WHERE l.location_id=d.location_id
AND city LIKE '_o%';

SELECT COUNT(*),city
FROM locations l,departments d
WHERE l.location_id=d.location_id
GROUP BY city;

SELECT department_name,d.manager_id,MIN(salary)
FROM employees e,departments d
WHERE e.manager_id=d.manager_id
AND commission_pct IS NOT NULL
GROUP BY department_name,d.manager_id;

SELECT job_title,COUNT(*),e.job_id
FROM jobs j,employees e
WHERE j.job_id=e.job_id
GROUP BY e.job_id
ORDER BY COUNT(*) DESC;

SELECT last_name,department_name,city
FROM departments d,employees e,locations l
WHERE d.department_id=e.department_id 
AND d.location_id=l.location_id


CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  INT,
 highest_sal INT);
 
INSERT INTO job_grades
VALUES ('A', 1000, 2999);
 
INSERT INTO job_grades
VALUES ('B', 3000, 5999);
 
INSERT INTO job_grades
VALUES('C', 6000, 9999);
 
INSERT INTO job_grades
VALUES('D', 10000, 14999);
 
INSERT INTO job_grades
VALUES('E', 15000, 24999);
 
INSERT INTO job_grades
VALUES('F', 25000, 40000);

SELECT * FROM job_grades;

SELECT last_name,salary,grade_level
FROM employees e,job_grades g
WHERE salary BETWEEN g.lowest_sal AND g.highest_sal

SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees e,employees m
WHERE e.manager_id=m.employee_id

SELECT last_name,e.department_id,department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id

SELECT job_id,d.location_id
FROM jobs j,locations l,departments d
WHERE e.department_id=d.department_id
AND department_id=90

SELECT job_id,location_id
FROM employees e,departments d
WHERE e.department_id=d.department_id
AND e.department_id=90

SELECT last_name,department_name,l.location_id,city
FROM departments d,employees e,locations l
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND commission_pct IS NOT NULL;

SELECT last_name,job_id,e.department_id,department_name
FROM departments d,employees e,locations l
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND city='Toronto';

SELECT department_name,job_title,MIN(salary)
FROM departments d,employees e,jobs j
WHERE e.job_id=j.job_id 
AND d.department_id=e.department_id
GROUP BY job_title,department_name;

SELECT *
FROM `locations`

SELECT `country_id`,COUNT(*)
FROM departments d,locations l
WHERE d.location_id=l.location_id
GROUP BY country_id
HAVING COUNT(*)>2;

SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON d.department_id=e.department_id

SELECT city,COUNT(*)
FROM locations l
INNER JOIN departments d
ON l.location_id=d.location_id
GROUP BY city
HAVING COUNT(*)>3

SELECT department_name,COUNT(*)
FROM employees e
INNER JOIN departments d
ON e.department_id=d.department_id
GROUP BY department_name
HAVING COUNT(*)>3
ORDER BY COUNT(*) DESC;

SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN departments d ON e.department_id=d.department_id
INNER JOIN  jobs j ON e.job_id=j.job_id
ORDER BY department_name DESC;

SELECT grade_level,COUNT(*)
FROM employees e
JOIN job_grades g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY grade_level
HAVING COUNT(*)>20;

SELECT department_name,e.department_id
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id=d.department_id

SELECT d.*,e.employee_id
FROM departments d
LEFT OUTER JOIN employees e
ON e.department_id=d.department_id

SELECT city,d.*
FROM locations l
LEFT OUTER JOIN departments d
ON d.location_id=l.location_id

SELECT last_name,job_id,salary
FROM employees e

SELECT job_id
FROM employees
WHERE employee_id = 141

SELECT salary
FROM employees
WHERE employee_id = 143

SELECT last_name,job_id,salary
FROM employees
WHERE job_id=(
	SELECT job_id
	FROM employees
	WHERE employee_id = 141
) AND salary>(
	SELECT salary
	FROM employees
	WHERE employee_id = 143
);

SELECT last_name,job_id,salary
FROM employees
WHERE salary=(
	SELECT MIN(salary)
	FROM employees
);

SELECT MIN(salary)
FROM employees

SELECT MIN(salary)
FROM employees
WHERE department_id = 50

SELECT MIN(salary),department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary)>(
	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);

SELECT last_name,l.location_id
FROM departments d
INNER JOIN employees e ON e.department_id=d.department_id
INNER JOIN locations l ON l.location_id=d.location_id
WHERE l.location_id =1400 OR l.location_id =1700

SELECT MIN(salary),job_id
FROM employees
WHERE job_id='IT_PROG'

SELECT employee_id,last_name,job_id,salary
FROM employees

SELECT DISTINCT salary
FROM employees
WHERE job_id='IT_PROG'

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary<ANY(
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id='IT_PROG'
) AND job_id<>'IT_PROG'

SELECT MIN(employee_id)
FROM employees

SELECT MAX(salary)
FROM employees

SELECT *
FROM employees
WHERE employee_id=(
	SELECT MIN(employee_id)
	FROM employees
) AND salary=(
	SELECT MAX(salary)
	FROM employees
)


SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id

SELECT ag_dep
FROM (
	SELECT department_id,AVG(salary) ag
	FROM employees
	GROUP BY department_id
) ag_dep
INNER JOIN job_grades g
ON ag_dep.ag BETWEEN lowest_sal AND highest_sal

SELECT department_id
FROM employees
WHERE last_name='Zlotkey'

SELECT last_name,salary,department_id
FROM employees
WHERE department_id=(
	SELECT department_id
	FROM employees
	WHERE last_name='Zlotkey'
)

SELECT AVG(salary)
FROM employees

SELECT employee_id,last_name,salary
FROM employees
WHERE salary>(
	SELECT AVG(salary)
	FROM employees
)

SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id

SELECT employee_id,last_name,salary
FROM employees e
JOIN (
	SELECT department_id,AVG(salary) ag
	FROM employees
	GROUP BY department_id
) da
ON e.department_id=da.department_id
WHERE e.salary>da.ag


SELECT DISTINCT department_id
FROM employees
WHERE last_name LIKE "%u%"

SELECT employee_id,last_name
FROM employees e
INNER JOIN (
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE "%u%"
) da
ON e.department_id=da.department_id

SELECT employee_id,last_name
FROM employees e
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE "%u%"
)

SELECT employee_id
FROM `departments` d
INNER JOIN employees e ON d.`department_id`=e.`department_id`
INNER JOIN `locations` l ON d.`location_id`=l.`location_id`
WHERE l.location_id=1700

SELECT employee_id,last_name
FROM employees
WHERE last_name="K_ing"

SELECT last_name,salary,manager_id
FROM employees 
WHERE manager_id IN(
	SELECT employee_id
	FROM employees
	WHERE last_name="K_ing"
)

SELECT MAX(salary)
FROM employees

SELECT CONCAT(last_name,'`',first_name) AS "姓·名"
FROM employees
WHERE salary=(
	SELECT MAX(salary)
	FROM employees
)

#进阶8 分页查询
SELECT * FROM employees LIMIT 0,5
SELECT * FROM employees LIMIT 10,15


















