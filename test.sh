CLONE_DIR=.
GITHUB_ENV="github_env$(date +%s)"
if [[ -f "$CLONE_DIR/action.yml" ]]; then
    echo "::set-output name=using::$(cat "$CLONE_DIR/action.yml" | grep -o 'using:.*' | cut -d ':' -f 2 | tr -d ' ')"
elif [[ -f "$CLONE_DIR/action.yaml" ]]; then
    echo "DOCKER_IMAGE=$(cat $CLONE_DIR/action.yaml | grep -o 'using:.*' | cut -d ':' -f 2 | tr -d ' ')" >> $GITHUB_ENV
fi
cat $GITHUB_ENV