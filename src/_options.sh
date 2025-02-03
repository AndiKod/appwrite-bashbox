

# Function to display help text
usage() {

  h1 " $(package "name")"
  hr "BashBox" "-"
  br
  h2 "Usage"
  p  "$(package "name") [option] <command> [argument]"
  br
  h2 "Options"
  echo "  -h | --help       Display the usage message"
  echo "  -v | --version    Display script Version."
  br
  h2 "Commands/Routes"
  p  "* appwrite"
  p  "* appwrite create <username>"
  p  "* appwrite read"
  p  "* appwrite update <username> <newUsername>"
  p  "* appwrite delete <username>"
  br
  p  "Repo: ${link}$(package "repo")${x}"
  br

}

# Using getopts for the portability
#+as it is a shell builtin instead of
#+an external program like "getopt".
while getopts ":hvVq-:" opt; do
  # Avoid placing an argument expencting option
  #+before the "-:" mark, like ":hvVqc:-:"
  case $opt in
  h)
    # Display the help/usage text from above
    usage
    exit 0
    ;;
  v)
    # -v short flag for version.
    printf "%s v%s\n" "$(package "name")" "$(package "version")"
    [[ -n "$(package "repo")" ]] && printf "Repo: %s\n" "$(package "repo")"
    exit 0
    ;;
  V)
    # -V flag activating vebose mode
    # [[ "$verbose" == 1 ]] && echo "Chatty stuff"
    verbose=1
    exit 0
    ;;
  q)
    # -q flag activating quiet mode
    # [[ "$quiet" != 1 ]] && echo "Reasonable stuff"
    quiet=1
    exit 0
    ;;
  -)
    # Workaround to make GetOpts
    #+mimic the --longFlags usage,
    case "${OPTARG}" in
    # --help
    help)
      usage
      exit 0
      ;;
    # --version
    version)
      printf "%s v%s\n" "$(package "name")" "$(package "version")"
      [[ -n "$(package "repo")" ]] && printf "Repo: %s\n" "$(package "repo")"
      exit 0
      ;;
    # --verbose
    verbose)
      verbose=1
      exit 0
      ;;
    # --quiet
    quiet)
      quiet=1 
      exit 0
      ;;
    *)
      # Long flags Error handling
      echo "Unknown option --${OPTARG}" >&2
      exit 1
      ;;
    esac
    ;;
  \?)
    # Short flags Error handling
    echo "Invalid option: -$OPTARG" >&2
    exit 1
    ;;
  :)
    # Missing required argument Error handling
    echo "Option -$OPTARG requires an argument." >&2
    exit 1
    ;;
  esac
done
# Removing the flags from the flow
shift $((OPTIND - 1))
