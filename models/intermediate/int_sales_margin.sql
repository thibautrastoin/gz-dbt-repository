WITH sales_product AS
(
    SELECT 
sales.products_id,
sales.date, 
sales.orders_id, 
sales.revenue,
sales.quantity, 
product.purchase_price, 
FROM {{ref('stg_raw__sales')}} as sales 
LEFT JOIN {{ref('stg_raw__product')}} as product 
USING (products_id)
)

SELECT 
*,
FROM sales_product 


