

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
from {{ source('demo-src', 'airplanes') }}

    