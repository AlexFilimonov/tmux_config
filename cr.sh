#!/usr/bin/env bash

echo "Get default branch..."
DEFBRANCH=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

if [[ $(git branch --show-current) != $DEFBRANCH ]];then
  echo "Switching to default branch..."
  git switch "$DEFBRANCH"
  if [[ $? -ne 0 ]];then
    echo "ERROR: Couldn't switch to DEFAULT branch $DEFBRANCH"
    exit 1
  fi
fi

echo "Clean up branches..."
for branch in $(git branch | grep -v "$DEFBRANCH");do
  [[ $(git ls-remote --exit-code origin $branch) ]] || git branch -D $branch
done

echo "Prune remote repositories..."
git remote prune origin

echo "Pull default branch..."
git pull
