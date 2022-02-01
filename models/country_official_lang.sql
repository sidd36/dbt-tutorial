with country as (

    select * from {{ ref('stg_country') }}

),

country_lang as (

    select * from {{ ref('stg_country_lang') }}

),

country_official_lang as (

    select
        code,
        "Language",
        isofficial

    from country_lang

    where IsOfficial = 'T'

),


final as (

    select
        c.Country,
        c.code,
        col."Language"

    from country c

    left join country_official_lang col on c.code = col.code

)

select * from final