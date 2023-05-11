{{ config(
  materialized='table'
) }}

select
    count(id) as order_amount,
    {{ date_trunc( "month", "created_at") }} AS order_month,
    {{ date_trunc( "year", "created_at") }} AS order_year
FROM 
  {{ ref('orders') }}
GROUP BY
  2, 3