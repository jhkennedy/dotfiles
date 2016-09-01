# grey background for the command prompt
#export PS1="\e[44m\u@\h \w$ \e[m"

###############################################################################
# Useful functions
###############################################################################

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

# funtion to make a directory and move into it
function gomkdir () {
    mkdir "$1" && cd "$1"
}

# function to find something, then execute grep
function findgrep () {
    eval find "$1" -iname \"$2\" -exec grep --color=always -Hin "$3" {} \\\; 
}

function findtex () {
    eval find "$1" -iname \"*.tex\" -exec grep --color=always -Hin "$2" {} \\\;
}

function findmytex () {
    eval find "./*(Figures|Tables|Text)/" -iname \"*.tex\" -exec grep --color=always -Hin "$1" {} \\\;
}

function findpy () {
    eval find "$1" -iname \"*.py\" -exec grep --color=always -Hin "$2" {} \\\;
}

###############################################################################
# Path Exports
###############################################################################

# added by Anaconda3 4.1.1 installer
export PATH="/home/fjk/anaconda3/bin:$PATH"
# always source the LIVVkit environment initially
source activate LIVVkit

# NCL
export NCARG_ROOT='/usr/local/ncl-6.1.2'
export PATH=$NCARG_ROOT/bin:$PATH

# PISM
export PETSC_DIR='/home/fjk/Documents/Code/petsc-3.5.3'
export PETSC_ARCH='linux_gnu_opt'
export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH
export PATH=~/pism-dev/bin:$PATH

# CISM
export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

###############################################################################
# Aliases
###############################################################################

alias pytree='tree -I __pycache__'
#alias findcodelines='find ./ -iname "*.py" | xargs wc -l'

# My server
alias gojoserver='ssh joseph@jhkennedy.org'


# General
alias term='gnome-terminal'
alias golearn='cd ~/Documents/Learn'
alias vim='vim -p'
alias githash='git rev-parse --short HEAD'

# Writing
alias gowrite='cd ~/Documents/Writing'
alias gopapers='cd ~/Documents/Writing/Papers'
alias goproposals='cd ~/Documents/Writing/Proposals' 
alias gographics='cd ~/Documents/Writing/Graphics'
alias gothesis='cd ~/Documents/Writing/Thesis/Dissertation'

alias gopismfevor='cd ~/Documents/Writing/Papers/PISM-FEvoR'
alias golivv-paper='cd ~/Documents/Writing/Papers/LIVVkit'

alias goldrd='cd ~/Documents/Writing/Proposals/LDRD'
alias goabm='cd ~/Documents/Writing/Proposals/DOE/2016_ABM/Proposal'

alias makepdf='./makepdf'


# Coding
alias gocode='cd ~/Documents/Code'
alias make='make -j 3'

alias godocs='cd ~/Documents/Docs'

# Experiments
alias goexperiments='cd ~/Documents/Experiments'
alias goinitmip='cd ~/Documents/Experiments/ISMIP6/initMIP'

# Data
alias godata='cd ~/Documents/Data'
alias goiceice='cd ~/Documents/Data/IceIceData'

# FEvoR
alias gofevor='cd ~/Documents/Code/fevor'

# CISM
alias gocism-public='cd ~/Documents/Code/cism-pub'
alias gocism='cd ~/Documents/Code/cism-dev'
alias gobats='cd ~/Documents/Code/cism-dev/tests/regression'
alias gocism-manual='cd ~/Documents/Docs/cism-documentation'

alias golivv='cd ~/Documents/Code/livv-dev'
alias golivv-nightly='cd ~/Documents/Code/livv-nightly'
alias golivv-public='cd ~/Documents/Code/livv-pub'

alias gocism-data='cd ~/Documents/Code/cism-data'

# PISM
alias gopism='cd ~/Documents/Code/pism'

# ORNL OLCF systems
alias gotitan='ssh kennedy@titan.ccs.ornl.gov' # Cray XK7
alias gorhea='ssh kennedy@rhea.ccs.ornl.gov'   # general purpose cluster
alias goccs='ssh kennedy@home.ccs.ornl.gov'    # general purpose server
alias godtn='ssh kennedy@dtn.ccs.ornl.gov'     # data transfer nodes

# NERSC systems
alias gocori='ssh kennedyj@cori.nersc.gov'

# NCAR systems
alias goyellowstone='ssh -X -l kennedy yellowstone.ucar.edu'

# ORNL Desktop
alias godesk='ssh -Y pc0101123.ornl.gov'

# ORNL network
alias corkon='cp ~/.ssh/config.bak ~/.ssh/config'
alias corkoff='echo " " > ~/.ssh/config'

# Blizzard
alias goblizzard='ssh -Y blizzard.ornl.gov'

