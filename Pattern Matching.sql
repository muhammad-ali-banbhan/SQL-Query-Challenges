
-- select where customer name start  with 'M'.

SELECT * FROM sales_data
WHERE Customer_Name LIKE "M%";

-- select where customer name ends  with 'M'

SELECT * FROM sales_data
WHERE Customer_Name LIKE "%M";


-- select where customer name contain letter M at any position.

SELECT * FROM sales_data
WHERE Customer_Name LIKE "%M%";


-- select where customer name does not contain letter M at any position.

SELECT * FROM sales_data
WHERE Customer_Name NOT LIKE "%M%";