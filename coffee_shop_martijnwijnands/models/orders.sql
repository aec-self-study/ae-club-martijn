{{ config(
  materialized='table'
) }}

SELECT
    id,
    created_at
from `analytics-engineers-club.coffee_shop.orders`