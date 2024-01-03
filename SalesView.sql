/*************************************************************************************************************************************
  Generate and execute the DDL required to create a view that joins all 3 tables together. Please provide the DDL as your solution.
*************************************************************************************************************************************/
  create or replace view EXAMPLE_DB.STAGE.VW_SALESDATA(
  	SALE_ID,
  	PRODUCT_ID,
  	PRODUCT_NAME,
  	CUSTOMER_ID,
  	FIRST_NAME,
  	LAST_NAME,
  	EMAIL,
  	SALE_DATE,
  	QUANTITY,
  	TOTAL_AMOUNT
  ) as
  select s.SALE_ID, s.PRODUCT_ID, p.PRODUCT_NAME, s.customer_id, c.first_name, c.last_name, c.email, s.sale_date, s.quantity, s.total_amount
  from SALES_MART.sales s
      inner join SALES_MART.customers c on c.customer_id = s.customer_id
      inner join SALES_MART.products p on p.product_id = s.product_id;
