/******************************************************************************************************************
	1) Analysis of SALES table, found that PRODUCT_ID (14) is not defined in PRODUCT table
******************************************************************************************************************
	select distinct s.product_id
	from SALES_MART.SALES s
	    left join SALES_MART.PRODUCTS p on p.PRODUCT_ID = s.PRODUCT_ID 
	where p.PRODUCT_ID is null;

/******************************************************************************************************************
	2) It looks like at some point data was deleted from the SALES table because SALE_ID has a gap from 4550-4851
******************************************************************************************************************
	select *
	from SALES_MART.SALES
	where SALE_ID between 4550 and 4851;

/******************************************************************************************************************
	3) total_amount for sale_id (6080) does not match the calculated total (quantity * product.price)
******************************************************************************************************************
	select sale_id, product_name, sale_date, quantity, price, s.total_amount, quantity * price as amount_calculated
	from SALES_MART.SALES s
	    inner join SALES_MART.PRODUCTS p on p.product_id = s.product_id
	where total_amount <> (quantity * price)

/******************************************************************************************************************
	4) This may just be a personal suggestion but I would rename the total_amount column to be something 
		obvious to its financial use. Total_amount could be confused with a quantity.
******************************************************************************************************************
