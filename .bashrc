# hawkey
alias l="ls -lrth"
alias la="ls -lrtha"
alias le="less -S"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias rmr="rm -r"
alias cpr="cp -r"

alias nvi="nvidia-smi"
alias W="cd /home/hawkey/Workspace"

# tmux
#alias t="tmux"
alias tl="tmux ls -F '[#{session_last_attached_string}] #S'"
alias taa="tmux a"
alias ta="tmux a -t"
alias tk="tmux kill-session"
alias tn="tmux new -s"

# highlight prompt line
export PS1='\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '

# fix 777 color
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# bin
export PATH="$PATH:~/bin"
