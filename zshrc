. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc


source /Users/cpurcell/.profile

[[ -s "/Users/cpurcell/.rvm/scripts/rvm" ]] && source "/Users/cpurcell/.rvm/scripts/rvm"  # This loads RVM into a shell session.
