-> [English](/DEVENV/GIT-GITHUB/git-github.md)

# GIT 与 GITHUB

> 常用命令

- 从远端拉取分支到本地
  ```bash
  git pull origin <remote_branch>:<local_branch>
  ```
  或者简单一点
  ```bash
    git pull origin <remote_branch>
  ```
  如果已经在本地分支上了，那么更简单
  ```bash
    git pull
  ```
- 强制从远端拉取分支到本地
  ```bash
    git fetch --all
    git reset --hard origin/<remote_branch>
  ```
  然后
  ```bash
    git pull
    ```
- 推送本地分支到远端
  ```bash
    git push origin <local_branch>:<remote_branch>
  ```
- 强制推送本地分支到远端
  ```bash
    git push -f origin <local_branch>:<remote_branch>
  ```