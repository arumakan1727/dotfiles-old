alias ls='ls --color=auto'
alias l='ls -1X'
alias ll='ls -lhX'
alias la='ls -a'
alias ltr='ls -lhXtr'
alias lla='ls -lhXa'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ..='cd ..'
alias a='./a.out'

alias ghqcd='cd $(ghq root)/$(ghq list | fzf)'
