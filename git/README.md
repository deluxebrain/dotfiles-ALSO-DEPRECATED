# Git

## Local git settings

`~/.gitlocal` is sourced from the  main `gitconfig`. Use this to store settings you want kept outside of git. E.g. `username`.

## Git snippets

```sh
# Refresh local list of remote branches
git remote update origin --prunt
git branch --all # view all branches
```

## Basic git workflow

# Create new local branch
git checkout -b [BRANCH]

# Push new local branch to remote
git push -u origin [BRANCH]

# Delete remote branch
git push origin --delete [BRANCH]

# Delete local branch
git branch -d [BRANCH]
