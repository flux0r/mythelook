view: orders

  fields:

#-------------------------------------------------------------------------------

    - dimension: id
      description: The order id.
      primary_key: true
      sql: ${TABLE}.id
      type: int

    - dimension_group: created
      datatype: datetime
      description: Order creation timestamp.
      sql: ${TABLE}.created_at
      timeframes: [date, month, time, week]

    - dimension: status
      description: The order status.
      sql: ${TABLE}.status
      type: string

    - dimension: user_id
      description: The order's user id.
      sql: ${TABLE}.user_id
      type: int

#-------------------------------------------------------------------------------

    - measure: count
      description: Number of orders.
      type: count
