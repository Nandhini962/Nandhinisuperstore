view: SalesProducts {
  derived_table: {
    sql:
      SELECT
        Product_Name,
        Sales ,
        region
      FROM
        Superstore
     GROUP BY
    1,
    2,
    3
ORDER BY
    1
LIMIT 500;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: sales {
    type: number
    value_format: "0"
    sql: ${TABLE}.Sales ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

}
