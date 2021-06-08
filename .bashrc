# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="/opt/scr/hisat2-2.2.1-Linux_x86_64/hisat2-2.2.1:$PATH"

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1="[\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\]] \\$ "

# Add beast to PATH
PATH=$PATH:$HOME/bin/BEASTv1.10.4/bin
LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH

