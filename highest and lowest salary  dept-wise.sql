 
 
 -- FOR HIGHEST
 
 SELECT MAX(SALARY), DEP_ID
 FROM employees
 GROUP BY DEP_ID;
 
 
 
 -- FOR LOWEST
 
 SELECT MIN(SALARY), DEP_ID
 FROM employees
 GROUP BY DEP_ID;
 
 
 
 -- FOR BOTH IN ONE QUERY
 
 SELECT MAX(SALARY), MIN(SALARY), DEP_ID
 FROM employees
 GROUP BY DEP_ID;
 
 
 
 
 -- Using Window Functions: FIRST_VALUE and LAST_VALUE
 
 SELECT DISTINCT
    DEP_ID,
    FIRST_VALUE(SALARY) OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) AS highest_salary,
    FIRST_VALUE(SALARY) OVER (PARTITION BY DEP_ID ORDER BY SALARY ASC) AS lowest_salary
FROM employees;



--  Using Self-Join (less efficient, but good for understanding)

SELECT
    e.DEP_ID,
    e.SALARY AS highest_salary,
    e2.SALARY AS lowest_salary
FROM employees e
JOIN employees e2 ON e.DEP_ID = e2.DEP_ID
WHERE e.SALARY = (SELECT MAX(SALARY) FROM employees WHERE DEP_ID = e.DEP_ID)
  AND e2.SALARY = (SELECT MIN(SALARY) FROM employees WHERE DEP_ID = e.DEP_ID);
  
  
  
  