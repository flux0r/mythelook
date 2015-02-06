- view: order_items

  fields:

#-------------------------------------------------------------------------------

  - dimension: id
    description: The order item id.
    primary_key: true
    sql: ${TABLE}.id
    type: int

  - dimension: inventory_item_id
    description: The inventory item id.
    sql: ${TABLE}.inventory_item_id
    type: int

  - dimension: order_id
    description: The order id.
    sql: ${TABLE}.order_id
    type: int

  - dimension_group: returned_at
    datatype: datetime
    description: Order item return timestamp.
    sql: ${TABLE}.returned_at
    timeframes: [ date
                , month
                , time
                , week
                , year
                ]
    type: time

  - dimension: sale_price
    decimals: 2
    description: The sale price of the order item.
    sql: ${TABLE}.sale_price
    type: number

#-------------------------------------------------------------------------------

  - measure: count
    description: Number of order items.
    type: count

  - measure: total_sale_price
    decimals: 2
    description: The total sale price for the order items.
    sql: ${sale_price}
    type: sum
