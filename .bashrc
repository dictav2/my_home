export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Mac の設定
if [ `uname` = "Darwin" ]; then
	path=/Applications/MacVim.app/Contents/MacOS 
	if [ -d $path ]; then
		export PATH=$path:$PATH
	fi
	alias vi='Vim'
	alias vim='mvim'
	alias jenkins='java -jar /usr/local/Cellar/jenkins/1.477/libexec/jenkins.war '
fi

alias ls='ls -Fv'
alias la='ls -a'
alias ll='la -l'
alias vt='vim --remote-tab-silent'
alias displaytype='ioreg -lw0 | grep IODisplayEDID | sed "/[^<]*</s///" | xxd-r | strings -6'
alias diff='vim -d0'

export EDITOR=vim
export PAGER=vimpager

# Git をプロンプトに表示する
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  return [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

branch=$(parse_git_branch)

export PS1='\[\033[1;37m\][\u@\h:\w] - $(parse_git_branch)\n\t \$\[\033[0m\] '
