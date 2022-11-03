view: Salesdetails {
  derived_table: {
    explore_source: superstore {
      column: category {field: superstore.category}
      column: city {field: superstore.city }
      column: sales {field: superstore.sales}
      column: discount {field: superstore.discount}
    }
  }


  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: discount {
    type: number
    value_format: "0"
    sql: ${TABLE}.Discount ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: sales {
    type: number
    value_format: "0"
    sql: ${TABLE}.Sales ;;
  }

}
