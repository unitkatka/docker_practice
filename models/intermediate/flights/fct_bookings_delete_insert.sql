
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'delete+insert',
    unique_key = ['book_ref'],
    tags = ['bookings']
  )
}}
select
    book_ref,
    book_date,
    total_amount
from {{ref('stg_flights__bookings') }}
{% if is_incremental() %}
  WHERE book_date > (SELECT MAX(book_date) FROM {{ source('demo-src', 'bookings') }}) - INTERVAL '97 DAY'

{% endif %}