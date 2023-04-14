with customers as (
  select *
  from analytics-engineers-club.coffee_shop.customers
),
orders as (
  select
    id as order_id,
    created_at,
    customer_id,
    total
  from analytics-engineers-club.coffee_shop.orders
)

select 
  customers.id as customer_id,
  customers.name as name,
  customers.email as email,
  min(created_at) as first_order_at,
  count(total) as number_of_orders
from
  customers
left join
  orders
on
  customers.id = orders.customer_id
group by 1,2,3
order by first_order_at limit 5
