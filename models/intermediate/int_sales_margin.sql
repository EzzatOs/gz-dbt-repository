SELECT 
orders_id,
date_date,
(quantity * purchase_price) AS purchase_cost,
(revenue - purchase_price) AS margin
FROM 
{{ ref('stg_raw__sales') }}
JOIN
{{ ref('stg_raw__product') }} 
USING (products_id)

