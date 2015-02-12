- connection: thelook

- scoping: true
- include: "*.view.lookml"
- include: "*.dashboard.lookml"

- explore: order_items
  
- explore: users

- explore: products

- explore: orders
##   conditionally_filter:
##     created_date: 10 days
##     unless: [id]
  joins:
    - join: users
      foreign_key: user_id
    - join: seq_order_user
      foreign_key: id

- explore: user_order_facts
