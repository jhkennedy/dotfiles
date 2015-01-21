# link this file to ~/.bash_aliases

function pdfo () {
	evince "$1" 2>/dev/null & 
}
complete -f -o plusdirs -X '!*.pdf' pdfo

function nullit () {
	"$1" "$2" 2>/dev/null &
}

alias gopapers='cd ~/Documents/Writing/Papers'
alias gowrite='cd ~/Documents/Writing'
alias gocode='cd ~/Documents/Code'
alias godata='cd ~/Documents/Data'

alias gocism='cd ~/Documents/Code/CISM'
alias devcism='cd ~/Documents/Code/cism-dev'
alias buildcism='cd ~/Documents/Code/cism-dev/builds/linux-gnu-cism'

alias makepdf='./makepdf'

alias make='make -j 3'

# CISM Variables
export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'
