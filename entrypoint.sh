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

echo "gh_username => $gh_username \n\r"

echo "accesstoken => $accesstoken \n\r"

echo "gitea_host => $gitea_host \n\r"

echo "gitea_username => $gitea_username \n\r"

echo "gitea_accesstoken => $gitea_accesstoken \n\r"

echo "gitea_gist_prefix => $gitea_gist_prefix \n\r"

echo "gitea_gist_surfix => $gitea_gist_surfix \n\r"

echo "gistsSource => $gistsSource \n\r"

echo "gistsStared => $gistsStared \n\r"

echo "repositoryStared => $repositoryStared \n\r"

echo "repositorySource => $repositorySource \n\r"

echo "repositoryForked => $repositoryForked \n\r"
