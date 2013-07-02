function parse_git_dirty 
   git diff —quiet HEAD ^&-
   if test $status = 1
      echo (set_color red)”Δ”(set_color normal)
   end
end

function parse_git_branch
   # git branch outputs lines, the current branch is prefixed with a *
   set -l branch (git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/") 
   if test $branch
      set -l path (git rev-parse --show-toplevel)
      echo $path $branch (parse_git_dirty)     
   end
end

function fish_prompt
   echo 
   set_color white
   echo [(hostname):(pwd)]
   set_color yellow
   echo (parse_git_branch)
   set_color white
   echo -n (whoami)'$ '
   set_color normal
end

