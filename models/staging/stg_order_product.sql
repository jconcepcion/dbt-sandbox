with order_product as ( select * from {{ source('subscription', 'order_product') }} )

select * from order_product