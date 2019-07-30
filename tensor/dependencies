source .tensor-environment
source .tensor-version
source .tensor-colorize

# usage
function usage() {
    echo "$SCRIPT_NAME [options] command < modules.list"
	echo '
options:
-h, --help                 show brief help
-v, --version              show version
-b, --branch=BRANCH        specify a branch (default: development)
-r, --remote=REMOTE        specify a remote URL with Podfile
-f, --filter=FILTER        specify filter pattern to exclude dependencies
'
}


# options selector
while [[ $# -gt 0 ]]
do
  source .tensor-opt
  case "$1" in
    -f)
      shift
      if [[ $# -gt 0 ]]; then
          ARG_FILTER=$1
      else
          echo "[ERROR] no filter specified." >&2
          exit 1
      fi
      shift
      ;;
    
    --filter*)
      ARG_FILTER=${1#*=}
      shift
      ;;

    *) 
      break;
      ;;
  esac
done

source .tensor-rc

# specify environment
### BRANCH
if [ -n "$ARG_BRANCH" ]; then
    BRANCH=$ARG_BRANCH
fi
BRANCH=${BRANCH:-development}

### REMOTE
REMOTE=${ARG_REMOTE:-$REMOTE}
GIT_REMOTE=$(git remote get-url origin)
REMOTE=${REMOTE:-$GIT_REMOTE}

### FILTER
FILTER=${ARG_FILTER:-$FILTER}
FILTER=${FILTER/\*/[a-z_-]\\+}

if [ -n "$DEBUG" ]; then
    echo "SCRIPT_DIR  ┃ $SCRIPT_DIR" 
    echo "SCRIPT_NAME ┃ $SCRIPT_NAME"
    echo "VERSION     ┃ $VERSION"
    echo "BRANCH      ┃ $BRANCH"
    echo "REMOTE      ┃ $REMOTE"
    echo "FILTER      ┃ $FILTER"
    echo '$@          ┃ '"$@"
fi >&2

if [ -z "$REMOTE" ]; then
    echo "[ERROR] no remote specified." >&2
    exit 1
fi

if [ -n "$FILTER" ]; then
    FILTER_GREPOPT='-v'
fi

git archive --remote=$REMOTE $BRANCH '*Podfile' | tar -xO | \
grep '^\s*dependency.*\.\./\.\./' | sed "s/.*\.\.\/\.\.\///; s/'.*//" | sort -u | \
grep $FILTER_GREPOPT "$FILTER"
