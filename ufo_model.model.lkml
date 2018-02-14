connection: "postgres_local"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: Xfiles2 {
  sql_trigger: SELECT CASE WHEN count(*) >= 5000 THEN 'yes'
            ELSE NULL end
  FROM ufo_data;;
}

explore: ufo_data {

  sql_always_where:  ufo_data.country = 'us' ;;

  always_filter: {
    filters: {
      field: country
      value: "us"
    }
  }

  join: average_locations_by_shape {

    view_label: "UFO Locations"
    fields:  [shape, avg_location]
    relationship: many_to_one
    sql_on: ufo_data.shape = average_locations_by_shape.shape ;;
    type: inner
  }

  join: average_locations_by_triangle {
    view_label: "UFO Triangle Locations"
    from: average_locations_by_shape
    fields:  [shape, avg_location]
    relationship: many_to_one
    sql_on: ufo_data.shape = average_locations_by_triangle.shape and ufo_data.shape = 'triangle';;
    type: inner
  }


}

#dimension: field_name {
#  type: location
#  sql_latitude:${field_name_1} ;;
#  sql_longitude:${field_name_2} ;;
#}
