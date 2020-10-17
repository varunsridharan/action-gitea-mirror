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

---

## 📝 Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[Checkout CHANGELOG.md](/CHANGELOG.md)

## 🤝 Contributing
If you would like to help, please take a look at the list of [issues](issues/).

## 💰 Sponsor
[I][twitter] fell in love with open-source in 2013 and there has been no looking back since! You can read more about me [here][website].
If you, or your company, use any of my projects or like what I’m doing, kindly consider backing me. I'm in this for the long run.

- ☕ How about we get to know each other over coffee? Buy me a cup for just [**$9.99**][buymeacoffee]
- ☕️☕️ How about buying me just 2 cups of coffee each month? You can do that for as little as [**$9.99**][buymeacoffee]
- 🔰         We love bettering open-source projects. Support 1-hour of open-source maintenance for [**$24.99 one-time?**][paypal]
- 🚀         Love open-source tools? Me too! How about supporting one hour of open-source development for just [**$49.99 one-time ?**][paypal]

## 📜  License & Conduct
- [**MIT**](LICENSE) © [Varun Sridharan](website)
- [Code of Conduct](code-of-conduct.md)

## 📣 Feedback
- ⭐ This repository if this project helped you! :wink:
- Create An [🔧 Issue](issues/) if you need help / found a bug

## Connect & Say 👋
- **Follow** me on [👨‍💻 Github][github] and stay updated on free and open-source software
- **Follow** me on [🐦 Twitter][twitter] to get updates on my latest open source projects
- **Message** me on [📠 Telegram][telegram]
- **Follow** my pet on [Instagram][sofythelabrador] for some _dog-tastic_ updates!

---

<p align="center">
<i>Built With ♥ By <a href="https://sva.onl/twitter"  target="_blank" rel="noopener noreferrer">Varun Sridharan</a> <a href="https://en.wikipedia.org/wiki/India"><img src="https://cdn.svarun.dev/flag-india-flat.svg" width="20px"/></a> </i>
</p>

---

<!-- Personl Links -->
[paypal]: https://sva.onl/paypal
[buymeacoffee]: https://sva.onl/buymeacoffee
[sofythelabrador]: https://www.instagram.com/sofythelabrador/
[github]: https://sva.onl/github/
[twitter]: https://sva.onl/twitter/
[telegram]: https://sva.onl/telegram/
[email]: https://sva.onl/email
[website]: https://sva.onl/website/

[gitea]: https://gitea.org
[ggms]: https://github.com/varunsridharan/github-gitea-mirror