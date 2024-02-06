WITH pp as 
(
SELECT 
sales.products_id,
sales.date, 
sales.orders_id, 
CAST (sales.revenue as FLOAT64) as revenue,
CAST (sales.quantity as FLOAT64) as quantity, 
CAST (product.purchase_price as FLOAT64) as purchase_price, 
CAST (product.purchase_price as FLOAT64)*CAST (sales.quantity as FLOAT64) as purchase_cost,
CAST (sales.revenue as FLOAT64) - CAST (product.purchase_price as FLOAT64) as margin,
FROM {{ref('stg_raw__sales')}} as sales 
LEFT JOIN {{ref('stg_raw__product')}} as product 
USING (products_id)
)

SELECT 
orders_id,
date,
SUM(pp.revenue) as revenue,
SUM(pp.quantity) as quantity,
SUM(pp.purchase_price) as purchase_price,
SUM(pp.margin) as margin,
FROM pp 
GROUP BY orders_id, date
ORDER BY orders_id DESC
