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
