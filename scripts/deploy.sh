#!/bin/bash
set -e # stop on error

echo -e '\n Deployment in progress... \n'

BUILD_BRANCH='main'
DEPLOY_BRANCH='gh-pages'
DIR=$(dirname "$(readlink -f "$0")")

git fetch -f . $BUILD_BRANCH:$DEPLOY_BRANCH
git checkout $DEPLOY_BRANCH || git checkout $BUILD_BRANCH
git add -f dist || git checkout $BUILD_BRANCH
git commit -m "deploy to $DEPLOY_BRANCH" || git checkout $BUILD_BRANCH
git push origin `git subtree split --prefix dist`:$DEPLOY_BRANCH --force
git checkout $BUILD_BRANCH

echo -e '\n \U0002705 Deployment has been finished. \n'