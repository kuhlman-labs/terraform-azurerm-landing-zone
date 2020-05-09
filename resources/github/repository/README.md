## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| github | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_merge\_commit | (Optional) Set to false to disable merge commits on the repository. | `bool` | `true` | no |
| allow\_rebase\_merge | (Optional) Set to false to disable rebase merges on the repository. | `bool` | `true` | no |
| allow\_squash\_merge | (Optional) Set to false to disable squash merges on the repository. | `bool` | `true` | no |
| archived | (Optional) Specifies if the repository should be archived. Defaults to false. | `bool` | `false` | no |
| auto\_init | (Optional) Set to true to produce an initial commit in the repository. | `bool` | `true` | no |
| default\_branch | (Optional) The name of the default branch of the repository. NOTE: This can only be set after a repository has already been created, and after a correct reference has been created for the target branch inside the repository. This means a user will have to omit this parameter from the initial repository creation and create the target branch inside of the repository prior to setting this attribute. | `string` | `null` | no |
| description | (Optional) A description of the repository. | `string` | `null` | no |
| gitignore\_template | (Optional) Use the name of the template without the extension. For example, Haskell. | `string` | `null` | no |
| has\_downloads | (Optional) Set to true to enable the (deprecated) downloads features on the repository. | `bool` | `true` | no |
| has\_issues | (Optional) Set to true to enable the GitHub Issues features on the repository. | `bool` | `false` | no |
| has\_projects | (Optional) Set to true to enable the GitHub Projects features on the repository. Per the github documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error. | `bool` | `false` | no |
| has\_wiki | (Optional) Set to true to enable the GitHub Wiki features on the repository. | `bool` | `false` | no |
| homepage\_url | (Optional) URL of a page describing the project. | `string` | `null` | no |
| license\_template | (Optional) Use the name of the template without the extension. For example, mit or mpl-2.0. | `string` | `null` | no |
| name | (Required) The name of the repository. | `string` | n/a | yes |
| organization | (Optional) This is the target GitHub organization to manage. The account corresponding to the token will need owner privileges for this organization. It must be provided, but it can also be sourced from the GITHUB\_ORGANIZATION environment variable. | `string` | n/a | yes |
| private | (Optional) Set to true to create a private repository. Repositories are created as public (e.g. open source) by default. | `bool` | `false` | no |
| token | (Optional) This is the GitHub personal access token. It must be provided, but it can also be sourced from the GITHUB\_TOKEN environment variable. | `string` | n/a | yes |
| topics | (Optional) The list of topics of the repository. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| full\_name | A string of the form orgname/reponame. |
| git\_clone\_url | URL that can be provided to git clone to clone the repository anonymously via the git protocol. |
| html\_url | URL to the repository on the web. |
| http\_clone\_url | A string of the form orgname/reponame. |
| ssh\_clone\_url | URL that can be provided to git clone to clone the repository via SSH. |
| svn\_url | URL that can be provided to svn checkout to check out the repository via GitHub's Subversion protocol emulation. |

