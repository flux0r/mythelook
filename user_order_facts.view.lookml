- view: user_order_facts
  derived_table:
    sql: |
      select
              o.user_id
            , count(distinct o.id) lifetime_orders
            , coalesce(sum(oi.sale_price), 0.0) lifetime_sales
      from
              order_items oi
              join orders o
              on oi.order_id = o.id
      where
              oi.returned_at is null
      group by
              o.user_id

  fields:

#-------------------------------------------------------------------------------
  
  - dimension: lifetime_orders
    description: The number of orders the user has placed.
    sql: ${TABLE}.lifetime_orders
    type: int

  - dimension: lifetime_sales
    description: >
      The total amount of sales for the user (not including returned items).
    sql: ${TABLE}.lifetime_sales
    type: number

  - dimension: tier_lifetime_orders
    description: Grouping of number of orders.
    sql: ${lifetime_orders}
    tiers: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    type: tier

  - dimension: tier_lifetime_sales
    description: Grouping of the amount of sales for the user.
    sql: ${lifetime_sales}
    tiers: [0, 1, 10, 100, 1000]
    type: tier

  - dimension: user_id
    description: The user id.
    primary_key: true
    sql: ${TABLE}.user_id
    type: int

#-------------------------------------------------------------------------------

  - measure: count_users
    description: The number of user ids.
    type: count
