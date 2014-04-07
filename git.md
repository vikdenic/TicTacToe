##Git Commands Cheatsheet

Creating a new repository. This only needs to be done once per repo (each time you create a new project)

- `git init`  initializes a git repository

Adding changes to your git repo

- `git add <filename>` adds a file or changes in a file to a repository
- `git add .` adds everything in current directory (files and changes) to a repository
- `git commit -m <meassage>` saves changes you've made to the repository

Pushing/Retrieving code to/from Github

- `git remote add origin <url>` connects repo to a remote url (usually github), only needs to be done once per repo

- `git push origin master` pushes changes to a remote git repo (github)
- `git pull origin master` pulls changes from a remote git repo (github)

- `git clone <url>` copy's a repo from github
- `git pull <branch> <remote>` pulls changes from remote (usually github)

Reverting Changes

- `git reset <Log Number>` resets git repo to specific commit 
- `git reset --hard <Log Number>` reset git repo, and sublime to specific commit

Helpful Commands

- `git help` lists possible git commands
- `git status` shows changes that have not been committed
- `git log` shows commit history

###Resources

Official Documentation: http://git-scm.com/doc
Try Git Tutorial: http://try.github.io/levels/1/challenges/1
Git Hug game: https://github.com/Gazler/githug
Other Resources: http://training.github.com/resources
