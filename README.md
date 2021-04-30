<p align="center"><img src="https://cdn.svarun.dev/gh/varunsridharan/action-gitea-mirror/banner.jpg" /></p>

# Gitea Mirror - **Github Action** 

> ℹ︎  This Action uses [Github > Gitea Mirror Script][ggms]. And The Arguments supported by that script is supported here to

## Requirements
* Self / Cloud Hosted [Gitea](gitea) Instance
* Github Personal Access Token
* Gitea Personal Access Token

### Github Access Token Scopes
* if you want to mirror private repos then select everything under Repo scope
* if you want to mirror public repos then select repo.public_repo scope
* if you want to mirror secret Gists then select gist scope


## Why Github Action ? Can't This Script Run Inside Selfhosted Instance ?
Yes this script [Github > Gitea Mirror][ggms] Can be ran inside the selfhosted instance. but i created this action for few reasons

* This action can be used for ppl how are not tech savvy
* Personally i wanted to remove resource used by [Github > Gitea Mirror][ggms] Script 
* I think that there are some advantages when calling GithubAPI Inside an Github Action


## ⚙️ Configuration
| Option | Description |
| --- | --- |
| `github.username` | Your Github Username |
| `github.accesstoken` | Your Github Account's Personal Access Token |
| - | - | 
| `gitea.host` | Selfhosted Gitea URL without `/` at the end |
| `gitea.accesstoken` | Your Personal Access Token |
| `gitea.username` | Account User Name |
| `gitea.gist.prefix` | Custom Prefix For Repository When Mirroring Gists |
| `gitea.gist.surfix` | Custom Prefix For Repository When Mirroring Gists |
| - | - | 
| `repomap` | Remap A Repository To Diff User | 
| `gistsSource` | set to true to mirror all Gists Created By You| 
| `gistsStared` | set to true to mirror all Gists Stared By You| 
| `repositoryStared` | set to true to mirror all Repository Stared By You | 
| `repositorySource` | set to true to mirror all Repository Created By You | 
| `repositoryForked` | set to true to mirror all Repository Forked By You | 


### Example Workflow File
Below workflow file triggers when anything is pushed to `main` branch or runs every `Day` or can be triggered manually 
Please do make sure to setup the **Secrets**
<!-- START RAW -->
```yaml
name: " ⏳  Gitea Mirror Setup"

on:
  workflow_dispatch:
 
  schedule:
    - cron: 0 0 * * *
  
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: varunsridharan/action-gitea-mirror@main
        name: " ⏳ Setting Up Mirror"
        with:
          gh_username: ${{ secrets.GH_USERNAME }}
          gh_accesstoken: ${{ secrets.GH_TOKEN }}
          gitea_host: ${{ secrets.GITEA_HOST }}
          gitea_username: ${{ secrets.GITEA_USERNAME }}
          gitea_accesstoken: ${{ secrets.GITEA_TOKEN }}
          gitea_gist_prefix: "gist"
          gitea_gist_surfix: ""
          gistsSource: true
          gistsStared: true
          repositoryStared: true
          repositorySource: true
          repositoryForked: true

```
<!-- END RAW -->

<!-- START common-footer.mustache -->


<!-- END common-footer.mustache -->


[gitea]: https://gitea.org
[ggms]: https://github.com/varunsridharan/github-gitea-mirror