#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "main" ] && exit 0

git config --global user.email "henrikmidtiby@gmail.com"
git config --global user.name "Henrik Skov Midtiby"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/henrikmidtiby/bookdown-testing.git book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
