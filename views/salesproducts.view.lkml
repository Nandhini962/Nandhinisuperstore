view: SalesProducts {
  derived_table: {
    sql:
      SELECT

      row_number() OVER() AS prim_key,
      *
      FROM
        Superstore
     GROUP BY
    1
ORDER BY
    1
LIMIT 500;;
  }


  dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }
}
