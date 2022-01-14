{{ config(materialized='table') }}

with account as ( select * from {{ source('subscription', 'account') }} )

select 
*,
CURRENT_TIMESTAMP as runtimestamp
from account
