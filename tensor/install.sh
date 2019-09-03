SCRIPT_PATH=${1:-'$HOME/.scripts'}
SCRIPT_PATH_EVAL=$(eval echo $SCRIPT_PATH)
[ -d "$SCRIPT_PATH_EVAL" ] || mkdir $SCRIPT_PATH_EVAL || exit 1

remote=git@git.sbis.ru:sa.pletnev/scripts.git
version=$(git ls-remote --tags $remote | sed 's|.*/||g' | sort | tail -1)

tmp=$(mktemp)

echo -n "downloading list of files to install ..."
git archive --remote="$remote" $version .install-files | tar -xO > $tmp
echo " done"

while read file
do
    echo -n "downloading '${file}' ..."
    git archive --remote="$remote" $version $file | tar -x -C "$SCRIPT_PATH_EVAL"
    echo " done"
done < $tmp

echo -n "configuration ..."
echo $version > $SCRIPT_PATH/.foreach-version
echo $version > $SCRIPT_PATH/.dependencies-version

SCRIPT_PATH_PTRN=$SCRIPT_PATH

if $(echo ${SCRIPT_PATH} | grep -q '^\(~/\|$HOME/\|'"$HOME"'/\)\([a-zA-Z._-]\+/\?\)\+$'); then
    SCRIPT_PATH_TRIM=${SCRIPT_PATH##\$HOME}
    SCRIPT_PATH_TRIM=${SCRIPT_PATH_TRIM##$HOME}
    SCRIPT_PATH_TRIM=${SCRIPT_PATH_TRIM##\~}
    SCRIPT_PATH_PTRN='\(~/\|$HOME\|'"$HOME"'\)'"$SCRIPT_PATH_TRIM"
    SCRIPT_PATH='$HOME'"$SCRIPT_PATH_TRIM"
fi

{

echo
echo '# tensor'
if ! $(grep -q 'export PATH=\("\|'"'"'\)\?\($PATH:\)\?\(\(~/\|$HOME/\)\([a-zA-Z._-]\+/\?\):\)*'"${SCRIPT_PATH_PTRN}"'\(\(:\(~/\|\$HOME/\)\([a-zA-Z._-]\+/\?\)\)+\|\("\|'"'"'\)\|;\|\s*$\)' $HOME/.bash_profile); then
    echo  'export PATH="$PATH:'"$SCRIPT_PATH"'"'
fi
echo 'source .tensor-alias'
echo

} >> $HOME/.bash_profile

echo " done"

echo cleanup
rm $tmp

exit 0
