view: superstore {

  sql_table_name: Nandhini_Sample.Superstore
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
    }

  dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }

  measure: customers_by_state {
    type: count
    filters: [city: "Abilene"]
  }

  dimension: city {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }


  dimension: customer_id {
    type: string
    sql: ${TABLE}.Customer_ID ;;
    drill_fields: [product_name, city]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: discount {
    type: number
    value_format: "0"
    sql: ${TABLE}.Discount ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name;;
    drill_fields: [product_type*]
  }




  set: product_type {
    fields: [category,sub_category,customer_name,customer_id]
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Order_Date ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_ID ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.Postal_Code ;;
  }


  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: profit {
    type: number
    value_format: "0"
    sql: ${TABLE}.Profit ;;
  }



  dimension: Sales_Feedback {
    case: {
      when: {
        sql: ${sales} >= 1000;;
        label: "Good"
      }

      when: {
        sql: ${sales} > 500 AND ${sales} <= 999 ;;
        label: "Average"
      }

      when: {
        sql: ${sales} < 100 ;;
        label: "Low "
      }
      else:"Below Average"
    }
  }

  measure: total_profit {
    type: sum
    sql: ${profit} ;;
  }

  measure: profits {
    type: number
    value_format: "0"
    sql: ${TABLE}.Profit ;;
  }

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "total profits"
      value: "Profit"
    }

    allowed_value: {
      label: "total sales"
      value: "Sales"
  }
  }

  measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "usd"
  }

  measure: product_total_sales{
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "usd"
  }


  measure: totalsales {
    type: sum
    value_format: "0"
    sql: ${TABLE}.Sales ;;
  }


  measure: average_profit {
    type: average
    sql: ${profit} ;;
  }

  measure: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: row_id {
    type: number
    sql: ${TABLE}.Row_ID ;;
  }

  dimension: sales {
    type: number
    value_format: "0"
    sql: ${TABLE}.Sales ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }

  dimension_group: ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Ship_Date ;;
  }

  dimension_group: Shipping_days{
    type: duration
    intervals: [day, month,week,quarter,year]
    sql_start: ${TABLE}.order_date ;;
    sql_end: ${TABLE}.ship_date ;;
  }


  dimension: shippingfeedback {
    case: {
      when: {
        sql: ${days_Shipping_days} >= 3;;
        label: "Dispatched Late"
      }

      else:"Dispatched Soon"
    }
  }

  dimension: salesrange {
    type: bin
    bins: [0,10,20,30,40,50,60,70,80,1000]
    style: integer
    sql: ${sales} ;;
  }
  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.State ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name, product_name]
  }

}
