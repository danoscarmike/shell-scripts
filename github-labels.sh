#!/bin/bash

# Assumes 2FA. If user does not use 2FA comment out line 4 and uncomment lines 5 and 6.
USER=#insert personal access token
#echo -n "GitHub User: "
#read USER

# Assumes 2FA. If user does not use 2FA comment out line 9 and uncomment lines 10 and 11.
PASS=""
#echo -n "GitHub Password: "
#read -s PASS

echo ""
echo -n "GitHub Repo (e.g. GitHubUser/RepoName): "
read REPO

REPO_OWNER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/duplicate"

# Modify existing status labels
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Status: Blocked","color":"ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/blocked" 

# Create new priority labels
curl --user "$USER:$PASS" --include --request POST --data '{"name": "Priority: P2+", "color": "ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name": "Priority: P1", "color": "ffa03e"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Priority: P0","color":"db4437"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
