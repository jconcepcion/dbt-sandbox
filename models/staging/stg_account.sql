with account as ( select * from {{ source('subscription', 'account') }} )

select * from account
