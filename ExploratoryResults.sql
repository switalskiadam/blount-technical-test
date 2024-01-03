/*********************************************************************************************
	Analysis of SALES table, found that PRODUCT_ID (14) is not defined in PRODUCT table
**********************************************************************************************
	select distinct s.product_id
	from SALES_MART.SALES s
	    left join SALES_MART.PRODUCTS p on p.PRODUCT_ID = s.PRODUCT_ID 
	where p.PRODUCT_ID is null;
