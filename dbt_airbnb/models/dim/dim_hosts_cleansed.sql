{{ config(materialized="view") }}
with host_listings_cleansed as (select * from {{ ref("src_hosts") }})
select
    host_id,
    nvl(host_name, 'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
from host_listings_cleansed
