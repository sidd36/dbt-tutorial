with country as (

    select * from {{ ref('stg_country') }}

),

country_lang as (

    select * from {{ ref('stg_country_lang') }}

),

country_official_lang as (

    select
        Code,
        'Language',
        IsOfficial

    from country_lang

    where IsOfficial = 'T'

),


final as (

    select
        country.Country,
        country.Code

    from country

    left join country_official_lang using (Code)

)

select * from final