
### Basics

# Do not beep on errors
setopt no_beep

# allow comments in interactive shells
setopt interactive_comments



### History
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history



### Directories

# do not push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups



### Expansion and Globbing

# treat #, ~, and ^ as part of patterns for file name generation
setopt extended_glob



### History

# allow multiple terminal sessions but append to a unified history
# setopt append_history

# save timestamp and duration to history
setopt extended_history

# save commands as they are typed, don't wait for shell exit
# setopt inc_append_history

# Delete oldest dupes first
setopt hist_expire_dups_first

# Do not add dupes to history
# setopt hist_ignore_dups

# Ignore commands that begin with a space
setopt hist_ignore_space

# Do not show dupes twice in history search
setopt hist_find_no_dups

# Remove extra blanks from commands being added to history
setopt hist_reduce_blanks

# Dont execute just expand history
setopt hist_verify

# imports new commands and appends typed commands to history
setopt share_history



### Completion

# When completing from the middle of the word, move cursor to end of word
setopt always_to_end

# Show cmopletion menu on multiple tab presses
setopt auto_menu

# any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory
# setopt auto_name_dirs

# Allow completion from within a word/phrase
setopt complete_in_word

# Do not autoselect the first completion entry
unsetopt menu_complete



### Correction

# Enable spelling correction for commands
setopt correct

# Enable spelling correciton for arguments
setopt correctall



### Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion
setopt prompt_subst

# Only show rprompt on current prompt
setopt transient_rprompt



### Scripts and Functions

# Perform implicit tees or cats when multiple redirections are attempted
setopt multios

