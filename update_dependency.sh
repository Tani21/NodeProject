# download-hub.sh
HUB_CLI=/opt/hub-linux/bin/hub

if [[ ! -f $HUB_CLI ]]; then
   wget https://github.com/github/hub/releases/download/v2.12.2/hub-linux-amd64-2.12.2.tgz 
   tar zxvf hub-linux-amd64-2.12.2.tgz 
   rm -rf hub-linux-amd64-2.12.2.tgz /opt/hub-linux
   mv hub-linux-amd64-2.12.2 /opt/hub-linux
fi

git config --global --replace-all hub.host github.yourdomain.com
git config --global --replace-all hub.protocol git

$HUB_CLI add package.json package-lock.json
$HUB_CLI commit -m "🤖 [BOT] Automated dependency update"
$HUB_CLI pull-request \
    --push \
    -m "Pull Request Subject" \
    -m "Pull Request Description" \
    --no-edit \
    --reviewer user-id1,user-id2
