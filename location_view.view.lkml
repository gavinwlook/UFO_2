view: location_view {

  derived_table: {
    sql:
      SELECT
        shape,
        AVG(latitude) AS avg_latitude,
        AVG(longitude) AS avg_longitude
      FROM
        public.ufo_data
      GROUP BY
        shape ;;

    persist_for: "24 hours"
  }

  dimension: shape {
      type: string
      primary_key: yes
      sql: ${TABLE}.shape ;;
      }

  measure: average_latitude {
    type:  average
    sql: ${TABLE}.avg_latitude ;;
    value_format: "0.##"
  }
  measure: average_longitude {
    type:  average
    sql: $${TABLE}.avg_longitude ;;
    value_format: "0.##"
  }

 }
