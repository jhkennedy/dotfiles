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

# function to view reStructuredText in the console
function rsto () {
    pandoc "$1" -f rst -t html | lynx -stdin
}
complete -f -o plusdirs -X '!*.rst' rsto

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

function findlivv () {
    eval find "$1" -iname \"*.py\" -exec grep --color=always -Hin "$2" {} \\\;
    eval find "$1" -iname \"*livv\" -exec grep --color=always -Hin "$2" {} \\\;
}

# functions to remember things
function howdiffpdf () {
    echo "git show 67d454d:main.flt > old.tex"
    echo "git show ee39374:main.flt > new.tex"
    echo "latexdiff old.tex new.tex > diff.tex"
    echo "pdflatex diff.tex"
}

###############################################################################
# Aliases
###############################################################################
alias nchead='ncdump -h'

alias act='. deactivate && . activate' 

alias pytree='tree -I __pycache__'
#alias findcodelines='find ./ -iname "*.py" | xargs wc -l'

# My server
alias gojoserver='ssh joseph@jhkennedy.org'

# General
alias term='gnome-terminal'
alias golearn='cd $HOME/Documents/Learn'
alias vim='vim -p'
alias githash='git rev-parse --short HEAD'

# Writing
alias gowrite='cd $HOME/Documents/Writing'
alias gocv='cd $HOME/Documents/Writing/CV'
alias gotalk='cd $HOME/Documents/Writing/Talks'
alias gopapers='cd $HOME/Documents/Writing/Papers'
alias goproposals='cd $HOME/Documents/Writing/Proposals' 
alias gographics='cd $HOME/Documents/Writing/Graphics'
alias gothesis='cd $HOME/Documents/Writing/Thesis/Dissertation'

alias gopismfevor='cd $HOME/Documents/Writing/Papers/PISM-FEvoR'
alias golivv-paper='cd $HOME/Documents/Writing/Papers/LIVVkit'

alias goldrd='cd $HOME/Documents/Writing/Proposals/LDRD'
alias goabm='cd $HOME/Documents/Writing/Proposals/DOE/2016_ABM/Proposal'

# Coding
alias gocode='cd $HOME/Documents/Code'
alias make='make -j 3'

alias godocs='cd $HOME/Documents/Docs'

# Experiments
alias goexperiments='cd $HOME/Documents/Experiments'
alias goinitmip='cd $HOME/Documents/Experiments/ISMIP6/initMIP'

# Data
alias godata='cd $HOME/Documents/Data'
alias goiceice='cd $HOME/Documents/Data/IceIceData'

# FEvoR
alias gofevor='cd $HOME/Documents/Code/fevor'

# CISM
alias gocism-public='cd $HOME/Documents/Code/CISM/cism-pub'
alias gocism='cd $HOME/Documents/Code/CISM/cism-dev'
alias gocism-bats='cd $HOME/Documents/Code/CISM/cism-dev/tests/regression'
alias gocism-manual='cd $HOME/Documents/Docs/cism-documentation'

alias gocism-data='cd $HOME/Documents/Code/cism-data'

#LIVVkit
alias golivv='cd $HOME/Documents/Code/LIVVkit/livv-dev'
alias golivv-nightly='cd $HOME/Documents/Code/LIVVkit/livv-nightly'
alias golivv-public='cd $HOME/Documents/Code/LIVVkit/livv-pub'

alias gobats='cd $HOME/Documents/Code/LIVVkit/BATS'

# EVE
alias goeve='cd $HOME/Documents/Code/EVE/eve'

# collabMe
alias gocollab='cd $HOME/Documents/Code/collabMe'

# PISM
alias gopism='cd $HOME/Documents/Code/pism'

# ORNL OLCF systems
alias gotitan='ssh kennedy@titan.ccs.ornl.gov' # Cray XK7
alias gorhea='ssh kennedy@rhea.ccs.ornl.gov'   # general purpose cluster
alias goccs='ssh kennedy@home.ccs.ornl.gov'    # general purpose server
alias godtn='ssh kennedy@dtn.ccs.ornl.gov'     # data transfer nodes

# NERSC systems
alias gocori='ssh kennedyj@cori.nersc.gov'
alias goedison='ssh kennedyj@edison.nersc.gov'

# NCAR systems
alias goyellowstone='ssh -X -l kennedy yellowstone.ucar.edu'

# ORNL Desktop
alias godesk='ssh -Y pc0101123.ornl.gov'

# ORNL network
alias corkon='cp $HOME/.ssh/config.bak $HOME/.ssh/config'
alias corkoff='echo " " > $HOME/.ssh/config'

# Blizzard
alias goblizzard='ssh -Y blizzard.ornl.gov'

###############################################################################
# Path Exports
###############################################################################

# NCL
export NCARG_ROOT='/usr/local/ncl-6.1.2'
export PATH=$NCARG_ROOT/bin:$PATH

# PISM
export PETSC_DIR='/home/fjk/PETSc/petsc-3.7.4'
export PETSC_ARCH='linux_gnu_opt'
export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH
export PATH=$HOME/pism-dev/bin:$PATH

# CISM
export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

#-------------------------------------------------------------------------------
#WARNING: all paths must be exported before activating a anaconda environment,
#         else they will only exist within that environment!`source deactivate`
#         will reset the path to what it was before `sorce activate` was run the
#         first time!
#-------------------------------------------------------------------------------
# create a base path of pre-anaconda paths
export NOCONDA_PATH=$PATH

# added by Anaconda3 4.1.1 installer
export PATH="/home/fjk/anaconda3/bin:$PATH"
export YESCONDA_PATH=$PATH
# always source the LIVVkit environment initially
source activate LIVVkit

