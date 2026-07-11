SELECT *
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__sales') }}
USING (orders_id)