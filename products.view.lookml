- view: users

  fields:

#-------------------------------------------------------------------------------

    - dimension: brand
      description: The product brand.
      sql: ${TABLE}.brand
      type: string
    
    - dimension: category
      description: The product category.
      sql: ${TABLE}.category
      type: string

    - dimension: department
      description: The product department.
      sql: ${TABLE}.department
      type: string
    
    - dimension: id
      description: The product id.
      primary_key: true
      sql: ${TABLE}.id
      type: int

    - dimension: item_name
      description: The name of the product.
      sql: ${TABLE}.item_name
      type: string

    - dimension: rank
      description: The product rank.
      sql: ${TABLE}.rank
      type: int

    - dimension: retail_price
      description: The price of the product.
      sql: ${TABLE}.retail_price
      type: number

    - dimension: sku
      description: The product SKU.
      sql: ${TABLE}.sku
      type: string

#-------------------------------------------------------------------------------

    - measure: brand_count
      description: The number of brands.
      sql: ${brand}
      type: count_distinct

    - measure: count
      description: The product count.
      type: count
