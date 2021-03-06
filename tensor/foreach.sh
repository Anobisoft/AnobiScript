source .tensor-environment
source .tensor-version
source .tensor-colorize

# default prompt
PROMPT=${PROMPT:-'-- $(ansicol white)for $(ansicol CYAN)$MODULE$(ansicol):'}

# usage
function usage() {
    echo "$SCRIPT_NAME [options] command < modules.list"
    echo '
options:
-h, --help               show brief help
-v, --version            show version
-d, --workdir=WORKDIR    specify a workdir, $PWD as default
-b, --branch=BRANCH      specify a branch
-r, --remote=REMOTE      specify a remote, variable is required
-p, --prompt=PROMPT      specify prompt, default: '-- for $MODULE:'

available vaiables:
- sessional:
BRANCH
REMOTE
PROMPT
WORKDIR
VERSION
- for module iteration:
MODULE            - name (from input)
MODULE_REMOTE     - expected remote URL 
MODULE_ORIGIN     - git origin URL
CURRENT_BRANCH    - git current branch
'
}

# options selector
while [[ $# -gt 0 ]]
do
  source .tensor-opt
  case "$1" in
    -d)
      shift
      if [[ $# -gt 0 ]]; then
          ARG_WORKDIR=$1
      else
          echo "$(ansicol red)[ERROR] no workdir specified.$(ansicol)" >&2
          exit 1
      fi
      shift
      ;;

    --workdir*)
      ARG_WORKDIR=${1#*=}
      shift
      ;;

    -p)
      shift
      if [[ $# -gt 0 ]]; then
          ARG_PROMPT=$1
      else
          echo "$(ansicol red)[ERROR] no prompt specified.$(ansicol)" >&2
          exit 1
      fi
      shift
      ;;

    --prompt*)
      ARG_PROMPT=${1#*=}
      shift
      ;;

    *) 
      break;
      ;;
  esac
done

source .tensor-rc
if [ -n "$DEBUG" ]; then echo; fi >&2


# specify environment
### WORKDIR
if [ -n "$ARG_WORKDIR" ]; then
    WORKDIR=$(eval echo $ARG_WORKDIR)
fi
if [ -n "$WORKDIR" ]; then
    if [ ! -d "$WORKDIR" ]; then
        echo "$(ansicol red)[ERROR]$(ansicol) workdir '$(ansicol BLUE)$WORKDIR$(ansicol)' not found." >&2
        exit 1
    fi    
    echo "WORKDIR: '$WORKDIR'"
else
    echo "WORKDIR: '$PWD'"
fi

### BRANCH
if [ -n "$ARG_BRANCH" ]; then
    BRANCH=$(eval echo $ARG_BRANCH)
fi

### REMOTE
REMOTE=${ARG_REMOTE:-$REMOTE}

### PROMPT
PROMPT=${ARG_PROMPT:-$PROMPT}

if [ -n "$DEBUG" ]; then
    echo "SCRIPT_DIR  ┃ $SCRIPT_DIR" 
    echo "SCRIPT_NAME ┃ $SCRIPT_NAME"
    echo "VERSION     ┃ $VERSION"
    echo "BRANCH      ┃ $BRANCH"
    echo "REMOTE      ┃ $REMOTE"
    MODULE=foreach-debug-module-name
    eval echo $PROMPT
    echo $@
    echo
fi

if [[ -n "$WORKDIR" && "$WORKDIR" != "$PWD" ]]; then
    WORKDIR_PUSHD=1
    pushd $WORKDIR > /dev/null || exit 1
fi

if [ -z "$REMOTE" ]; then
    echo "$(ansicol red)[ERROR] no remote specified.$(ansicol)" >&2
    exit 1
fi

# main

while read MODULE
do
    eval echo $PROMPT

    MODULE_REMOTE=$REMOTE/${MODULE}.git
 
    if [ ! -d "$MODULE" ]; then
        ARG_BRANCH="-b ${BRANCH:-development}"
        eval git clone $ARG_BRANCH $MODULE_REMOTE || continue
    fi
 
    pushd $MODULE > /dev/null || continue
    MODULE_ORIGIN=$(git remote get-url origin)
    if [ "$MODULE_ORIGIN" != "$MODULE_REMOTE" ]; then
        echo "$(ansicol yellow)[WARNING] $(ansicol white)origin$(ansicol)($(ansicol blue)$MODULE_ORIGIN$(ansicol)) != $(ansicol blue)$MODULE_REMOTE$(ansicol)"
    fi
    
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ -n "$DEBUG" ]; then echo "CURRENT_BRANCH=$CURRENT_BRANCH"; fi

    if [[ -n "$BRANCH" && "$BRANCH" != "$CURRENT_BRANCH" ]]; then
        if [[ -n $(git ls-remote --heads origin $BRANCH) || -n $(git branch --list $BRANCH) ]]; then
            git fetch
            hlstderr git checkout $BRANCH || {
                popd > /dev/null
                echo
                continue
            }
        else
            echo "$(ansicol red)[ERROR] $(ansicol)Remote branch $(ansicol yellow)$BRANCH$(ansicol) not found in upstream $(ansicol blue)$MODULE_REMOTE$(ansicol)"
            popd > /dev/null
            echo
            continue
        fi
    fi

    if [[ $# -gt 0 ]]; then
        hlstderr "$@"
    else
        echo --
    fi

    popd > /dev/null
    echo
done

if [ $WORKDIR_PUSHD ]; then
    popd > /dev/null
fi

exit 0
