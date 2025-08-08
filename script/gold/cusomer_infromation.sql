
/*this is belong to fresh data  no duplicates and not null
---insert data into new table  if we use cte then write  insert stament after scte*/

==========================================================================
;WITH customer_info AS (
    SELECT 
        c.name,
        c.city,
        o.product_name,
        o.quantity,
        o.order_date,
        ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY o.order_date DESC) AS ranking
    FROM bronze.raw_orders o
    LEFT JOIN bronze.raw_customers c
        ON o.customer_id = c.customer_id
)
INSERT INTO gold.customer_information (
    name,
    city,
    product_name,
    quantity,
    latest_order,
    ranking
)
SELECT 
    name,
    city,  -- ✅ Comma added here
    product_name,
    quantity,
    order_date AS latest_order,
    ranking
FROM customer_info
WHERE ranking = 1;


select* from gold.customer_information
