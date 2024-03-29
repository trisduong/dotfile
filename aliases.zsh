# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias compile="commit 'compile'"
alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Code"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run dev"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

alias vim="nvim"
alias cdw="~/Projects/Works/"
alias cdt="~/Projects/Tests/"
alias dpsa="sudo docker ps -a"
alias d="docker"
alias dcp="docker-compose"
alias status="sudo systemctl status"
alias start="sudo systemctl start"
alias enable="sudo systemctl enable"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"

cdsite() {
  cd ~/.pyenv/versions/$1/lib/python*/site-packages
}
alias cdsite=cdsite

cdwork() {
  cd ~/Projects/Works/$1/
}
alias cdw=cdwork

alias lzd="lazydocker"
alias cdconf="cd ~/.config"
alias cddot="cd ~/dotfile"
