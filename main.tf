resource "github_team" "team" { 
  name = var.team_name
}


# resource
resource "github_team_membership" "team_membership" {
  for_each = toset(var.team_members)
  team_id  = github_team.team.id
  username = each.key
  role     = var.role
}


resource "github_team_repository" "manage_access_repository" {
  for_each   = toset(var.repos)
  team_id    = github_team.team.id
  repository = each.key
  permission = "admin"
}