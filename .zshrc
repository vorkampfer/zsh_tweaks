# Global Variables
# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#neofetch
# /usr/bin/kitty +kitten icat /home/shadow42/motivational_wallpapers_quotes/bless_them_that_spitefully_use_you.png
shuf -n 1 /home/shadow42/Documents/bible_verses_mixed.txt | head -1
/usr/bin/python2.7 /home/shadow42/python_projects/color_banner10.py
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# #####################################################################
# #########################################################################
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias defaultscan='nmap -sV -Pn -A -T2 -oN nmap/default.nmap -vvv'
alias allscan='nmap -Pn -sVC -p- -n --min-rate 500 -oN nmap/allscan.nmap -vvv'
alias vulnscan='nmap -Pn --script "vuln" --min-rate 500 --open -oN nmap/vuln.nmap -vvv'
alias stealthscan='sudo nmap -f --mtu 24 -Pn -n --open -sS -oN nmap/stealthscan.nmap -vvv'
alias portzscan='nmap -A -Pn -n -vvv -oN nmap/portzscan.nmap -p'
alias fastscan='nmap -p- -sV --min-rate 5000 -vvv -n -Pn -oN nmap/fastscan.nmap'
alias pyserver='python3 -m http.server 8000'
alias superfastscan='nmap -p- --min-rate 5000 -n -Pn -oN nmap/superfast.nmap -vvv'
alias ipv6scan='sudo nmap -6 --min-rate 500 -oN nmap/ipv6.nmap -vvv'
alias ftpanonscan='nmap --script ftp-anon -vvv -p21'
alias openscan='sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn -oN nmap/openscan.nmap'
alias ls='exa -alhg --color=always --group-directories-first'
# exa --long --header --group
alias hgrep='echo "${yellowColour}HISTORY SEARCH: NOT Case-Sensitive${endColour}" && echo && cat ~/.zsh_history | grep -i'
alias hgrepc='echo "${yellowColour}CASE SENSITIVE HISTORY SEARCH${endColour}" && echo && cat ~/.zsh_history | grep'
alias gitcat='bat --theme GitHub --paging=never -p'
alias bcat='bat -l bash --paging=never -p'
alias ncat='bat -l ruby'
alias jbat='bat -l java --paging=never -p'
alias rbat='bat -l ruby --paging=never -p'
alias ibat='bat -A ruby'
alias sourcez='source ~/.zshrc'
alias synctimezone='sudo timedatectl set-timezone Europe/Stockholm && sudo timedatectl status'
alias toolsearch='pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u | grep -i'
alias copyportz='echo "${yellowColour}Ports have been copied to the clipboard! ${endColour}" && echo $openportz > /home/shadow42/hax0r1if3/nmap/nmapclip.txt && cat /home/shadow42/hax0r1if3/nmap/nmapclip.txt | clipcopy'
alias obs='obsidian &> /dev/null & disown'
alias noptrix='sudo pacman-key --recv-keys F9A6E68A711354D84A9B91637533BAFE69A25079 && sudo pacman-key --lsign-key F9A6E68A711354D84A9B91637533BAFE69A25079'
alias refreshkeyz='sudo pacman-key --refresh-keys'
alias hexadecimalConvert='cat /home/shadow42/Documents/convertHexNumbers.txt'
alias orphanlist='pacman -Qqd | pacman -Rsu --print -'
alias bibleverse='shuf -n 1 /home/shadow42/Documents/bible_verses.txt | head -1'
alias killGhost='sudo systemctl stop tor.service && source torsocks off'
alias mytun0='ifconfig | grep "inet 10"'
alias dependz='pacman --sync --info'
alias rdependz='pacman --sync --info --info'
#alias hjohn='hgrep john | tail -40'

#alias pkgquery='LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h | grep -i'
#export portz="$(cat /home/pablo/hackdab0x/nmap/superfast.nmap | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//g')"
export openportz="$(cat /home/shadow42/hax0r1if3/nmap/openscan.nmap | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//g')"
# export jqclean="$(jq . | sed 's/\"//g' | tr -d '{}[],' | awk '!($3="")' | sed '/^[[:space:]]*$/d')"
# export batr="$('bat -l ruby --paging=never -p')"  # Refuses to export this bat command to a variable
# export target="10.10.10.203"
####################################################
####################################################
####################################################
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
####################################################
####################################################
####################################################
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ff00ff'
export PATH="$PATH:/home/shadow42/bashscr1pt1ng"
####################################################
####################################################
####################################################
### VI or VIM style keyboard commands in terminal
#bindkey -v
#export KEYTIMEOUT=1
### More Paths
# Created by `pipx` on 2023-08-14 02:11:12
#export PATH="$PATH:/home/pepe/.local/bin:/sbin/home/pepe/.local/bin"
export PATH="$PATH:/home/shadow42/.local/share/gem/ruby/3.0.0/bin:/home/shadow42/Documents/.obsidian/plugins/obsidian-pandoc"

# /home/pepe/.local/bin
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
#export PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'
#export DEFAULT_USER=$USER
#export PATH="$PATH:/root/.local/share/gem/ruby/3.0.0/bin"
# Created by `pipx` on 2023-11-13 03:10:21
export PATH="$PATH:/home/shadow42/.local/bin"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
#########################################################
#########################################################
##########################################################
# disable sound bell
set -g bell-action none
# disable visual bell
set -g visual-bell off
