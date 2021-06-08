# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Make the prompt pretty, just in case we're stuck in bash land
export PS1="[\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\]] \\$ "
