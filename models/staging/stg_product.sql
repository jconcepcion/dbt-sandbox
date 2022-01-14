with product as ( select * from {{ source('subscription', 'product') }} )

select 
*,
CURRENT_TIMESTAMP as runtimestamp
from product