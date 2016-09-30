#!/bin/bash

ORIGIN_URL=`git config --get remote.origin.url`
node ./node_modules/.bin/build-storybook -o .out
cd .out
git init
git config user.name "GH Pages Bot"
git config user.email "yongdamsh@gmail.com"
git add .
git commit -m "Deploy Storybook to GitHub Pages"
git push --force --quiet "$ORIGIN_URL" master:gh-pages
cd ..
rm -rf .out

echo "Deployed successfully"
exit 0
