select
    sa.revenue,
    sa.quantity,
    pdt.purchase_price,
    (sa.quantity * pdt.purchase_price) as purchase_cost,
    (sa.revenue - (sa.quantity * pdt.purchase_price)) as margin
from {{ ref("stg_raw_sales") }} as sa
left join {{ ref("stg_raw_product") }} as pdt on sa.products_id = pdt.products_id
