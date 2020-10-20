#!/bin/sh
# e is for exiting the script automatically if a command fails, u is for exiting if a variable is not set
# x would be for showing the commands before they are executed
set -eux

# FUNCTIONS
# Function for setting up git env in the docker container (copied from https://github.com/stefanzweifel/git-auto-commit-action/blob/master/entrypoint.sh)
_git_setup ( ) {
    cat <<- EOF > $HOME/.netrc
      machine github.com
      login $GITHUB_ACTOR
      password $GITHUB_TOKEN
      machine api.github.com
      login $GITHUB_ACTOR
      password $GITHUB_TOKEN
EOF
    chmod 600 $HOME/.netrc

    git config --global user.email "actions@github.com"
    git config --global user.name "GitHub Action"
}

# Checks if any files are changed
_git_changed() {
    [[ -n "$(git status -s)" ]]
}

python --version

# PROGRAM
echo "Installing dependencies..."
pip install --no-cache-dir -r $INPUT_PIP_PATH
echo "Creating data model..."
cd $INPUT_PROJECT_PATH
python manage.py graph_models -a -g -o $INPUT_OUTPUT_PATH

# To keep runtime good, just continue if something was changed
if _git_changed;
then
    # Calling method to configure the git environemnt
    _git_setup
    # Commit and push changes back
    git commit -a -m "$INPUT_COMMIT_MESSAGE" --author="$GITHUB_ACTOR <$GITHUB_ACTOR@users.noreply.github.com>"
    git push origin
    echo "Changes pushed successfully."
else
  echo "Nothing to commit. Exiting."
fi
