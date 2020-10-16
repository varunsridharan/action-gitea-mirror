#!/bin/sh

set -eu


gh_username="$INPUT_gh_username"
accesstoken="$INPUT_accesstoken"
gitea_host="$INPUT_gitea_host"
gitea_username="$INPUT_gitea_username"
gitea_accesstoken="$INPUT_gitea_accesstoken"
gitea_gist_prefix="$INPUT_gitea_gist_prefix"
gitea_gist_surfix="$INPUT_gitea_gist_surfix"
gistsSource="$INPUT_gistsSource"
gistsStared="$INPUT_gistsStared"
repositoryStared="$INPUT_repositoryStared"
repositorySource="$INPUT_repositorySource"
repositoryForked="$INPUT_repositoryForked"


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
