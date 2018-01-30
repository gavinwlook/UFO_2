view: location_view {

  derived_table: {
    sql:
      SELECT
        shape,
        AVG(latitude) AS "average_latitude",
        AVG(longitude) AS "average_longitude"
      FROM
        public.ufo_data
      GROUP BY
        shape ;;

    persist_for: "24 hours"
    indexes: ["shape"]
  }

#  dimension: avg_location {
#    type:  location
#    sql_latitude: ${TABLE}.avg_latitude ;;
#    sql_longitude: ${TABLE}.avg_longitude ;;
#  }

  dimension: shape {
      type: string
      primary_key: yes
      sql: ${TABLE}.shape ;;
      }

  dimension: average_latitude {
    type:  number
    sql: ${TABLE}.avg_latitude ;;

  }
 dimension: average_longitude {
    type:  number
    sql: ${TABLE}.avg_longitude ;;
#    value_format: "string"}
}
}
