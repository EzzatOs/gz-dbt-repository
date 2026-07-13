SELECT 
orders_id,
date_date,
products_id,
revenue,
quantity,
purchase_price,
(quantity * purchase_price) AS purchase_cost,
ROUND(revenue - (quantity * purchase_price),2) AS margin
FROM 
{{ ref('stg_raw__sales') }}
JOIN
{{ ref('stg_raw__product') }} 
USING (products_id)


