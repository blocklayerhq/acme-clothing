workflow "Blocklayer" {
  on = "push"
  resolves = ["bl-run"]
}

# Filter to pushes to a specific branch. In this case, master.
action "master-branch-filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "bl-run" {
  uses = "./.github/actions/bl"
  needs = "master-branch-filter"
  env = {
    BL_API_SERVER = "http://demo.infralabs.io:8080/query"
  }
}
