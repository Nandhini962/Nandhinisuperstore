view: giftsales {

  derived_table: {
    sql:  select "Furniture" as category,  "pen" as free_gift, union all
      select "Office Supplies" as category,  "water bottle" as free_gift, union all
      select "Technology" as category,  "chocklate box" as free_gift

      ;;
  }

  dimension: category {
    primary_key: yes
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: free_gift {
    type:  string
    sql: ${TABLE}.free_gift ;;
  }

  measure: count {
    type:  count
  }


}
