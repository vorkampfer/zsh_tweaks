# I do not recommend copy and pasting my zshrc file. I am posting this just to help new people using blackarch with ideas.
# I recommend always backing up the ~/.zshrc file before making changes. Enjoy!

# Global Variables
# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
cyanColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#neofetch
# /usr/bin/kitty +kitten icat $HOME/motivational_wallpapers_quotes/bless_them_that_spitefully_use_you.png
echo -e "${grayColour}Bible verse: ${endColour}" && shuf -n 1 $HOME/Documents/bible_verses_mixed.txt | head -1
/usr/bin/python2.7 $HOME/python_projects/color_banner10.py
todayDate=$(date | cut --bytes 3-30 | xargs | grep .)
chicagoDate=$(TZ=America/Chicago date | cut --bytes 3-30 | xargs | grep .)
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
# For a full list of active aliases, run `alias_list`.
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
alias hgrep='echo "${yellowColour}History Search: NOT Case-Sensitive${endColour}" && echo && cat ~/.zsh_history | grep -i'
alias hgrepb='echo "${yellowColour}History Search of the master_history_backup file.${endColour} ${redColour} CASE SENSITIVE ${endColour}" && echo && cat ~/Documents/master_history_backup | grep'
alias hgrepc='echo "${yellowColour}Case Insensitve Search${endColour}" && echo && cat ~/.zsh_history | grep'
alias ugrep='echo "${yellowColour}History  Search of unique_history file.${endColour} ${redColour} CASE SENSITIVE ${endColour}" && echo && cat $HOME/Documents/unique_history | grep'
alias zgrep='echo "${yellowColour}History Search of zsh_history_unique file.${endColour} ${redColour} CASE SENSITIVE ${endColour}" && echo && cat $HOME/Documents/zsh_history_unique | grep'
alias cleanunique='cat $HOME/Documents/zsh_history_backup | sort -u > $HOME/Documents/unique_history'
alias gitcat='bat --theme GitHub --paging=never -p'
alias bcat='bat -l bash --paging=never -p'
alias ncat='bat -l ruby'
alias jbat='bat -l java --paging=never -p'
alias rbat='bat -l ruby --paging=never -p'
alias qbat='bat -l QML --paging=never -p'
alias pbat='bat -l Python --paging=never -p'
alias sourcez='source ~/.zshrc'
alias utctimezone='sudo timedatectl set-timezone UTC && sudo timedatectl status'
alias stockholmtimezone='sudo timedatectl set-timezone Europe/Stockholm && sudo timedatectl status'
alias blackarch_toolsearch='pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u | grep -i'
alias copyportz='echo "${yellowColour}Ports have been copied to the clipboard! ${endColour}" && echo $openportz > $HOME/haCk54CrAcK/nmap/nmapclip.txt && cat $HOME/haCk54CrAcK/nmap/nmapclip.txt | clipcopy'
#alias obs='$HOME/Videos/.vid80s8098d09/DO_NOT_DELETE_83409802/encryptedarchive/Obsidian-1.6.7.AppImage &> /dev/null & disown'
alias obs='cd ~/Videos/.vid80s8098d09/DO_NOT_DELETE_83409802 && ./Obsidian-1.6.3.AppImage &> /dev/null & disown'
alias wolf='cd $HOME/Videos/.vid80s8098d09/DO_NOT_DELETE_83409802/rand_wolf_shuffle && ./LibreWolf* &> /dev/null & disown'
alias noptrix='sudo pacman-key --recv-keys F9A6E68A711354D84A9B91637533BAFE69A25079 && sudo pacman-key --lsign-key F9A6E68A711354D84A9B91637533BAFE69A25079'
alias refreshkeyz='sudo pacman-key --refresh-keys'
alias hexConvert='cat $HOME/Documents/convertHexNumbers.txt'
alias orphanlist='pacman -Qqd | pacman -Rsu --print - && echo "${grayColour} Remove the files with this command:${endColour} ${redColour} As root:${endColour} ${purpleColour}pacman -Qqd | pacman -Rsu -${endColour}  ${yellowColour} or as sudo:${endColour} ${purpleColour} pacman -Qtdq | sudo pacman -Rns - ${endColour}"'
alias bible_verse_random='shuf -n 1 $HOME/Documents/bible_verses_mixed.txt | head -1'
alias killGhost='sudo systemctl stop tor.service && source torsocks off'
alias htbip='cat /etc/hosts | grep --color=never ^10'
alias tun0ip='ifconfig | grep "inet 10" | awk "{print \$2}"'
alias mytun0='ifconfig | grep "inet 10" | awk "{print \$2}" | grep .'
alias TUN0='ip addr | grep "inet 10" | awk "{print \$2}" | grep .'
alias pacman_dependz='pacman --sync --info'
alias pacman_rdependz='pacman --sync --info --info'
#alias wolf='$HOME/Videos/.vid80s8098d09/.vid908080808/.vide09098090/.vid987sd98f79s8d79/.vidotore98u0e0e9e0/.videotorinstallhere4/.videosmytor23242/.torupper40249802/.torlower298240980/.t0r9s88dfua9s8dfu/LibreWolf.x86_64.AppImage &> /dev/null & disown'
alias bakup_history='cat ~/.zsh_history | tail -n 5000 | sort -u >> ~/Documents/zsh_history_backup'
#alias snippets='echo "${yellowColour}My favorite Snippets of Code. One Liners, Loops, Stuff I can not remember. etc...${endColour}" && cat ~/Documents/fav_snippets.txt | grep -i'
alias snippets='echo "${yellowColour}My favorite Snippets of Code. One Liners, Loops, Stuff I can not remember. etc...${endColour}" && cat ~/Documents/fav_snippets.txt | sed "s/#/\n/g" | grep -i'
alias snippets_hacking_tools='echo "${yellowColour}My favorite${endColour} ${redColour}hacking tool commands${endColour} ${yellowColour}, Stuff I can not remember. etc...${endColour}" && cat $HOME/Documents/fav_hacking_tool_command_snippets.txt | sed "s/#/\n/g" | grep -i'
alias feh_dev_null_usage='feh ~/Pictures/dev_null_stdin_stdout_stderror_dev_null.png &> /dev/null & disown'
alias feh_ttl_os_identify='feh ~/Pictures/ttl_os_identifier_chart.png &> /dev/null & disown'
alias bible_mixed_lookup='cat ~/Documents/bible_verses_mixed.txt | grep -i'
alias lbreak="sed -e 's/^/\n\n/'"
alias bible_sirachlookup='cat $HOME/Downloads/bible_project/sirach.txt | grep -i'
alias bible_fullverse_lookup='cat $HOME/Downloads/bible_project/akjv.txt | grep -i'
alias qml='bat -l QML --paging=never -p'
alias wordlist_find='echo "${yellowColour} Seclist Wordlist Finder:${endColour} ${redColour} Not Case Sensitive ${endColour}" && cd $HOME && find /usr -name \*.txt\* 2>/dev/null | grep -i'
alias php_webshell_find='echo "${yellowColour} PHP WebShell  Finder:${endColour} ${redColour} Not Case Sensitive ${endColour}" && cd $HOME && find /usr -name \*.php\* 2>/dev/null | grep -i'
alias seclist_find='echo "${yellowColour} Seclist Wordlist Finder:${endColour} ${redColour} Not Case Sensitive ${endColour}" && cd $HOME && find /usr -name \*.txt\* 2>/dev/null | grep -i'
alias zsh_hbak_find='cd $HOME && find . -name \*.gz\* 2>/dev/null | grep -iE "master|backup|zsh" | grep -ivE "password|lst|rockyou|docs" | sed "s/^\./\$HOME/g" | bat -l QML --paging=never -p'
#alias tstart='cd $HOME/Videos/.vid80s8098d09/permtor/tor*/tor-browser && ./start-tor-browser.desktop'
alias hashexamples='/usr/bin/python3 $HOME/python_projects/hash_examples_udemy.py'
alias bible_date='echo "Todays date is." && date | sed "s/zo //" | sed "s/ //" && bibleverse'
alias editsnippets='mousepad ~/Documents/fav_snippets.txt &> /dev/null & disown'
alias edit_snippets_hacking_tools='mousepad $HOME/Documents/fav_hacking_tool_command_snippets.txt &> /dev/null & disown'
alias bible_edit_verseMixed='mousepad $HOME/Documents/bible_verses_mixed.txt &> /dev/null & disown'
alias edit_bible_versesMixed='mousepad $HOME/Documents/bible_verses_mixed.txt &> /dev/null & disown'
alias editLoops='mousepad ~/Documents/FOR_LOOPS_and_WHILE_LOOPS_EXAMPLES.txt &> /dev/null & disown'
alias feh_dockercheat1='/usr/bin/feh $HOME/Pictures/docker_cheatsheet_1.png &> /dev/null & disown'
alias editcoolpcnames='mousepad ~/Documents/coolnames_for_computer.txt &> /dev/null & disown'
alias feh_netexec_authentication='feh ~/Pictures/netexec_same_as_crackmapexec_no_bruteforce_continue_on_success.png &> /dev/null & disown'
alias feh_bootstrap_blackarch='feh $HOME/Pictures/bootstrap_sh_instructions_blackarch.png &> /dev/null & disown'
alias zsh_lasthistory="echo '${blueColour} lasthistory + number ${endColour}' && cat ~/.zsh_history | tail -n"
alias lasthistory="echo '${redColour}==>[+]${endColour} ${blueColour} USAGE: lasthistory + number ${endColour} :: ${cyanColour} Grepping on ~/.zsh_history file${endColour} ' && cat ~/.zsh_history | tail -n"
alias tailhistory="echo '${blueColour} lasthistory + number ${endColour}' && cat ~/.zsh_history | tail -n"
alias netsniffer="/usr/bin/python3 $HOME/python_projects/hacking_py_tools/sniff_mynetwork.py > $HOME/python_projects/hacking_py_tools/results && cat $HOME/python_projects/hacking_py_tools/results | grep -a 'is reachable'"
# alias smasher = sed '/^[[:space:]]*$/d' | awk '!($3="")'
# alias jqclean="jq . | sed 's/\"//g' | tr -d '{}[],' | awk '!($3="")' | sed '/^[[:space:]]*$/d'" <<< zsh doesn't like this alias either
# alias hjohn='hgrep john | tail -40'

