- dashboard: testemoji_dash
  title: TestEmoji Dash
  layout: newspaper
  elements:
  - title: Map
    name: Map
    note:
      text: 'LOADSA TEXT XXXXXXXXXX😀❤️️💔👩❤️💋👩🧙XXXXXXXXXXXXXXX'
      state:  collapsed
      display: hover
    model: ufo_model
    explore: ufo_data
    type: looker_map
    fields:
    - average_locations_by_shape.shape
    - average_locations_by_shape.avg_location
    - ufo_data.country
    - ufo_data.count
    filters:
      ufo_data.count: ">=500"
      ufo_data.country: us
    sorts:
    - average_locations_by_shape.avg_location
    limit: 500
    column_limit: 50
    filter_expression: ${ufo_data.country} = "us"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    map_latitude: 38.013476231041935
    map_longitude: -90.98876953125001
    map_zoom: 5
    hidden_fields:
    - ufo_data.country
    row: 0
    col: 0
    width: 8
    height: 6
