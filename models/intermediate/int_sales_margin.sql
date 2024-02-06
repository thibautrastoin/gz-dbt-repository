WITH sales_product AS
(
    SELECT 
sales.products_id,
sales.date, 
sales.orders_id, 
CAST (sales.revenue as FLOAT64) as revenue,
CAST (sales.quantity as FLOAT64) as quantity, 
CAST (product.purchase_price as FLOAT64) as purchase_price, 
FROM {{ref('stg_raw__sales')}} as sales 
LEFT JOIN {{ref('stg_raw__product')}} as product 
USING (products_id)
)

SELECT *,
ROUND (revenue - purchase_price,2) as margin,
ROUND (quantity*purchase_price,2) as purchase_cost,
FROM sales_product