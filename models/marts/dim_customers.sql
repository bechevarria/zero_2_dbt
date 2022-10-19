with customers as (

    select * from {{ ref('stg_sample_data__customers') }}
),
nations as (

    select * from {{ ref('stg_sample_data__nations') }}    
),

regions as (

    select * from {{ ref('stg_sample_data__regions') }}

),
final as (
    select 
        customers.customer_key,
        customers.customer_name,
        customers.customer_phone,
        customers.customer_acct_balance,
        nations.nation_key as nation_key,
        regions.region_key as region_key,
        regions.region_name as region
        -- add nation name 
        -- add region name 

    from
        customers
        inner join nations
            on customers.nation_key = nations.nation_key
        inner join regions
            on nations.region_key = regions.region_key
)
select 
    *
from
    final
order by
    customer_key
