with product as ( select * from {{ source('subscription', 'product') }} )

select *
from product