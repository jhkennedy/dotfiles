# grey background for the command prompt
#export PS1="\e[44m\u@\h \w$ \e[m"

###############################################################################
# Useful functions
###############################################################################
if [ ! -z "$ZSH_NAME" ]; then 
    # zsh sets $ZSH_NAME variable so it can be used to detect zsh
    # following enables using bash-completion under zsh
    autoload bashcompinit
    bashcompinit
fi

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

# functions to remember things
function howtee () {
    echo "command > >(tee -a command.out) 2> >(tee -a command.err >&2)"
    echo "see: https://stackoverflow.com/questions/692000"
    echo ""
    echo "To incriment:"
    echo '((t_i++)); command > >(tee -a command_${t_i}.out) 2> >(tee -a command_${t_i}.err >&2)'
}

###############################################################################
# Aliases
###############################################################################
alias which='command -v'

alias act='conda deactivate && conda activate'

alias pytree='tree -I __pycache__'
#alias findcodelines='find ./ -iname "*.py" | xargs wc -l'

# General
alias vim='vim -p'
alias githash='git rev-parse --short HEAD'

# ASF
alias gowork='cd /asfn/daac_scratch/rtc/jhkennedy'
alias gotmp='cd /tmp/jhkennedy'
###############################################################################
# Path Exports
###############################################################################
# Conda 4.4+ reccomended way of enabling conda in bash
. $HOME/miniconda3/etc/profile.d/conda.sh
# BECUASE CONDA IS STUPID!!! See: https://github.com/AnacondaRecipes/aggregate/issues/151
alias fixhost='export HOST=$(hostname)'

# FIX GLib-GIO memory message: https://github.com/conda-forge/glib-feedstock/issues/19 
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# add .local/bin to path
export PATH=${PATH}:${HOME}/.local/bin

###############################################################################
# Github authentication
###############################################################################
export GPG_TTY=$(tty)


###############################################################################
# Because not all ASF machines have zsh, and they don't share $HOME, place this
# in .profile to use zsh on that machine. 
###############################################################################
# export SHELL=`which zsh`
# [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

