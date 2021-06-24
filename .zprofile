# Python
## To create virtualenv in the project dir (Pipenv)
# export PIPENV_VENV_IN_PROJECT=1
## Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Node
export NODE_PATH=$NODE_PATH:./
export PATH=$HOME/.nodebrew/current/bin:$PATH

# golang
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN