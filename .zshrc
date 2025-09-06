autoload -Uz compinit && compinit
setopt correct
pokemon-colorscripts -r -b
#autoload predict-on && predict-on
#zstyle ':completion:*:default' menu select=2
#autoload -Uz promptinit
#promptinit
#PROMPT="%n %~/ -~> "
autoload colors && colors
setopt AUTO_MENU
setopt AUTO_NAME_DIR
setopt GLOB_DOTS

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
alias loopback="pactl load-module module-loopback"
alias ls="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias exaa="exa -a"
alias exal="exa -l"
alias 120hz="xrandr --output DVI-I-1 --mode 1920x1080 --refresh 120"
alias chmon="~/dotfiles/./chmon"
alias rdpw="rdesktop -g 1920x1080 -P"
alias zeroconf="pactl load-module module-zeroconf-discover"
alias trees="tree --du -h -a --sort=size"
alias ftree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"
alias vrez="xrandr --output Virtual-1 --mode 1920x1080"
alias vbg="feh --bg-scale ~/dotfiles/wallpaper/yama.jpg"
alias wineg="~/.local/share/Steam/steamapps/common/Proton\ 8.0/dist/bin/wine"
alias wchmon="wlr-randr --output DP-1 --on wlr-randr --output eDP-1 --off"
export EDITOR=nvim
export PATH="$HOME/.config/myPython/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/applications:$PATH"
wal -n -f ~/dotfiles/wal.json
HISTFILE=~/.zsh_history
HISTSIZE=2048
SAVEHIST=2048
HISTTIMEFORMAT='%F %T '

eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"
sleep 1; clear
