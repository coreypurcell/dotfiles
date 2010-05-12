. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc


source /Users/cpurcell/.profile


if [[ -s /Users/cpurcell/.rvm/scripts/rvm ]] ; then source /Users/cpurcell/.rvm/scripts/rvm ; fi
