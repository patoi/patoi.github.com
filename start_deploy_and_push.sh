# deploy blog patoi.github.com

rake generate
rake deploy
git add .
git commit -a -m "blogging"
git push origin source

