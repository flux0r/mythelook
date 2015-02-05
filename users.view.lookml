- view: users

  fields:
  
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
    
  - measure: count
    description: Number of users.
    drill_fields: [ id
                  , last_name
                  , first_name
                  ]
    type: count