###############################################################################
# Useful functions
###############################################################################
if [ ! -z "$ZSH_NAME" ]; then 
    # zsh sets $ZSH_NAME variable so it can be used to detect zsh
    # following enables using bash-completion under zsh
    autoload bashcompinit
    bashcompinit
fi

# function to open pdfs quietly. 
function pdfo () {
	evince "$1" 2>/dev/null & 
}
complete -f -o plusdirs -X '!*.pdf' pdfo

# function to make a directory and move into it
function gomkdir () {
    mkdir "$1" && cd "$1"
}

function findmytex () {
    eval find "./*(Figures|Tables|Text)/" -iname \"*.tex\" -exec grep --color=always -Hin "$1" {} \\\;
}

# functions to remember things
function howdiffpdf () {
    echo "git show 67d454d:main.flt > old.tex"
    echo "git show ee39374:main.flt > new.tex"
    echo "latexdiff old.tex new.tex > diff.tex"
    echo "pdflatex diff.tex"
}

function howtee () {
    echo "command > >(tee -a $1.out) 2> >(tee -a $1.err >&2)"
    echo "see: https://stackoverflow.com/questions/692000"
    echo ""
    echo "To incriment:"
    echo "((II++)); command > >(tee -a ${1}_\${II}.out) 2> >(tee -a ${1}_\${II}.err >&2)"
}

###############################################################################
# Aliases
###############################################################################
alias which='command -v'

alias nchead='ncdump -h'

alias act='conda deactivate && conda activate'

alias pytree='tree -I __pycache__'
#alias findcodelines='find ./ -iname "*.py" | xargs wc -l'

alias killpycharm='ps -eo command |  awk '\''{ print $1 }'\'' | grep java | xargs killall'

# General
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

# Coding
alias make='make -j 3'
alias gocode='cd $HOME/Documents/Code'
alias godocs='cd $HOME/Documents/Docs'

# Data
alias godata='cd $HOME/Documents/Data'

# NERSC systems
alias gocori='ssh kennedyj@cori.nersc.gov'
alias sshproxy='sshproxy.sh -u kennedyj'

# NCAR systems
alias gocheyenne='ssh -X -l kennedy cheyenne.ucar.edu'

# Argonne's LCRC systems
alias goanvil='ssh -Y -l kennedy blues.lcrc.anl.gov'

# LLNL Systems
alias goacme1='ssh -Y -l kennedy52 acme1.llnl.gov'

###############################################################################
# Path, Envs, and Fixers
###############################################################################
# Conda 4.4+ reccomended way of enabling conda in bash
. $HOME/miniconda3/etc/profile.d/conda.sh
# BECUASE CONDA IS STUPID!!! See: https://github.com/AnacondaRecipes/aggregate/issues/151
alias fixhost='export HOST=$(hostname)'

# FIX GLib-GIO memory message: https://github.com/conda-forge/glib-feedstock/issues/19 
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# add .local/bin to path
export PATH=${PATH}:${HOME}/.local/bin

# Github authentication
export GPG_TTY=$(tty)

###############################################################################
# ASF APD/TOOLS
###############################################################################
export AWS_PROFILE=hyp3-full-access
export S3_PYPI_HOST=hyp3-pypi.s3-website-us-east-1.amazonaws.com
export HYP3_REGISTRY=626226570674.dkr.ecr.us-east-1.amazonaws.com

# ASF Systems
alias goapd='ssh -A apd-dev6.asf.alaska.edu'

function goami () {
    echo "ssh -i ${HOME}/.ssh/${2:-jhkennedy.pem} ${3:-ubuntu}@${1}"
    eval "ssh -i ${HOME}/.ssh/${2:-jhkennedy.pem} ${3:-ubuntu}@${1}"
}

