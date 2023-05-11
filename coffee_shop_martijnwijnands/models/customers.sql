{{ config(
  materialized='table'
) }}


-- Group by customer_id to get the right amount of order and the appropiate date the customer first ordered on.

with orders as (
  select
    customer_id
    ,count(id) number_of_orders
    ,min(created_at) as first_order_at
  from `analytics-engineers-club.coffee_shop.orders`
  group by customer_id
)

-- Join the customer details on the grouped orders table, order by the first order date and limit to 5 results.

select 
  id	
  ,name	
  ,email	
  ,first_order_at	
  ,number_of_orders
from orders
left join `analytics-engineers-club.coffee_shop.customers` as customers
on customers.id = orders.customer_id
order by first_order_at
limit 5

-- Resulting table shows the first ever 5 customers and their lifetime amount of orders.