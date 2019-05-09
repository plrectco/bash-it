cite about-plugin
about-plugin 'load pyenv, if you are using it'

export PYENV_ROOT="$HOME/.pyenv"
pathmunge "$PYENV_ROOT/bin"

<<<<<<< HEAD
[[ `which pyenv 2>/dev/null` ]] && eval "$(pyenv init - bash)"
=======
[[ `which pyenv` ]] && eval "$(pyenv init - bash)"
>>>>>>> update custom

#Load pyenv virtualenv if the virtualenv plugin is installed.
if pyenv virtualenv-init - &> /dev/null; then
  eval "$(pyenv virtualenv-init - bash)"
fi
