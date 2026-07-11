SELECT 
    sa.revenue,
    sa.quantity,
    pdt.purchase_price,
    (sa.quantity * pdt.purchase_price) AS purchase_cost,
    (sa.revenue - (sa.quantity * pdt.purchase_price)) AS margin
FROM {{ ref('stg_raw_sales') }} AS sa
LEFT JOIN {{ ref('stg_raw_product') }} AS pdt
    ON sa.products_id = pdt.products_id
    