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

# funtion to make a directory and move into it
function gomkdir () {
    mkdir "$1" && cd "$1"
}

# function to find something, then execute grep
#find ./*(Figures|Tables|Text)/ -iname "*.tex" -exec grep --color=always -Hin ", and" {} \;
function findgrep () {
    eval find "$1" -iname \"$2\" -exec grep --color=always -Hin "$3" {} \\\; 
}

# My server
alias gojoserver='ssh joseph@jhkennedy.org'


# General
alias term='gnome-terminal'
alias golearn='cd ~/Documents/Learn'
alias vim='vim -p'

# Writing
alias gowrite='cd ~/Documents/Writing'
alias gopapers='cd ~/Documents/Writing/Papers'
alias gographics='cd ~/Documents/Writing/Graphics'
alias gothesis='cd ~/Documents/Writing/Thesis/Dissertation'

alias gotaylor='cd ~/Documents/Writing/Papers/Taylor'
alias gosimple='cd ~/Documents/Writing/Papers/SimpleMigRe'
alias gopismfevor='cd ~/Documents/Writing/Papers/PISM-FEvoR'

alias goldrd='cd ~/Documents/Writing/Proposals/LDRD'

alias makepdf='./makepdf'


# Coding
alias gocode='cd ~/Documents/Code'
alias make='make -j 3'

alias godocs='cd ~/Documents/Docs'

# Data
alias godata='cd ~/Documents/Data'
alias goiceice='cd ~/Documents/Data/IceIceData'

# FEvoR
alias gofevor='cd ~/Documents/Code/fevor'

# NCL
export NCARG_ROOT='/usr/local/ncl-6.1.2'
export PATH=$NCARG_ROOT/bin:$PATH

# CISM
alias gocism-public='cd ~/Documents/Code/cism-pub'
alias gocism='cd ~/Documents/Code/cism-dev'
alias gocism-manual='cd ~/Documents/Docs/cism-documentation'

alias golivv='cd ~/Documents/Code/livv-dev'
alias golivv-nightly='cd ~/Documents/Code/livv-nightly'
alias golivv-public='cd ~/Documents/Code/livv-pub'

export CISM_TRILINOS_DIR='/usr/local/trilinos-11.10.2-Install'

alias gocism-data='cd ~/Documents/Code/cism-data'

# PISM
alias gopism='cd ~/Documents/Code/pism'

export PETSC_DIR='/home/fjk/Documents/Code/petsc-3.5.3'
export PETSC_ARCH='linux_gnu_opt'
export PATH=$PETSC_DIR/$PETSC_ARCH/bin/:$PATH

export PATH=~/pism-dev/bin:$PATH

# ORNL OLCF systems
alias gotitan='ssh kennedy@titan.ccs.ornl.gov' # Cray XK7
alias gorhea='ssh kennedy@rhea.ccs.ornl.gov'   # general purpose cluster
alias goccs='ssh kennedy@home.ccs.ornl.gov'    # general purpose server
alias godtn='ssh kennedy@dtn.ccs.ornl.gov'     # data transfer nodes

# NERSC systems
alias gohopper='ssh kennedyj@hopper.nersc.gov'
alias gocarver='ssh kennedyj@carver.nersc.gov'

# NCAR systems
alias goyellowstone='ssh -X -l kennedy yellowstone.ucar.edu'

# ORNL Desktop
alias godesk='ssh -Y pc0101123.ornl.gov'

# Blizzard
alias goblizzard='ssh -Y blizzard.ornl.gov'

