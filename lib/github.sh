#!/usr/bin/env bash

# Prints the tag name of the latest release.
# @param $1 owner name (e.g. octocat)
# @param $2 repo name (e.g. hello-world)
get_latest_release() {
  local owner="${1}"
  local repo="${2}"
  curl \
    --silent \
    --show-error \
    --fail \
    --retry 3 \
    --retry-max-time 15 \
    --location \
    --header "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/${owner}/${repo}/releases/latest \
    | jq -r '.tag_name'
}
