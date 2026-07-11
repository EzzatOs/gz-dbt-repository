SELECT 
orders_id,
date_date,
(margin + shipping_fee - logcost - ship_cost) AS Operational_margin
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__ship') }}
USING (orders_id)
