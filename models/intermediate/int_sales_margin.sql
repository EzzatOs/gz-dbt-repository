select
(sa.revenue - pdt.purchase_price) as sales_margin,
(sa.quantity * pdt.purchase_price) as purchase_cost
from {{ ref(’stg_raw__sales’) }} as sa
left join {{ ref(’stg_raw__product’) }} as pdt
on sa.products_id = pdt.products_id

