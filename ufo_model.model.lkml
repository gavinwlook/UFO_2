connection: "postgres_local"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: Xfiles2 {
  sql_trigger: SELECT CASE WHEN count(*) >= 5000 THEN 'yes'
            ELSE NULL end
  FROM ufo_data;;
}

explore: ufo_data {

  join: location_view {

    view_label: "UFO Locations"
    fields:  [shape, aver_latitude, aver_longitude]
    foreign_key: shape
    from: location_view
    outer_only: no
    relationship: many_to_one
    #sql_on: ufo_data.shape = location_view.shape ;;
    sql_table_name: ufo_data ;;
    type: inner


  }

}

#dimension: field_name {
#  type: location
#  sql_latitude:${field_name_1} ;;
#  sql_longitude:${field_name_2} ;;
#}
