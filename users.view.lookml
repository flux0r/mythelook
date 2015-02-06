- view: users

  fields:

#-------------------------------------------------------------------------------

  - dimension: age
    description: The user's age.
    sql: ${TABLE}.age
    type: int

  - dimension: city
    description: The user city.
    sql: ${TABLE}.city
    type: string

  - dimension: country
    description: The user country.
    sql: ${TABLE}.country
    type: string

  - dimension_group: created
    datatype: datetime
    description: User record creation timestamp.
    sql: ${TABLE}.created_at
    timeframes: [ date
                , day_of_week
                , hour
                , month
                , time
                , week
                , year
                ]
    type: time
  
  - dimension: email
    description: The user email.
    sql: ${TABLE}.email
    type: string

  - dimension: full_name
    description: The user's first and last name.
    sql: concat(${TABLE}.first_name, ' ', ${TABLE}.last_name)
    type: string
    
  - dimension: gender
    description: The user gender.
    sql: ${TABLE}.gender
    type: string
  
  - dimension: id
    description: The user id.
    primary_key: true
    sql: ${TABLE}.id
    type: int
    
  - dimension: first_name
    description: The user first name.
    sql: ${TABLE}.first_name
    type: string
    
  - dimension: last_name
    description: The user last name.
    sql: ${TABLE}.last_name
    type: string

  - dimension: over_40
    description: User over 40?
    sql: ${age} > 40
    type: yesno

  - dimension: state
    description: The user state (location).
    sql: ${TABLE}.state
    type: string

  - dimension: tiered_age
    description: The user age broken into tiers.
    sql: ${age}
    tiers: [20, 40, 60, 80]
    type: tier

#-------------------------------------------------------------------------------
   
  - measure: average_age
    decimals: 1
    description: Average user age.
    sql: ${age}
    type: average

  - measure: count
    description: Number of users.
    drill_fields: [ id
                  , last_name
                  , first_name
                  ]
    type: count

  - measure: count_in_ca
    description: Number of users in California.
    filters:
      state: "California"
    type: count

  - measure: count_in_ca_or_ny
    description: Number of users in California or New York.
    filters:
      state: '"New York", "California"'
    type: count

  - measure: count_in_ny
    description: Number of users in New York.
    filters:
      state: New York
    type: count

  - measure: count_younger_than_40
    description: Number of users younger than 40.
    filters:
      age: "< 40"
    type: count

  - measure: pct_younger_than_40
    description: The share of users younger than 40.
    format: "%.2f%"
    sql: 100.0*${count_younger_than_40}/nullif(${count}, 0)
    type: number
