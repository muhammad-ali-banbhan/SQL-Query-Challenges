
-- find the second highest salary.

SELECT * FROM employees;

SELECT MAX(SALARY) FROM employees
WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM employees);


SELECT SALARY
FROM employees
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;


-- with aggregate and subquery

SELECT MAX(SALARY)
FROM employees e1
WHERE 1 = (
    SELECT COUNT(DISTINCT SALARY)
    FROM employees e2
    WHERE e2.SALARY > e1.SALARY
);


-- Using Window Functions (DENSE_RANK)

SELECT salary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank_num
    FROM employees
) as ranked_employees
WHERE rank_num = 2;