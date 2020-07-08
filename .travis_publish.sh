#!/bin/bash

set -ue

PUBLICATION_BRANCH=gh-pages
REPO_PATH=$PWD

ls -ltr
ls -ltr repo
pwd

pushd $HOME
git clone --branch=$PUBLICATION_BRANCH    https://${GITHUB_TOKEN}@github.com/$TRAVIS_REPO_SLUG publish 2>&1 > /dev/null
cd publish

ls -ltr $REPO_PATH/repo/

cp -r $REPO_PATH/repo/* .

git add -A
git config user.name  "Travis"
git config user.email "travis@travis-ci.org"
git commit -m "Updated repo."
git push -q origin $PUBLICATION_BRANCH 2>&1 > /dev/null
popd