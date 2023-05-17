### stolho settings #########################################################

# Set locale to en_US.UTF-8 
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtualenv shell startup configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/work

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    source ~/.local/bin/virtualenvwrapper.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
    source /opt/homebrew/bin/virtualenvwrapper.sh
else
    # Unknown
    echo "Unknown OS type"
fi

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/work/golang
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
