prepend_git_clone() {
  local repo="https://ghproxy.com/"

 if [[ $LBUFFER =~ https://github\.com ]]; then
    LBUFFER="${LBUFFER/https:\/\/github.com/${repo}https://github.com}"
  else
    LBUFFER="git clone ${repo}${LBUFFER}"
  fi

  zle redisplay
}
prepend_wget_clone() {
  local repo="https://ghproxy.com/"
  if [[ $LBUFFER =~ https://github\.com ]]; then
    LBUFFER="${LBUFFER/https:\/\/github.com/${repo}https://github.com}"
  else
    LBUFFER="wget ${repo}${LBUFFER}"
  fi
  zle redisplay
}

zle -N prepend_git_clone
zle -N prepend_wget_clone
bindkey -M emacs '^l' prepend_wget_clone
bindkey -M emacs '^g' prepend_git_clone
bindkey -M vicmd '^g' prepend_git_clone
bindkey -M vicmd '^l' prepend_wget_clone
bindkey -M viins '^g' prepend_git_clone
bindkey -M viins '^l' prepend_wget_clone
