# vim: ft=sh
autoload colors
[[ $terminfo[colors] -ge 8 ]] && colors
pR="%{$reset_color%}%u%b" pB="%B" pU="%U"
for i in red green blue yellow magenta cyan white black; {eval pfg_$i="%{$fg[$i]%}" pbg_$i="%{$bg[$i]%}"}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='[%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}]'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local job="%(1j.$pB$pfg_red%j.)$pR"

#PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
PROMPT="┏━%(2L.⊂.)${user_host} ${current_dir}
┗${job}$pB$pfg_blue▶$pR"
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
