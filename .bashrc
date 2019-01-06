[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}$(parse_git_branch) \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}$(parse_git_branch) \w\$ '
fi

unset color_prompt force_color_prompt

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ba aliases
alias pgr='dropdb blueapron_development; bundle exec rake db:create; pg_restore -vcOx -h localhost -d blueapron_development'
alias besr='bundle exec spring rspec'
alias ocd='OVERCOMMIT_DISABLED=1'

alias staging='ba exec -e staging -a blueapron.com'
alias prod='ssh -A bastion.production.b--a.co'
ssh-add

alias ctags="`brew --prefix`/bin/ctags"
alias generate_rails_ctags='ctags -R --exclude=.git --exclude=log *'

alias rubocop_changed='git status --porcelain | cut -c4- | grep '.rb' | xargs rubocop'

alias wordpress='cd /Applications/MAMP/htdocs/blog'
alias bloglogin='ssh 192.163.200.34'
#alias vim='mvim -v'

source ~/.git-completion.bash

eval "$(nodenv init -)"

export GITHUB_API_TOKEN=94175b7ab94522f63aa2598340e32e269b528b2b
export HOMEBREW_GITHUB_API_TOKEN=2fb3a1a7dd7cb0fd88bf502111a0923da81ca29d

export PATH="$PATH:/usr/local/heroku/bin"
PATH=$PATH:$HOME/.tmux/scripts
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH:/usr/local/opt/go/libexec/bin
