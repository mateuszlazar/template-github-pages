#!/bin/bash
set -e # stop on error

echo bulid client ...

BUILD_BRANCH='main'
DEPLOY_BRANCH_BRANCH='gh-pages'
DIR=$(dirname "$(readlink -f "$0")")

# echo "$DIR"
# cd "$DIR"
# mkdir -p "$DIR"/build
# cp -r "$DIR"/dist/* "$DIR"/build/

git fetch -f . $BUILD_BRANCH:$DEPLOY_BRANCH
git checkout $DEPLOY_BRANCH
git add -f dist
git commit -m "deploy to $DEPLOY_BRANCH"
git push origin `git subtree split --prefix dist`:$DEPLOY_BRANCH --force
git checkout $BUILD_BRANCH

echo All done!