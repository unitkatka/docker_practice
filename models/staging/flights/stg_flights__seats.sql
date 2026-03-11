
{{
  config(
    materialized = 'table'
  )
}}

select
  airplane_code,
  seat_no,
  fare_conditions
from {{ source('demo-src', 'seats') }}
    