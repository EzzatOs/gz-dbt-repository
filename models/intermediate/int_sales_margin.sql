SELECT *
(revenue -  pdt.purchase_price)) AS margin
FROM {{ ref("stg_raw__sales") }} AS sa

