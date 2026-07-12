SELECT 
orders_id,
date_date,
shipping_fee,
logcost,
ROUND((margin + shipping_fee - logcost - ship_cost),2) AS Operational_margin
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__ship') }}
USING (orders_id)
