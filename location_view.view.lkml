view: location_view {

    derived_table: {
      sql: SELECT
        shape,
        AVG(latitude) AS avg_latitude,
        AVG(longitude) AS avg_longitude
      FROM
        public.ufo_data
      GROUP BY
        shape
 ;;
      persist_for: "24 hours"
      indexes: ["shape"]
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: shape {
      primary_key: yes
      type: string
      sql: ${TABLE}.shape ;;
    }

    dimension: avg_latitude {
      type: string
      sql: ${TABLE}.avg_latitude ;;
    }

    dimension: avg_longitude {
      type: string
      sql: ${TABLE}.avg_longitude ;;
    }

    set: detail {
      fields: [shape, avg_latitude, avg_longitude]
    }
  }
