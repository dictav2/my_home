#config:utf-8
set -x BROWSER open
set -x EDITOR /Applications/MacVim.app/Contents/MacOS/Vim
set -x PATH ~/bin /usr/local/bin /Applications/MacVim.app/Contents/MacOS $PATH
set -x GEM_HOME /usr/local/lib/ruby/gems/2.0.0
set -x PATH $PATH /usr/local/lib/ruby/gems/2.0.0/bin

# key bindings
function fish_user_key_bindings
   . ~/.config/fish/functions/vi-mode.fish
   vi_mode_insert
end

# jekyll alias
function jekyll
   set -lx BUNDLE_GEMFILE ~/.jekyll/Gemfile
   bundle exec jekyll $argv
end

# rails aliases
function r_new
   set -lx BUNDLE_GEMFILE ~/.rails/Gemfile
   bundle exec rails new $argv
end

function randle
   set -lx GEM_HOME ~/.rails/ruby/2.0.0
   bundle $argv
end

alias raxec "randle exec"
alias bails "raxec rails"
alias bake "raxec rake"
alias buard "raxec guard"
alias bspec "raxec rspec"

# vim aliases
alias vi "Vim"
alias vim "mvim"
alias diff "mvimdiff"

# pod command
function pod
   set -lx BUNDLE_GEMFILE ~/.cocoapods/Gemfile
   bundle exec pod $argv
end

function pod-update
   set -lx BUNDLE_GEMFILE ~/.cocoapods/Gemfile
   bundle update
end
