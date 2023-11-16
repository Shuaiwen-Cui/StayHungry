echo '--------upload files start--------'
# enter the target folder
# cd ./

# 如果你是要部署到自定义域名
# echo 'www.example.com' > CNAME

# git init
git add .
git status
git commit -m 'auto update stay hungry stay foolish'
echo '--------commit successfully--------'

# git push -f https://github.com/Shuaiwen-Cui/StayHungry.git master
git push -u https://github.com/Shuaiwen-Cui/StayHungry.git master
# git remote add origin https://github.com/Shuaiwen-Cui/StayHungry.git
# git push -u origin master
echo '--------push to GitHub successfully--------'

# git push -f <url> master
# git push -u <url> master
# git remote add origin <url>
# git push -u origin master
# echo '--------push to Gitee successfully--------'

# if to deploy to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages
# done