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

# Delete labels **USE WITH CAUTION THIS _WILL_ RESULT IN DATA LOSS**
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/duplicate"

# Modify API labels
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: bigtable","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/bigtable" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: bigquery","color":"c0c0c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/bigquery" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: datastore","color":"c0c0c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/datastore" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: error-reporting","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/error-reporting"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: logging","color":"c0c0c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/logging"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: language","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/language" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: monitoring","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/monitoring"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: pubsub","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/pubsub" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: spanner","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/spanner"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: speech","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/speech" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: storage","color":"c0c0c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/storage" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: trace","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/trace"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: translation","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/translate"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"API: vision","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/vision" 


# Modify existing status and type labels
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Status: Blocked","color":"ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/blocked" 
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Status: Don\u0027t Merge","color":"ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/don%27t%20merge"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Status: Won\u0027t Fix","color":"fef2c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/wontfix"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Status: Release Blocking","color":"ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/blocking%20beta"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Type: Bug","color":"db4437"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/bug"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Type: Enhancement","color":"8bc34a"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/enhancement"
curl --user "$USER:$PASS" --include --request PATCH --data '{"name":"Type: Question","color":"8bc34a"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels/question"

# Create new status label(s)
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Status: Acknowledged","color":"fef2c0"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"

# Create new priority labels
curl --user "$USER:$PASS" --include --request POST --data '{"name": "Priority: P2+", "color": "ffee58"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name": "Priority: P1", "color": "ffa03e"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Priority: P0","color":"db4437"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"

#Create new API labels
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: error-reporting","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: language","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: monitoring","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: speech","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: trace","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"API: vision","color":"cd7f32"}' "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/labels"
