# Define the database connection to be used for this model.

connection: "looker_capability"

# include all the views
include: "/views/**/*.view"

datagroup: superstoredatagroup {
  max_cache_age: "24 hours"
  sql_trigger: SELECT max(id) FROM superstore ;;
  interval_trigger: "12 hours"
  label: "desired label"
  description: "description string"
}


explore:giftsales{}



explore: SalesProducts {}

explore: Salesdetails {}

explore: gifts {}

explore: returned_superstore {}

explore: superstore {
  #sql_always_where: ${city} = 'Abilene' ;;


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
