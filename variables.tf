
variable "team_members" {
  description = "List of team members"
  type        = list(string)
}

variable "team_name" {
  description = "the team's full name"
  type        = string
}

variable "repos" {
  description = "List of repos"
  type        = list(string)
}

variable "role" {
  description = "List of repos"
  type        = string
}
