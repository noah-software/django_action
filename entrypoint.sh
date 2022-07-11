#!/bin/bash
# e is for exiting the script automatically if a command fails, u is for exiting if a variable is not set
# x would be for showing the commands before they are executed
set -eux

echo "Installing dependencies..."
pip3 install -U pip wheel pygraphviz
pip3 install -r "$INPUT_PIP_PATH"

echo "Creating data model..."
cd "$INPUT_PROJECT_PATH"
python3 manage.py graph_models -a -g -o "$INPUT_OUTPUT_PATH"

# To keep runtime good, just continue if something was changed
if [[ `git status --porcelain` ]]; then
    # Commit and push changes back
    git commit -am "$INPUT_COMMIT_MESSAGE" --author="$GITHUB_ACTOR <$GITHUB_ACTOR@users.noreply.github.com>"
    git push origin
    echo "Changes pushed successfully."
else
  echo "Nothing to commit. Exiting."
fi
