connection: "@{CONNECTION_NAME}"

## Model Assets
datagroup: block_github_commits_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

## Model Settings
persist_with: block_github_commits_default_datagroup

## Include Explores
include: "explores/commit.explore"
include: "explores/issue.explore"
include: "explores/pull_request.explore"
include: "explores/team.explore"

## Include Dashboards
include: "dashboards/github_issues.dashboard"
include: "dashboards/github_repo_overview.dashboard"
