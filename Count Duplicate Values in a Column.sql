


  SELECT * FROM sales_data;
  
  
  
  SELECT Customer_ID, COUNT(*)
  FROM sales_data
  GROUP BY Customer_ID
  HAVING COUNT(*) > 1;
  
  
  
  
  
  -- for multiple columns
  
    SELECT Customer_ID, Product_ID,  COUNT(*)
  FROM sales_data
  GROUP BY Customer_ID, Product_ID
  HAVING COUNT(*) > 1;
  
  