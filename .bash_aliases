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

# function to view markdown in the console
function mdo () {
    pandoc "$1" -f markdown_github -t html | lynx -stdin
}
complete -f -o plusdirs -X '!*.md' mdo


# Writing
alias gowrite='cd ~/Documents/Writing'
alias gopapers='cd ~/Documents/Writing/Papers'
alias gothesis='cd ~/Documents/Writing/Thesis/Dissertation'

alias makepdf='./makepdf'


# Coding
alias gocode='cd ~/Documents/Code'
alias make='make -j 3'

# Data
alias godata='cd ~/Documents/Data'

# FEvoR
alias gofevor='cd ~/Documents/Code/fevor'

# NCL
export NCARG_ROOT='/usr/local/ncl-6.1.2'
export PATH=$NCARG_ROOT/bin:$PATH

# CISM
alias gocism='cd ~/Documents/Code/CISM'
alias devcism='cd ~/Documents/Code/cism-dev'
alias buildcism='cd ~/Documents/Code/cism-dev/builds/ubuntu-1404-cism'
alias testcism='cd ~/Documents/Code/cism-dev/tests'

alias golivv='cd ~/Documents/Code/LIVV'

export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

# PISM
alias gopism='cd ~/Documents/Code/pism'

export PETSC_DIR='/home/fjk/Documents/Code/petsc-3.4.5'
export PETSC_ARCH='linux_gnu_opt'
export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH

export PATH=~/pism-dev/bin:$PATH
