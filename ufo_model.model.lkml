connection: "postgres_local"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

#datagroup: Xfiles {
#  sql_trigger:
#  sql_trigger_value:
#  CASE WHEN COUNT(*) >= 5000
#THEN select count(*) from ufo_data
#  ELSE NULL
#  END ;;
#}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: ufo_data {}

#dimension: field_name {
#  type: location
#  sql_latitude:${field_name_1} ;;
#  sql_longitude:${field_name_2} ;;
#}
