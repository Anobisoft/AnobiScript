case "$1" in
  -h|--help)
    usage
    exit 0
    ;;

  -b)
    shift
    if [[ $# -eq 0 ]]; then
        echo "$(ansicol red)[ERROR] no branch specified.$(ansicol)" >&2
        exit 1
    fi
    ARG_BRANCH=$1
    shift
    ;;

  --branch*)
    ARG_BRANCH=${1#*=}
    shift
    ;;

  -r)
    shift
    if [[ $# -eq 0 ]]; then
        echo "$(ansicol red)[ERROR] no remote specified.$(ansicol)" >&2
        exit 1
    fi
    ARG_REMOTE=$1
    shift
    ;;

  --remote*)
    ARG_REMOTE=${1#*=}
    shift
    ;;

  -v|--version)
    shift
    echo $SCRIPT_NAME $VERSION
    exit 0
    ;;

  --debug)
    DEBUG=1
    shift
    ;;

esac
