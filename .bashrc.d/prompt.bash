# pre-prompt command
PROMPT_COMMAND='history -a'
# trim very long paths in prompt
PROMPT_DIRTRIM=4
PS1=
if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION ]]; then
	PS1=$PS1'\u@\h:'
fi
PS1=$PS1'\w$ '
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
PS1='$(__git_ps1 "(%s) ")'$PS1
