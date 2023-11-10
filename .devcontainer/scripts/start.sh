#!/bin/bash

GH_OWNER=$GH_OWNER
GH_REPOSITORY=$GH_REPOSITORY
GH_TOKEN=$GH_TOKEN

HOSTNAME=$(hostname)
RUNNER_SUFFIX="runner"
RUNNER_NAME="${HOSTNAME}-${RUNNER_SUFFIX}"
USER_NAME_LABEL=$( (git config --get user.name) | sed -e 's/ //g')
REPO_NAME_LABEL="$GH_REPOSITORY"

echo "Getting registration github token..."
echo "GH_OWNER: $GH_OWNER"
echo "GH_REPOSITORY: $GH_REPOSITORY"
REG_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_TOKEN}" https://api.github.com/repos/${GH_OWNER}/${GH_REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)

echo "Configuring runner..."
/home/vscode/actions-runner/config.sh --unattended --url https://github.com/${GH_OWNER}/${GH_REPOSITORY} --token ${REG_TOKEN} --name ${RUNNER_NAME}  --labels ${USER_NAME_LABEL},${REPO_NAME_LABEL}

echo "Starting runner..."
/home/vscode/actions-runner/run.sh &

# Capture the process ID of the last background command
PID=$!

# Wait for the background process to finish
wait $PID