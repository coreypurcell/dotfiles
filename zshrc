. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# RVM
[[ -s "/Users/cpurcell/.rvm/scripts/rvm" ]] && source "/Users/cpurcell/.rvm/scripts/rvm"  # This loads RVM into a shell session.


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
