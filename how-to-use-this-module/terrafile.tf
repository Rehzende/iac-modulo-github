provider "github" {
  owner = "teste-team-module"
}

locals {
  mentoriaiac_teams = {
    organizadores = {
      role   = "member"
      repos        = data.github_repositories.mentoriaiac_all_repos.names
      team_members = ["user1", "user2"]
    },
    moderadores = {
      role   = "member"
      repos        = data.github_repositories.mentoriaiac_all_repos.names
      team_members = ["user1", "user2"]
    }
  }
}

data "github_repositories" "mentoriaiac_all_repos" {
  query = "org:teste-team-module language:all"
}


module "github_team_developers" {
  source       = "../."
  for_each     = local.mentoriaiac_teams
  team_name    = each.key
  repos        = each.value.repos
  team_members = each.value.team_members
  role         = each.value.role
}

