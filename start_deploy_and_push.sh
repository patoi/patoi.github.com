# deploy blog patoi.github.com

rake generate
rake deploy
git add .
git commit -a -m "blogging"
git push origin source

# push to developerof.com site
wput --basename _deploy/ ./_deploy/* ftp://patoi@developerof.com:tajkep1972@developerof.com

