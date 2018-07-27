

view: pdt_example {
# Or, you could make this view a derived table, like this:
derived_table: {
     sql:
      SELECT
        public.ufo_data.date_posted as date,
        'Started' AS category,
        COUNT(*) as tickets
      FROM ufo_data
      GROUP BY 1, 2
      UNION ALL
      SELECT
        public.ufo_data.sighting_date as date,
        'Ended' AS category,
        COUNT(*) as tickets
      FROM ufo_data
      GROUP BY 1, 2
       ;;
   }

#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
  dimension: date {
    description: "The date"
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: category {
    description: "Your category"
    type: string
    sql: ${TABLE}.category ;;
  }

  measure: tickets {
    description: "Use this for counting lifetime orders across many users"
     type: sum
    sql: ${TABLE}.tickets ;;
  }
 }