# alias pkgquery='LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h | grep -i'
# export portz="$(cat /home/pablo/hackdab0x/nmap/superfast.nmap | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//g')"
export openportz="$(cat $HOME/haCk54CrAcK/nmap/openscan.nmap | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//g')"
# export launchpad=$(cat ~/haCk54CrAcK/nmap/portzscan.nmap | grep -i openssh | cut -c 30-60)
# export BROWSER="/usr/bin/lynx"
alias aliases_list='cat $HOME/Documents/aliases_and_variables_list.txt'
alias tDate='echo "${grayColour}Zulu date & time is: $todayDate ${endColour}" && echo "${turquoiseColour}The CST date & time is: $chicagoDate ${endColour}"'
alias def_Handler_Syntax='cat ~/python_projects/2million_scanner.py | grep -i -B2 -A11 "scapy"'
alias shell_upgrade='cat $HOME/Documents/shell_upgrade.txt'
alias feh_for_loop_syntax='feh for_loop_syntax_structure_example.png &> /dev/null & disown'
alias feh_termcolor='feh $HOME/Pictures/python_termcolor_color_codes.png &> /dev/null & disown'
alias editPythonPDB='mousepad ~/Documents/python_pdb_set_trace_debugging_your_python_to_write_better_code.txt &> /dev/null & disown'
alias lookup_awk='cat ~/Documents/awk_sed_tr_cut_commands_examples.txt | grep -i --color'
alias lookup_ports='echo "${turquoiseColour}Popular Ports & Protocols: ${endColour}" && cat ~/Documents/Popular_Ports_and_Protocols.md | grep --color -i'
alias startCairoDock='cairo-dock &> /dev/null & disown'
alias launchCairoDock='cairo-dock &> /dev/null & disown'
alias cairodockStart='cairo-dock &> /dev/null & disown'
alias feh_C_Lang_Structure='feh $HOME/Pictures/general_form_of_a_C_Lang_program.png &> /dev/null & disown'
alias ip192='ifconfig | grep "inet 192" | cut -c 15-26 | grep .'
alias myHOSTNAME="hostnamectl | grep hostname | cut -d':' -f2 | sed '/^[[:space:]]*$/d' | sed 's/ //g'"
alias man_sqlmap='echo "${yellowColour} sqlmap man-pages:${endColour} ${redColour} Not Case Sensitive ${endColour}" && cd $HOME && cat $HOME/Documents/sqlmap_man_pages_in_txt.txt | sort -u | grep -i'
alias man_gobuster='echo "${yellowColour} Gobuster man-pages:${endColour} ${redColour} Not Case Sensitive ${endColour}" && cd $HOME && cat $HOME/Documents/man_gobuster.txt | sort -u | grep -i'
alias duSORT='echo "${redColour}==>[+]${endColour} ${yellowColour} Sort by human readable and size: ${endColour}" && du -sh -- * | sort -h'
alias shell_upgrade='echo "${yellowColour} How to upgrade a Linux shell from a non-tty:${endColour}" && cat $HOME/Documents/shell_upgrade_automater.txt'
alias capture='/usr/bin/xfce4-screenshooter &> /dev/null & disown'
alias snippets_websites='echo "${yellowColour}My favorite${endColour} ${redColour}websites${endColour} ${yellowColour}, sites I can not remember. etc...${endColour}" && cat $HOME/Documents/fav_sites.txt | sed "s/#/\n/g" | grep -i'
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
export PATH="$PATH:$HOME/bashscripting:$HOME/bashscripting/bash_practice"
####################################################
####################################################
####################################################
### VI or VIM style keyboard commands in terminal
#bindkey -v
#export KEYTIMEOUT=1
### More Paths
# Created by `pipx` on 2023-08-14 02:11:12
export PATH="$PATH:$HOME/.local/bin:/sbin$HOME/.local/bin:$HOME/.pyenv/versions/3.7.17/bin/python3:/usr/lib/python3.12/site-packages/virtualenv"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.local/share/gem/ruby/3.2.0/gems"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.2.0/bin:/usr/lib/ruby/site_ruby/3.2.0/rubygems"
export PATH="$PATH:/root/.local/share/gem/ruby/3.2.0/bin:/usr/lib/ruby/site_ruby/3.2.0/rubygems.rb"
#export PATH="$PATH:$HOME/Documents/.obsidian/plugins/obsidian-pandoci" <<< Adding Obsidian Plugins to Path

# /home/pepe/.local/bin
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
# export PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'
# export DEFAULT_USER=$USER
export PATH="$PATH:/root/.local/share/gem/ruby/3.0.0/bin:/usr/lib/ruby/gems/3.0.0:/usr/lib/ruby/3.0.0/rubygems/:/usr/lib/ruby/3.0.0/rubygems/core_ext/kernel_require.rb"
# Created by `pipx` on 2023-11-13 03:10:21
export PATH="$PATH:$HOME/.local/bin"
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
#########################################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
