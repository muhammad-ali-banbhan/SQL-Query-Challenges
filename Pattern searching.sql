
-- Display name of customers whose name contain exactly 10  letters.

SELECT * FROM sales_data
WHERE Customer_Name LIKE "__________";


-- Dispaly the  name of customer whose name contain the second letter  as 'L' and 8th letter as 'M'.

SELECT * FROM sales_data
WHERE Customer_Name LIKE "_L%" AND "_______M%";