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
    source /usr/local/bin/virtualenvwrapper.sh
else
    # Unknown
    echo "Unknown OS type"
fi

function mkvirtualenv3() {
  mkvirtualenv --python=/usr/bin/python3 $1
}

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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
