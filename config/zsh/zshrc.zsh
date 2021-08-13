# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# Global config location
export CONFIG_PATH="/home/liu/.config/zsh"

# Autodetect the emulator
export EMULATOR=$(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))")

if [[ "${EMULATOR}" = "yakuake" ]]
then
    # Created by newuser for 5.7.1
    source ~/bin/powerlevel10k/powerlevel10k.zsh-theme

    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f "$CONFIG_PATH/themes/p10k.zsh" ]] || source "$CONFIG_PATH/themes/p10k.zsh"
else
    source "$CONFIG_PATH/themes/polyglot/polyglot.sh"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/liu/bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/liu/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/liu/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/liu/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PYTHONPYCACHEPREFIX="$HOME/.cache/pycache/"  #Python3.8 configurable bytecode path, see https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPYCACHEPREFIX

# <<< conda initialize <<<

# Install aliases
for file in $CONFIG_PATH/aliases/*(.); source $file

# Verbose PATH
# echo "[Current PATH have]"
# tr ':' '\n' <<< "$PATH"autoload -U +X bashcompinit && bashcompinit




# Load plugins
# complete -o nospace -C /usr/local/bin/bit bit
source "$CONFIG_PATH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$CONFIG_PATH/plugins/zsh-async/async.zsh"
source /usr/share/autojump/autojump.zsh
source "$CONFIG_PATH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$CONFIG_PATH/plugins/zsh-sudo/sudo.plugin.zsh"
fpath=($CONFIG_PATH/plugins/zsh-cht/ $fpath)

bindkey '^z' push-line-or-edit
