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

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help+wanted"

# Create new labels
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Bug","color":"e74c3c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Enhancement","color":"9b59b6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Feature Request","color":"3498db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Suport","color":"95a5a6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Testing","color":"f1c40f"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

# Modify existing labels 
curl --user "$USER:$PASS" --request PATCH -d '{"name":"type:Bug","color":"674ea7"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/type:Bug" 
