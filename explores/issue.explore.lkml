include: "/views/issue.view"
include: "/views/user.view"
include: "/views/issue_assignee.view"
include: "/views/issue_comment.view"
include: "/views/issue_label.view"
include: "/views/label.view"
include: "/views/issue_mention.view"
include: "/views/issue_merged.view"
include: "/views/issue_referenced.view"
include: "/views/issue_renamed.view"
include: "/views/repository.view"

explore: issue {
  join: creator_user_info {
    from: user
    type: left_outer
    sql_on: ${issue.user_id} = ${creator_user_info.id} ;;
    relationship: one_to_many
  }
  join: issue_assignee {
    type: left_outer
    sql_on: ${issue.id} = ${issue_assignee.issue_id} ;;
    relationship: one_to_many
    fields: []
  }
  join: assignee_user_info {
    from: user
    type: left_outer
    sql_on: ${issue_assignee.user_id} = ${assignee_user_info.id} ;;
    relationship: one_to_many
  }
  join: issue_comment {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_comment.issue_id} ;;
    relationship: one_to_many
  }
  join: comment_user_info {
    from: user
    type: left_outer
    sql_on: ${issue_comment.user_id} = ${comment_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_label {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_label.issue_id} ;;
    relationship: one_to_one
  }
  join: label {
    relationship: many_to_one
    fields: []
    sql_on: ${label.id} = ${issue_label.label_id} ;;
  }
  join: issue_mention {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_mention.issue_id} ;;
    relationship: one_to_one
  }
  join: mentioned_user_info {
    from: user
    type: left_outer
    sql_on: ${issue_mention.user_id} = ${mentioned_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_merged {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_merged.issue_id} ;;
    relationship: one_to_one
  }
  join: merge_user_info {
    from: user
    type: left_outer
    sql_on: ${issue_merged.actor_id} = ${merge_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_referenced {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_referenced.issue_id} ;;
    relationship: one_to_one
  }
  join: referenced_user_info {
    from: user
    type: left_outer
    sql_on: ${issue_referenced.actor_id} = ${referenced_user_info.id} ;;
    relationship: one_to_one
  }
  join: issue_renamed {
    view_label: "Issue"
    type: left_outer
    sql_on: ${issue.id} = ${issue_renamed.issue_id} ;;
    relationship: one_to_one
  }
  join: repository {
    type: left_outer
    sql_on: ${issue.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }
}
