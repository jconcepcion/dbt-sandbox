with customer as ( select * from {{ source('snowflake_sample_data', 'customer') }} )

select *
from customer