pushd $SCRIPT_DIR > /dev/null
VERSION=$(git describe --abbrev=0 --tags 2> /dev/null)
if [ -z "$VERSION" ]; then
    VERSION=$(cat $SCRIPT_DIR/.$SCRIPT_NAME-version)
fi
VERSION=${VERSION:-'unknown version: installation error'}
popd > /dev/null
