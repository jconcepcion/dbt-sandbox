with order_product as ( select * from {{ source('subscription', 'order_product') }} )

select 
*,
CURRENT_TIMESTAMP as runtimestamp
from order_product