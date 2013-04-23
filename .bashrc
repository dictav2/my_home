export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/Cellar/ruby/2.0.0-p0/bin:$PATH
export HOMEBREW_CC="clang"

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

function pbcp64() {
   base64 $1 | pbcopy
}
alias ls='ls -Fv'
alias la='ls -a'
alias ll='la -l'
alias vt='vim --remote-tab-silent'
alias displaytype='ioreg -lw0 | grep IODisplayEDID | sed "/[^<]*</s///" | xxd-r | strings -6'
alias diff='vim -d'
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"
alias pod="BUNDLE_GEMFILE=~/.cocoapods/Gemfile bundle exec pod"
alias pngcrush="/Applications/Xcode.app/Contents//Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush"

#rails command
alias r_new="BUNDLE_GEMFILE=~/.rails/Gemfile bundle exec rails new"
alias randle="GEM_HOME=~/.rails/ruby/2.0.0 bundle"
alias raxec="randle exec"
alias bails="raxec rails"
alias bake="raxec rake"
alias buard="raxec guard"
alias bspec="raxec rspec"


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

