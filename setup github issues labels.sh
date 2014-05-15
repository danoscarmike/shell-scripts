#!/bin/bash

echo -n "GitHub User: "
read USER

echo -n "GitHub Password: "
read -s PASS

echo ""
echo -n "GitHub Repo (e.g. foo/bar): "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help+wanted"

# Create labels
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Bug","color":"e74c3c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Enhancement","color":"9b59b6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Feature Request","color":"3498db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Suport","color":"95a5a6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Testing","color":"f1c40f"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
