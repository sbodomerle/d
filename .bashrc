# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac

# Automatic cd into a directory if a command with that name doesnt exists. Like in zsh.
shopt -s autocd
# Correct small errors in directory names given to the `cd` buildtin
shopt -s cdspell
# Warn me about stopped jobs when exiting
shopt -s checkjobs
# Check that hashed commands still exist before running them
shopt -s checkhash
# Update LINES and COLUMNS after each command if necessary
shopt -s checkwinsize
# Put multi-line commands into one history entry
shopt -s cmdhist
# Expand variables in directory completion
shopt -s direxpand
# Correct small errors in directory names during completion
shopt -s dirspell
# Include filenames with leading dots in pattern matching
shopt -s dotglob
# Enable extended globbing: !(foo), ?(bar|baz)...
shopt -s extglob
# Allow double-star globs to match files and recursive paths
shopt -s globstar
# Append history to $HISTFILE rather than overwriting it
shopt -s histappend
# If history expansion fails, reload the command to try again
shopt -s histreedit
# Load history expansion result as the next command, don't run them directly
shopt -s histverify
# Use Bash's builtin hostname completion
shopt -s hostcomplete
# Don't change newlines to semicolons in history
shopt -s lithist
# Don't try to tell me when my mail is read
shopt -u mailwarn
# Don't complete a Tab press on an empty line with every possible command
shopt -s no_empty_cmd_completion
# Use programmable completion, if available
shopt -s progcomp
# Warn me if I try to shift nonexistent values off an array
shopt -s shift_verbose
# Don't search $PATH to find files for the `source` builtin
shopt -u sourcepath

# Load Bash-specific startup files
for sh in "$HOME"/.bashrc.d/*.bash ; do
	[[ -e $sh ]] && source "$sh"
done
unset -v sh
