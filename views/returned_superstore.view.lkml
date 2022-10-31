view: returned_superstore {

  sql_table_name: `Nandhini_Sample.Returned_superstore`
    ;;


  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Order_ID ;;
  }

  dimension: returned {
    type: yesno
    sql: ${TABLE}.Returned ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
