SELECT
date,

ROUND(SUM(purchase_price),2) as purchase_cost,
COUNT(orders_id) as orders,
ROUND(SUM (op_margin),2) as op_margin,
SUM (quantity) as qty,
FROM {{ref('int_orders_operational')}} 
GROUP BY date
ORDER BY date DESC
