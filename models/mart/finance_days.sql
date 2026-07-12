SELECT *
FROM 
{{ ref('int_sales_margin') }}
JOIN {{ ref('int_orders_margin') }}
USING(orders_id)
JOIN {{ ref('int_orders_operational') }}
USING(orders_id)
