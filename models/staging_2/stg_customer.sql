with customer as ( select * from {{ source('snowflake_sample_data', 'customer') }} )

select 
*,
CURRENT_TIMESTAMP as runtimestamp
from customer