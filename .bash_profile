if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# load bash flagment
if [ -d "${HOME}/.bash.d" ] ; then
  for f in ${HOME}/.bash.d/*.sh ; do
    [ -s "$f" ] && . "$f"
  done
  unset f
fi
