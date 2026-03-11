
{{
  config(
    materialized = 'table'
  )
}}



select
  airport_code,
  airport_name,
  city,
  country,
  coordinates,
  timezone
from {{ source('demo-src', 'airports') }}

    