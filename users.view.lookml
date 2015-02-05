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

  - dimension_group: created_at
    datatype: datetime
    description: User record creation timestamp.
    sql: ${TABLE}.created_at
    timeframes: [ date
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
    
  - dimension: gender
    description: The user gender.
    sql: ${TABLE}.gender
    type: string
  
  - dimension: id
    description: The user id.
    primary_key: true
    sql: ${TABLE}.id
    type: string
    
  - dimension: first_name
    description: The user first name.
    sql: ${TABLE}.first_name
    type: string
    
  - dimension: last_name
    description: The user last name.
    sql: ${TABLE}.last_name
    type: string

  - dimension: state
    description: The user state (location).
    sql: ${TABLE}.state
    type: string

#-------------------------------------------------------------------------------
    
  - measure: count
    description: Number of users.
    drill_fields: [ id
                  , last_name
                  , first_name
                  ]
    type: count
