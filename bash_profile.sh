# ========= PERSONAL ========
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ========= FUNCTIONS =========
show_bash_profile() {
  cat ~/.bash_profile
}

add_sshkey() {
  ssh-add ~/.ssh/id_rsa &>/dev/null
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

masterblaster() {
  echo “~*~*~*~*~*~*~GIT MASTER PULL~*~*~*~*~*~*~”
  git fetch &&
  git status &&
  git checkout master && 
  git pull &&
  git status
}

# ========= EXPORTS =========
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# ========= ALIASES =========
# blow away whatever you have last committed on your branch
alias hammertime='git reset --hard HEAD~'
alias sandbox='cd /Users/wmock/sandbox'
alias docker_login='sudo docker exec -it \`sudo docker ps -q | head -1\` bash'