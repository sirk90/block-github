include: "/views/commit.view"
include: "/views/user_email.view"
include: "/views/user.view"
include: "/views/commit_file.view"
include: "/views/repository.view"
include: "/views/dt_rank.view"
include: "/views/dt_message_words.view"

explore: commit {
  join: user_email {
    type: left_outer
    sql_on: ${commit.author_email} = ${user_email.email} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${user_email.user_id} = ${user.id} ;;
    relationship: one_to_one
  }
  join: commit_file {
    type: left_outer
    sql_on: ${commit.sha} = ${commit_file.commit_sha} ;;
    relationship: one_to_many
  }
  join: repository {
    type: left_outer
    sql_on: ${commit.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }
  join: repository_owner {
    fields: [owner_name]
    view_label: "Repository"
    from: user
    type: left_outer
    sql_on: ${repository.owner_id} = ${repository_owner.id} ;;
    relationship: many_to_one
  }
  join: dt_rank {
    type: left_outer
    sql_on: ${user.id} = ${dt_rank.user_id} ;;
    relationship: one_to_one
  }
  join: dt_message_words {
    type: left_outer
    sql_on: ${commit.sha} = ${dt_message_words.sha} ;;
    relationship: one_to_many
  }
}
