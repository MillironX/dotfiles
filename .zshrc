# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the antigen library
if [[ ! -f "$HOME/antigen.zsh" ]]; then
  curl -L git.io/antigen > $HOME/antigen.zsh
fi
source "$HOME/antigen.zsh"

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Default bundles
antigen bundle git
antigen bundle gitignore
antigen bundle colored-man-pages
antigen bundle cp
antigen bundle screen
antigen bundle npm
antigen bundle bundler
antigen bundle extract

# Custom bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle millironx/cowsay-cows

DEFAULT_USER="$USER"

# Theming: the logic is: if I'm on Fedora, I'm on my on machine, and have all my fancy tools,
# If not, I'm on a server and may or may not have Powerline fonts, so I need to pick
source /etc/os-release
if [[ "$ID" == "fedora" ]]; then
  antigen theme romkatv/powerlevel10k
else
  if [[ -f "$HOME/.powerline" ]]; then
    # Powerline config flag set
    antigen theme https://gist.github.com/e95df0a0aa6d1721e85b905399971515.git believer
  else
    # Powerline config flag not set
    antigen theme https://gist.github.com/efde5e8d507bd3e1e046198b69d579f8.git gianu-improved
  fi
fi

# oh-my-zsh configuration settings
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> rbenv initialize >>>
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# <<< rbenv initialize <<<

# >>> n initalize >>>
export N_PREFIX=$HOME/.n
export PATH="$HOME/.n/bin:$PATH"
# <<< n initialize <<<

# >>> direnv initalize >>>
eval "$(direnv hook zsh)"
# <<< direnv initalize <<<

# Tell Antigen that you're done
antigen apply

# User configuration
# Setup bash completion support
autoload -U bashcompinit
bashcompinit

# Add pipx packages to PATH
export PATH="$PATH:$HOME/.local/bin"
# Enable pipx completions
if [[ $(command -v pipx) ]]; then
  eval "$(register-python-argcomplete pipx)"
fi

# Preferred editor for local and remote sessions
if [[ $(command -v nano) ]]; then
  export EDITOR=nano
fi

# Set a cool new pager with color support
if [[ $(command -v most) ]]; then
  export PAGER=most
fi

# Fix screen wrapping if on a local terminal
# (Will cause problems if set twice, i.e. in
# both local and remote sessions)
if [ ! -n "$SSH_CONNECTION" ]; then
  ZLE_RPROMPT_INDENT=0
fi

# Personal aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias zshrefresh="source ~/.zshrc"

# Replace cat with bat
if [[ $(command -v bat) ]]; then
  alias cat="bat"
  export BAT_PAGER="less -RF"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Replace ls with lsd
if [[ $(command -v lsd) ]]; then
  alias ls="lsd"
fi

# Replace VSCode with pure FOSS alternative
if [[ $(command -v codium) ]] && [[ ! $(command -v code) ]]; then
  alias code="codium"
fi

# Make forgetting sudo less painful
alias please='sudo $(fc -ln -1)'

# Make running programs on the GPU less painful
alias nrun='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus="NVIDIA_only"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
