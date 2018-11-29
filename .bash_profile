export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
source .prompt
source .functions
source .aliases
source .curl_templates

