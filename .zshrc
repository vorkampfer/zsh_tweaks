# I have some cool aliases for nmap and I have oh-my-zsh installed first
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
alias defaultscan='nmap -sV -Pn -A -T2 -oN nmap/default.nmap -vvv'
alias allscan='nmap -Pn -sVC -p- -n --min-rate 500 -oN nmap/allscan.nmap -vvv'
alias vulnscan='nmap -Pn --script "vuln" --min-rate 500 --open -oN nmap/vuln.nmap -vvv'
alias stealthscan='sudo nmap -f --mtu 24 -Pn -n --open -sS -oN nmap/stealthscan.nmap -vvv'
alias portzscan='nmap -A -Pn -n -vvv -oN nmap/portzscan.nmap -p'
alias fastscan='nmap -p- -sV --min-rate 5000 -vvv -n -Pn -oN nmap/fastscan.nmap'
alias pyserver='python3 -m http.server 8000'
alias superfastscan='nmap -p- --min-rate 10000 -oN nmap/superfast.nmap 10.10.10.184'
alias ftpanonscan='nmap --script ftp-anon -vvv -p21'
alias openscan='sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn -oN nmap/openscan.nmap' 
alias ls='exa -al --color=always --group-directories-first'
alias hgrep='cat ~/.zsh_history | grep -i'
alias gitcat='bat --theme GitHub -p'
alias bcat='batcat -l ruby --paging=never'
alias jbat='bat -l java --paging=never -p'
alias rbat='bat -l ruby --paging=never -p'
alias sourcez='source ~/.zshrc'
#alias pkgquery='LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h | grep -i'
export portz="$(cat ~/wackdab0x/nmap/superfast.nmap | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//g')"
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
export PATH="$PATH:/home/pepe/bazhScR1pT1nG"
####################################################
####################################################
#####################################################
# Created by `pipx` on 2023-08-14 02:11:12
export PATH="$PATH:/home/pepe/.local/bin:/sbin/home/pepe/.local/bin"

# /home/pepe/.local/bin
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
#export PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'
#export DEFAULT_USER=$USER
###############################################################################
###############################################################################
### The HISTORY settings below go in ~/.oh-my-zsh/lib/history.zsh
## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY
