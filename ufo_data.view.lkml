view: ufo_data {
  sql_table_name: public.ufo_data ;;

  view_label: "UFO TEST Data"

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.sighting.raw, '  ', ${TABLE}.location) ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }


#   dimension_group: date_posted {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       week_of_year,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.date_posted ;;
#   }

  dimension_group: date_posted {
     type: time
     timeframes: [
       month,
       year
     ]
     sql: ${TABLE}.date_posted ;;
   }

parameter: year_param {
  suggest_dimension: date_posted_year
  type: date

}

# parameter: week_param {
#   suggest_dimension: date_posted_week_of_year
#   type: date
# }

dimension: year_week {
  type: string
  sql: concat(date_part('year', ufo_data.sighting_date), '-', date_part('month', ufo_data.sighting_date)) ;;
}

  dimension: year_week2 {
    type: date_week
    sql: ufo_data.sighting_date ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

    dimension: duration2 {
    type: number
    sql: ${TABLE}.duration ;;
  }


  dimension: duration_desc {
    type: string
    sql: ${TABLE}.duration_desc ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: shape {
    type: string
    sql: ${TABLE}.shape ;;
  }

  dimension_group: sighting {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      hour,
      hour2,
      day_of_week,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.sighting_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: location {
  type: location
  sql_latitude:${latitude} ;;
  sql_longitude:${longitude} ;;
}

# Gratuitous changes for testing git

#   dimension: location {
#     type: location
#     sql_latitude:${latitude} ;;
#     sql_longitude:${longitude} ;;
#   }
#

measure: lat_count {
  type: number
  sql: sum(CASE WHEN ${latitude}>0
      THEN 1
     ELSE 0
      END)
      ;;
}

measure: percentage {
  type: number
  sql: ${lat_count}/${count} ;;
}


  dimension: hashed_city {
    type: string
    sql:
      CASE WHEN '{{ _user_attributes["can_see_ssn"] }}' = 'y'
        THEN ${TABLE}.shape
      ELSE
        MD5(${TABLE}.shape || ${TABLE}.city)
      END ;;
    #Note: || is string concatenation. Update as necessary for your SQL dialect.
    # We are illustrating a salted hash to mask sensitive data, but you should
    # consult with your information security team to evaluate the acceptability of this approach.
      html:
       {% if _user_attributes["can_see_ssn"]  == 'y' %}
         {{ value }}
       {% else %}
         [Masked]
       {% endif %}  ;;
    }

dimension: Top_10_Average_Duration {
  type: number
  sql:  (select AVG(10duration) from (select ${duration}
  from ${TABLE} as 10duration
  order by ${duration} desc
  limit 10)) ;;

}


  measure: count {
    type: count
   drill_fields: [location]
  }

  measure: count2 {
    type: count
    drill_fields: [location]
  }


  measure: whatever {
    type: count_distinct
    drill_fields: [location]
  }

  measure: average_duration {
    type:  average
    sql: ${duration} ;;
    value_format: "0.##"
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

  measure: min_duration {
    type: min
    sql: ${duration} ;;
    value_format: "0"
  }

  measure: max_duration {
    type: max
    sql: ${duration} ;;
    value_format: "0"
  }

#   measure: count_before_today {
#      type: count
#
#     filters: {
#       field: date_posted_date
#       value: "before yesterday"
#     }
#   }

  measure: median {
    type: median
    sql: COUNT(${shape}) ;;
  }


  measure: count22 {
    type: count
    drill_fields: [location]
    filters: {
      field: date_posted_month
      value: "this month"
    }
}




  measure: sum_distinct {
    type: sum_distinct
    sql: ${country} ;;
  }

#   measure: test_60 {
#   type: sum sql: 183,080/60;;
#   }

  measure: straight_count {
    type: number
    sql: count(*) ;;
  }


}
