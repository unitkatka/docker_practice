{{
  config(
    materialized = 'table'
  )
}}
select
  airplane_code,
  seat_no,
  fare_conditions
from {{ref('stg_flights__seats') }}