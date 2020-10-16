#!/bin/sh

set -eu

gh_username="$INPUT_GH_USERNAME"
accesstoken="$INPUT_ACCESSTOKEN"
gitea_host="$INPUT_GITEA_HOST"
gitea_username="$INPUT_GITEA_USERNAME"
gitea_accesstoken="$INPUT_GITEA_ACCESSTOKEN"
gitea_gist_prefix="$INPUT_GITEA_GIST_PREFIX"
gitea_gist_surfix="$INPUT_GITEA_GIST_SURFIX"
gistsSource="$INPUT_GISTSSOURCE"
gistsStared="$INPUT_GISTSSTARED"
repositoryStared="$INPUT_REPOSITORYSTARED"
repositorySource="$INPUT_REPOSITORYSOURCE"
repositoryForked="$INPUT_REPOSITORYFORKED"

echo " 	⚙️ Setting Up Gitea Mirror Script"
git clone https://github.com/varunsridharan/github-gitea-mirror ./mirror-handler

echo "🗳️  Updating Settings"
template='{"github":{"username":"%s","accesstoken":"%s"},"gitea":{"host":"%s","accesstoken":"%s","username":"%s","default_userpassword":"%s","gist":{"prefix":"%s","surfix":"%s"}},"repomap":{},"gistsSource":%s,"gistsStared":%s,"repositoryStared":%s,"repositorySource":%s,"repositoryForked":%s}'
json_string=$(printf "$template" "$gh_username" "$accesstoken" "$gitea_host" "$gitea_accesstoken" "$gitea_username" "RY7VpBD62P7964c9mSz%2GAM82hv68yUbHc4@Gdw8c%f^W3*qdzof*8a6b^rKy" "$gitea_gist_prefix" "$gitea_gist_surfix" "$gistsSource" "$gistsStared" "$repositoryStared" "$repositorySource" "$repositoryForked")
echo "$json_string" >./mirror-handler/src/config.json

if [ "$gistsSource" == "true" ]; then
  echo "###[group] ⏳ Setting Up Mirror For Public & Private Gits"
  python3 ./mirror-handler/gist.py
  echo "###[endgroup]"
fi

if [ "$gistsStared" == "true" ]; then
  echo "###[group] ⏳ Setting Up Mirror For Stared Gits"
  python3 ./mirror-handler/giststared.py
  echo "###[endgroup]"
fi

if [ "$repositorySource" == "true" ]; then
  echo "###[group] ⏳ Setting Up Mirror For Public & Private Source Repository"
  python3 ./mirror-handler/repoSource.py
  echo "###[endgroup]"
fi

if [ "$repositoryForked" == "true" ]; then
  echo "###[group] ⏳ Setting Up Mirror For Forked Repository"
  python3 ./mirror-handler/repoForked.py
  echo "###[endgroup]"
fi

if [ "$repositoryStared" == "true" ]; then
  echo "###[group] ⏳ Setting Up Mirror For Stared Repository"
  python3 ./mirror-handler/repoStared.py
  echo "###[endgroup]"
fi
