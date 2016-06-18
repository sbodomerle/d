# Load Bash-specific startup files
for sh in "$HOME"/.bashrc.d/*.bash ; do
	[[ -e $sh ]] && source "$sh"
done
unset -v sh
