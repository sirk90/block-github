
view: issue_label {
  sql_table_name: @{GITHUB_SCHEMA}.issue_label ;;

  dimension_group: _fivetran_synced {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: label_id {
    type: string
    sql: ${TABLE}.label_id ;;
  }

  dimension: label {
    type: string
    sql: ${label.name} ;;
  }

  measure: count {
    label: "Label Count"
    type: count
    drill_fields: [issue.id]
  }
}
