#!/bin/bash

set -ue

git clone --branch=gh-pages    https://${GITHUB_TOKEN}@github.com/$TRAVIS_REPO_SLUG gh-pages

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm package hello-world/ -d gh-pages
helm package tinyproxy/ -d gh-pages
helm package v2ray/ -d gh-pages
helm repo index gh-pages


cd gh-pages

git add -A
git config user.name  "Travis"
git config user.email "travis@travis-ci.org"
git commit -m "Updated repo."
git push origin gh-pages
