--Order is a reserved word so we use the plural
with orders as ( select * from {{ source('subscription', 'order') }} )

select *
from orders