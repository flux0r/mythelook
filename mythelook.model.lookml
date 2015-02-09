- connection: thelook

- scoping: true
- include: "*.view.lookml"
- include: "*.dashboard.lookml"

- explore: order_items
  
- explore: users

- explore: products

- explore: orders
  conditionally_filter:
    created: 10 days
    unless: [id]
  joins:
    - join: users
      foreign_key: id
