- view: products

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

    - measure: count
      description: The product count.
      drill_fields: [item_info*]
      type: count

    - measure: count_brand
      description: The number of brands.
      sql: ${brand}
      type: count_distinct

    - measure: count_pants
      description: The number of pants.
      drill_fields: [item_info*, sku_etc*]
      filters:
        category: Pants
      type: count

    - measure: count_shorts
      description: The number of shorts.
      drill_fields: [id, item_name, brand]
      filters:
        category: Shorts
      type: count

    - measure: count_skirts
      description: The number of skirts.
      drill_fields: [skus_etc*, brand]
      filters:
        category: Skirts
      type: count

#-------------------------------------------------------------------------------

  sets:

    item_info: [id, item_name, brand, department, category]
    sku_etc: [id, sku]
