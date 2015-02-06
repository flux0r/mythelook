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

  - measure: count_expensive_items
    description: Number of order items with a price over 100.0.
    filters:
      sale_price: "> 100.0"
    type: count

  - measure: pct_expensive_items
    description: Share of order items that have a price over 100.0.
    format: "%.1f%"
    sql: 100.0*${count_expensive_items}/nullif(${count}, 0)
    type: number

  - measure: total_sales
    description: The total sale price for the order items.
    format: "$%.2f"
    sql: ${sale_price}
    type: sum

  - measure: total_sales_expensive_items
    description: Sum of sales price for items over $100.
    filters:
      sale_price: "> 100.0"
    format: "%.2f"
    sql: ${sale_price}
    type: sum

  - measure: total_sales_pound_sign
    description: The total sale price for the order items with a £ sign.
    format: "£ %.2f"
    sql: ${sale_price}
    type: sum
