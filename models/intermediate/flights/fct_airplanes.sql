{{
  config(
    materialized = 'table'
  )
}}
select
  airplane_code ,
  model,
  range,
  speed
from {{ref('stg_flights__airplanes') }}