view: TestPDT {
  derived_table: {
    indexes: ["shape"]
    persist_for: "10 hours"
    explore_source: ufo_data {
      column: count {}
      column: shape {}
      column: sighting_month {}
      filters: {
        field: ufo_data.sighting_date
        value: "after 2000/01/01"
      }
    }
  }
  dimension: count {
    label: "UFO TEST Data Count"
    type: number
  }
  dimension: shape {
    label: "UFO TEST Data Shape"
  }
  dimension: sighting_month {
    label: "UFO TEST Data Sighting Month"
    type: string
  }

   measure: median_count {
     label: "Median Count"
     type: median
    sql: ${count} ;;
   }
}
