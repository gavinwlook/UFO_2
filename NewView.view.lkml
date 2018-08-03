# If necessary, uncomment the line below to include explore_source.
include: "ufo_model.model.lkml"

view: NewView {
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

  dimension: test_dim{
    label: "just a test"
    sql: ${country} ;;
  }

dimension: another_count {
  label: "UFO Data Count"
  type: number
}
}
