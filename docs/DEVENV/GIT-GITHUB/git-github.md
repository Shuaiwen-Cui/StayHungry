-> [中文](/DEVENV/GIT-GITHUB/git-github-cn.md)

# GIT & GITHUB

> Commonly used commands for Git and GitHub.

- pull remote branch to local
  ```bash
  git pull origin <remote_branch>:<local_branch>
  ```
  or simply
  ```bash
    git pull origin <remote_branch>
  ```
  or simply (if you are already on the local branch that you want to pull to.)
  ```bash
    git pull
  ```
- force pull remote branch to local
  ```bash
    git fetch --all
    git reset --hard origin/<remote_branch>
  ```
  then
  ```bash
    git pull
```
- push local branch to remote
  ```bash
    git push origin <local_branch>:<remote_branch>
  ```
- force push local branch to remote
  ```bash
    git push -f origin <local_branch>:<remote_branch>
  ```

    

