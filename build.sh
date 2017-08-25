#!/bin/bash
_gitea_version=$1
_gitea_tag=$2
_release_build=false

if [ -z "${_gitea_version}" ]; then
	source GITEA_VERSION
	_gitea_version=$GITEA_VERSION
	_gitea_tag=$GITEA_VERSION
	_release_build=true
fi

echo "GITEA_VERSION: ${_gitea_version}"
echo "DOCKER TAG: ${_gitea_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg GITEA_VERSION=${_gitea_version} --tag "stakater/gitea:${_gitea_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg GITEA_VERSION=${_gitea_version} --tag "stakater/gitea:latest"  --no-cache=true .
fi