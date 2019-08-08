
# Module `resources/github/repository`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **github:** (any version)

## Input Variables
* `allow_merge_commit` (default `true`): (Optional) Set to false to disable merge commits on the repository.
* `allow_rebase_merge` (default `true`): (Optional) Set to false to disable rebase merges on the repository.
* `allow_squash_merge` (default `true`): (Optional) Set to false to disable squash merges on the repository.
* `archived` (required): (Optional) Specifies if the repository should be archived. Defaults to false.
* `auto_init` (default `true`): (Optional) Set to true to produce an initial commit in the repository.
* `default_branch` (required): (Optional) The name of the default branch of the repository. NOTE: This can only be set after a repository has already been created, and after a correct reference has been created for the target branch inside the repository. This means a user will have to omit this parameter from the initial repository creation and create the target branch inside of the repository prior to setting this attribute.
* `description` (required): (Optional) A description of the repository.
* `gitignore_template` (required): (Optional) Use the name of the template without the extension. For example, Haskell.
* `has_downloads` (default `true`): (Optional) Set to true to enable the (deprecated) downloads features on the repository.
* `has_issues` (required): (Optional) Set to true to enable the GitHub Issues features on the repository.
* `has_projects` (required): (Optional) Set to true to enable the GitHub Projects features on the repository. Per the github documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error.
* `has_wiki` (required): (Optional) Set to true to enable the GitHub Wiki features on the repository.
* `homepage_url` (required): (Optional) URL of a page describing the project.
* `license_template` (required): (Optional) Use the name of the template without the extension. For example, mit or mpl-2.0.
* `name` (required): (Required) The name of the repository.
* `organization` (required): (Optional) This is the target GitHub organization to manage. The account corresponding to the token will need owner privileges for this organization. It must be provided, but it can also be sourced from the GITHUB_ORGANIZATION environment variable.
* `private` (required): (Optional) Set to true to create a private repository. Repositories are created as public (e.g. open source) by default.
* `token` (required): (Optional) This is the GitHub personal access token. It must be provided, but it can also be sourced from the GITHUB_TOKEN environment variable.
* `topics` (required): (Optional) The list of topics of the repository.

## Output Values
* `full_name`: A string of the form orgname/reponame.
* `git_clone_url`: URL that can be provided to git clone to clone the repository anonymously via the git protocol.
* `html_url`: URL to the repository on the web.
* `http_clone_url`: A string of the form orgname/reponame.
* `ssh_clone_url`: URL that can be provided to git clone to clone the repository via SSH.
* `svn_url`: URL that can be provided to svn checkout to check out the repository via GitHub's Subversion protocol emulation.

## Managed Resources
* `github_repository.base` from `github`

