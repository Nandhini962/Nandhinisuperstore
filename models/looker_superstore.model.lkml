# Define the database connection to be used for this model.

connection: "looker_capability"



# include all the views
include: "/views/**/*.view"

#access_grant: Superstore_attribute {
 # user_attribute: superstore
 # allowed_values: ["Yes"]
#}

access_grant: Superstore_attribute {
  user_attribute: can_super_store
  allowed_values: ["finance"]
}


#access_grant: Super_city {
 # user_attribute: superstore_city
#allowed_values: ["Houston"]}





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
  access_filter: {
    field: superstore.city
    user_attribute: can_super_store
  }
required_access_grants: [Superstore_attribute]
  #sql_always_where: ${city} = 'Abilene' ;;
#sql_always_having: ${sales} >= 5 ;;

 # always_filter: {
 #   filters: [city: "Houston"]
 # }

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
    sql_on: ${superstore.prim_key}= ${SalesProducts.prim_key};;
    relationship: many_to_one
  }


}
