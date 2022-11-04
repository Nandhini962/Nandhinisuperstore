# Define the database connection to be used for this model.
connection: "looker_capability"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: looker_superstore_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_superstore_default_datagroup


explore: returned_superstore {
  label: "Returned Superstore"
}

explore: superstore {
  label: "superstore"
}

explore: salesperson_staging{
  label: "salesperson staging"

  join: superstore {
    view_label: "superstore"
    sql_on:${superstore.customer_id} =  ${salesperson_staging.customer_id} ;;
    relationship: many_to_one
    type: left_outer
}
}
