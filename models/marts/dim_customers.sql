with customer as (

    select * from {{ ref('stg__customers') }}

),
nation as (

    select * from {{ ref('stg__nations') }}
),
region as (

    select * from {{ ref('stg__regions') }}

),
final as (
    select 
        customer.customer_key,
        customer.customer_name,
        customer.customer_phone,
        customer.customer_acct_balance
        
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
        inner join region
            on nation.region_key = region.region_key
)
select 
    *
from
    final
order by
    customer_key