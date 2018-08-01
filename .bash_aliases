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

function howtee () {
    echo "command > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)"
    echo "see: https://stackoverflow.com/questions/692000"
}

###############################################################################
# Aliases
###############################################################################
alias which='command -v'

alias nchead='ncdump -h'

alias act='conda deactivate && conda activate'

alias pytree='tree -I __pycache__'
#alias findcodelines='find ./ -iname "*.py" | xargs wc -l'

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

alias goldrd='cd $HOME/Documents/Writing/Proposals/LDRD'
alias goabm='cd $HOME/Documents/Writing/Proposals/DOE/2016_ABM/Proposal'

# Coding
alias gocode='cd $HOME/Documents/Code'
alias make='make -j 3'

# alias tls='tmux ls'
# alias tmk='tmux new -s'
# alias tsw='tmux switch -t'
# alias tmv='tmux rename-session -t'
# alias trm='tmux kill-session -t'

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

# E3SM
alias goe3sm='cd $HOME/Documents/Code/E3SM/E3SM'
alias gocime='cd $HOME/Documents/Code/E3SM/cime'

# LIVVkit
alias golivv='cd $HOME/Documents/Code/LIVVkit/livv-dev'
alias golivv-nightly='cd $HOME/Documents/Code/LIVVkit/livv-nightly'
alias golivv-clean='cd $HOME/Documents/Code/LIVVkit/livv-clean'

alias goatlas='cd $HOME/Documents/Code/LIVVkit/Atlas'
alias gobats='cd $HOME/Documents/Code/LIVVkit/BATS'
alias golex='cd $HOME/Documents/Code/LIVVkit/lex-dev'

# EVE
alias goeve='cd $HOME/Documents/Code/EVE/eve'
alias gosalil='cd $HOME/Documents/Code/EVE/Salil'

# collabMe
alias gocollab='cd $HOME/Documents/Code/collabMe'

# PISM
alias gopism='cd $HOME/Documents/Code/pism'

# ORNL OLCF systems
alias gotitan='ssh kennedy@titan.ccs.ornl.gov' # Cray XK7
alias gorhea='ssh -X kennedy@rhea.ccs.ornl.gov'   # general purpose cluster
alias goccs='ssh kennedy@home.ccs.ornl.gov'    # general purpose server
alias godtn='ssh kennedy@dtn.ccs.ornl.gov'     # data transfer nodes

# NERSC systems
alias gocori='ssh kennedyj@cori.nersc.gov'
alias goedison='ssh kennedyj@edison.nersc.gov'

# NCAR systems
alias gocheyenne='ssh -X -l kennedy cheyenne.ucar.edu'

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
# export NCARG_ROOT='/usr/lib/ncarg'
# export PATH=$NCARG_ROOT/bin:$PATH

# PISM
# export PETSC_DIR='/home/fjk/PETSc/petsc-3.7.4'
# export PETSC_ARCH='linux_gnu_opt'
# export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH
# export PATH=$HOME/pism-dev/bin:$PATH

# CISM
# export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

# Conda 4.4+ reccomended way of enabling conda in bash
. $HOME/miniconda3/etc/profile.d/conda.sh
conda activate LIVVkit

# FIX GLib-GIO memory message: https://github.com/conda-forge/glib-feedstock/issues/19 
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
