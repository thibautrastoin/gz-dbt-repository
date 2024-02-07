
SELECT
*,
margin - logcost + shipping_fee - CAST(ship_cost as INT64) as op_margin
FROM {{ref('int_orders_margin')}}
JOIN {{ref('stg_raw__ship')}}
USING (orders_id)
