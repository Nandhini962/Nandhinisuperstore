
connection: "looker_capability"


include: "/views/**/*.view"


datagroup: looker_superstore_default_datagroup {

  max_cache_age: "1 hour"
}

persist_with: looker_superstore_default_datagroup

explore: gifts {}

explore: Salesdetails {}

explore: SalesProducts {}

explore: returned_superstore {}

explore: superstore {

join: returned_superstore {
  type: left_outer
  sql_on: ${superstore.order_id} =  ${returned_superstore.order_id} ;;
  relationship: many_to_one
}

  join: gifts  {
    type: left_outer
    sql_on: ${superstore.category} = ${gifts.category};;
    relationship: many_to_one
  }


join: Salesdetails {
  type: left_outer
  sql_on: ${superstore.category} = ${Salesdetails.category} ;;
  relationship: many_to_one
}

join: SalesProducts {
  type: left_outer
  sql_on: ${superstore.region} = ${SalesProducts.region};;
  relationship: many_to_one
}


}
