include: "/views/team.view"
include: "/views/team_membership.view"
include: "/views/user.view"
include: "/views/user_email.view"
include: "/views/repo_team.view"

explore: team {
  join: team_membership {
    fields: []
    type: left_outer
    sql_on: ${team.id} = ${team_membership.team_id} ;;
    relationship: one_to_many
  }
  join: user {
    type: left_outer
    sql_on: ${team_membership.user_id} = ${user.id} ;;
    relationship: one_to_many
  }
  join: user_email {
    type: left_outer
    sql_on: ${user.id} = ${user_email.user_id} ;;
    relationship: many_to_one
  }
  join: repo_team {
    type: left_outer
    sql_on: ${team.id} = ${repo_team.team_id} ;;
    relationship: one_to_one
  }

}
