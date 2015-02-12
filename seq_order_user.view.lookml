- view: seq_order_user
  derived_table:
    sql: |
      select
              id
            , row_number() over
              (
                      partition by user_id
                      order by created
              ) seq
      from
              orders
  fields:
  - dimension: id
    description: The order id.
    primary_key: true
    sql: ${TABLE}.id
    type: int
  - dimension: seq
    description: The sequence number of the order for the user.
    sql: ${TABLE}.seq
    type: int
