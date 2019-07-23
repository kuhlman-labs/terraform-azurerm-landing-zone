output "full_name" {
  value = github_repository.base.full_name
  description = "A string of the form orgname/reponame."
}

output "html_url" {
  value = github_repository.base.html_url
  description = "URL to the repository on the web."
}

output "ssh_clone_url" {
  value = github_repository.base.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}

output "http_clone_url" {
  value = github_repository.base.http_clone_url
  description = "A string of the form orgname/reponame."
}

output "git_clone_url" {
  value = github_repository.base.git_clone_url
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}

output "svn_url" {
  value = github_repository.base.svn_url
  description = "URL that can be provided to svn checkout to check out the repository via GitHub's Subversion protocol emulation."
}
