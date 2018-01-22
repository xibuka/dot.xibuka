
# User specific aliases and functions
export FZF_DEFAULT_COMMAND='vim'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# export FZF_DEFAULT_COMMAND='vim ""'
# export FZF_CTRL_T_COMMAND='vim ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias htags='htags -DfsnowF'

eval `dircolors ~/.dircolors`

## ## Redhat theme
## export BASH_IT_THEME='redline'
## # Set this to false to turn off version control status checking within the prompt for all themes
## export SCM_CHECK=true
## ## Set Xterm/screen/Tmux title with only a short hostname.
## export SHORT_HOSTNAME=$(hostname -s)
## ## enable sudo prompt
## export POWERLINE_PROMPT_USER_INFO_MODE="sudo"
## ## prompt part string
## export POWERLINE_PROMPT="python_venv user_info hostname cwd scm"
## ## enable your distro logo with
## export POWERLINE_PROMPT_DISTRO_LOGO="yes"
