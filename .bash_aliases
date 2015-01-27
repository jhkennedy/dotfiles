# grey background for the command prompt
#export PS1="\e[44m\u@\h \w$ \e[m"

# function to open pdfs quietly. 
function pdfo () {
	evince "$1" 2>/dev/null & 
}
complete -f -o plusdirs -X '!*.pdf' pdfo

# function to run a command quietly
function nullit () {
	"$1" "$2" 2>/dev/null &
}

alias gopapers='cd ~/Documents/Writing/Papers'
alias gowrite='cd ~/Documents/Writing'
alias gocode='cd ~/Documents/Code'
alias godata='cd ~/Documents/Data'

alias gocism='cd ~/Documents/Code/CISM'
alias devcism='cd ~/Documents/Code/cism-dev'
alias buildcism='cd ~/Documents/Code/cism-dev/builds/ubuntu-1404-cism'
alias testcism='cd ~/Documents/Code/cism-dev/tests'

alias golivv='cd ~/Documents/Code/LIVV'

alias gopism='cd ~/Documents/Code/pism'

alias makepdf='./makepdf'

alias make='make -j 3'

# CISM Variables
export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

# PISM Variables
export PETSC_DIR='/home/fjk/Documents/Code/petsc-3.4.5'
export PETSC_ARCH='linux_gnu_opt'
export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH

export PATH=~/pism-dev/bin:$PATH
