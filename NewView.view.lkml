# If necessary, uncomment the line below to include explore_source.
include: "ufo_model.model.lkml"

view: add_a_unique_name_1518186549 {
  derived_table: {
    explore_source: ufo_data {
      column: city {}
      column: country {}
      column: count {}
      filters: {
        field: ufo_data.country
        value: "us"
      }
    }
  }
  dimension: city {
    label: "UFO Data City"
  }
  dimension: country {
    label: "UFO Data Country"
  }
  dimension: count {
    label: "UFO Data Count"
    type: number
  }
}
