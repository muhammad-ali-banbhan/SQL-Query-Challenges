
-- FOR ODD NUMBERS

SELECT id, name, salary
FROM (
    SELECT
        id,
        name,
        salary,
        ROW_NUMBER() OVER (ORDER BY id) AS row_num
    FROM users
) AS subquery
WHERE row_num % 2 = 0;



-- FOR EVEN NUMBERS

SELECT id, name, salary
FROM (
    SELECT
        id,
        name,
        salary,
        ROW_NUMBER() OVER (ORDER BY id) AS row_num
    FROM users
) AS subquery
WHERE row_num % 2 = 1;