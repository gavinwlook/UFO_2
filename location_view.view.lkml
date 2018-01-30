view: location_view {
  sql_table_name: public.ufo_data ;;

  dimension: shape {
      type: string
      sql: ${TABLE}.shape ;;
      }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  measure: average_latitude {
    type:  average
    sql: ${latitude} ;;
    value_format: "0.##"
  }
  measure: average_longitude {
    type:  average
    sql: ${longitude} ;;
    value_format: "0.##"
  }

 }
