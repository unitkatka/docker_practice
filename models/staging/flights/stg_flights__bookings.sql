{{ 
config(
    materialized='table',
    post_hook=[
        "create index if not exists idx_stg_book_ref on {{ this }} (book_ref)",
        "create index if not exists idx_stg_book_date on {{ this }} (book_date)"
    ]
) 
}}


select
    book_ref,
    book_date,
    total_amount
from {{ source('demo-src', 'bookings') }}

