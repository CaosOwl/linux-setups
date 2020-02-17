# enviroment variables
#+BEGIN_SRC bash
export EDITOR="emacs -nw -q"
#+END_SRC  
# variables
#+BEGIN_SRC bash
CODE=/home/deppy/polybox/PhD/code
UTILITY=~/polybox/PhD/code/c++/utilities
SIMDIR=/home/deppy/workdir/na64-tools/geant4/simulation/examples
ORGDIR=/home/deppy/polybox/PhD/org_files
TEMPLATEDIR=/home/deppy/polybox/PhD/code/c++/templates
BACKUPDIR=/home/deppy/BackupDisk/Analysis2018
SAMPLEDIR=/home/deppy/BackupDisk/Analysis2018/sample/2018samples
TESTDIR=/home/deppy/BackupDisk/Analysis2018/test
DATA=/run/media/deppy/DATA
ANAL=/home/deppy/workdir/Analysis2018/na64analysis
DEV=/home/deppy/workdir/scratch/p348-daq/p348reco
RECO=/home/deppy/workdir/Analysis2018/reco-daq/p348reco
SCRATCH=/home/deppy/workdir/scratch
DM=/home/deppy/workdir/DarkMatter
NOTEDIR=/home/deppy/polybox/PhD/notes
PRESDIR=/home/deppy/polybox/PhD/presentation
SKRIPTDIR=/home/deppy/workdir/skripts
COOLDIR=/home/deppy/workdir/p348-daq/coral/src/coool
PCPOSETH5=edepero@pcposeth5.dhcp.phys.ethz.ch
ESSOS=deperoe@essos1.ethz.ch
MMCLUSDIR=$ESSOS:/mnt/raid/groups/mm-clustering/data
DUMP=deperoe@essos2:/mnt/storage/deperoe/backup
PKEY=/home/deppy/.ssh/serverkey_openssh
SSHPORT=6674
MYSERVER=caosowl@akashas.ddns.net
SERVERBACKUPDIR=/home/caosowl/mountpoint/backups/backup
NOTES=/home/deppy/workdir/na64-papers
#SOFTWARE DIRECTORIES
GEANTDIR=/opt/Geant/geant4.10.05
ROOTDIR=/opt/ROOT/root-6.16.00
SOFTWARES=$HOME/softwares
#PHD THESIS
THESIS=$HOME/workdir/edepero-phdthesis
#+END_SRC
# connections
#+BEGIN_SRC bash
alias euler="ssh -tY deperoe@euler.ethz.ch"
alias myserver="ssh -i $PKEY -p $SSHPORT $MYSERVER"
alias monchjanka="ssh -tY jankag@ela.cscs.ch ssh -Y jankag@monch.cscs.ch"
alias monchcarl="ssh -tY carlosvh@ela.cscs.ch ssh -Y carlosvh@monch.cscs.ch"
alias daq="ssh -Y daq@pcdmrc01.cern.ch"
alias daq2="ssh -tY edepero@lxplus.cern.ch && ssh -Y daq@pcdmrc01.cern.ch"
#force ipV4, CERN for some reason is blocking ipV6
alias cern="ssh -4 -Y edepero@lxplus.cern.ch"
alias docommand="$SKRIPTDIR/DoCommand.sh"
alias essos1="ssh -Y deperoe@essos1.ethz.ch"
alias essos2="ssh -Y deperoe@essos2.ethz.ch"
alias essos3="ssh -Y deperoe@essos3.ethz.ch"
alias essos4="ssh -Y deperoe@essos4.ethz.ch"
alias physes="ssh -Y positron@physes.dhcp.phys.ethz.ch"
alias pcposeth5="ssh -Y edepero@pcposeth5.dhcp.phys.ethz.ch"
alias cmspc="ssh -Y pixel@192.33.101.223"
alias pixel="ssh -Y edepero@128.141.148.144"
alias caen="ssh -Y edepero@128.141.41.240"
alias wincern="xfreerdp -u edepero -d CERN -g '89%' cernts.cern.ch"
alias compasspc="xfreerdp -u dcs -d pccompass010 -g '89%' pccompass010.dyndns.cern.ch" #compass pc with slow control
#+END_SRC
# commands
#+BEGIN_SRC bash
alias megasource="source $HOME/.bashrc"
alias vemacs="emacs -nw -q"
alias ls='ls -ltr --color=auto'
alias root='root -l'
alias megacat="cat ~/.setup.org"
alias vemacs="emacs -nw -q"
alias visetup="emacs -nw $HOME/.setup.org"
alias vimacs="emacs -nw $HOME/.emacs.d/myinit.org"
alias mymount="sshfs edepero@pcposeth5.dhcp.phys.ethz.ch:/home/edepero/Data/ $HOME/mountpoint"
alias unmount="sudo umount $HOME/mountpoint"
alias sn="systemctl poweroff -i"
alias rn="shutdown -r 0"
alias lock="gnome-screensaver-command -l"
alias pushsync="rsync -A --no-perms -avz -e 'ssh -p $SSHPORT -i $PKEY' --delete --progress /home/deppy/BackupDisk/dhcp-192-033-102-176.ethz.ch $MYSERVER:$SERVERBACKUPDIR"
alias openserver="systemctl start sshd"
alias closeserver="systemctl stop sshd"
alias update="sudo dnf update"
#softwares command
alias menus="$SOFTWARES/mensa-menus/menus"
#commands to work with unify tools
alias unifylist="sudo ~/bin/ltunify list"
alias unifypair="sudo ~/bin/ltunify pair"
#command to show variables
alias shownet="echo -e '\033[0;31m LIST OF AVAIABLE CONNECTIONS: \033[m' && sed -n '/connections/,/#+END/p' $HOME/.setup.org"
alias showgit="echo -e '\033[0;31m LIST OF AVAIABLE GIT REPOSITORIES: \033[m' && sed -n '/git/,/#+END/p' $HOME/.setup.org"
alias showvar="echo -e '\033[0;31m LIST OF ALL DEFINED VARIABLES: \033[m' && sed -n '/variables/,/#+END/p' $HOME/.setup.org"
alias showcommand="echo -e '\033[0;31m LIST OF ALL DEFINED COMMANDS: \033[m' && sed -n '/commands/,/#+END/p' $HOME/.setup.org"
alias showfunctions="echo -e '\033[0;31m LIST OF ALL DEFINED FUNCTIONS: \033[m' && sed -n '/function/,/#+END/p' $HOME/.setup.org"
#+END_SRC
# function
#+BEGIN_SRC bash#

#open two files in emacs diff mode
ediff () { emacs -nw -eval "(ediff-files \"$1\" \"$2\")" ; }

mysinc () { rsync -avze 'ssh -i $PUBKEY -p $SSHPORT' --delete $1 $MYSERVER:/home/caosowl/mountpoint/backups/; }

#extract only part of pdf needed
pdfextract () { filename=$1 && pdfseparate -f $2 -l $3 $filename "dummy_%d.pdf" && targets=$(eval echo "dummy_"{$2..$3}".pdf") && echo $targets && pdfunite $targets ${filename%.#}"_extract.pdf" && rm $targets; }

#copy using git has as tag plus a custom one
cptag () { cp -v $1 $2"_$3_"$(git rev-parse HEAD);}

#compress using tar
tarcompress () { tar -czvf $1 $2;}

#+END_SRC
# git repository
#+BEGIN_SRC bash
alias clonedaq="git clone https://gitlab.cern.ch/P348/p348-daq.git && cd p348-daq/ && ./build.sh && cd -"
alias cloneanal="git clone https://gitlab.ethz.ch/XBosonVis/na64analysis"
#+END_SRC
# python
#+BEGIN_SRC bash
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/deppy/.anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/deppy/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/deppy/.anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/deppy/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#+END_SRC
# julia
#+BEGIN_SRC bash
alias julia="/opt/Julia/julia-1.0.2/bin/julia"
#+END_SRC
# root
#+BEGIN_SRC bash
source $ROOTDIR/install/bin/thisroot.sh
#+END_SRC
# geant
#+BEGIN_SRC bash
source "$GEANTDIR/install/bin/geant4.sh"
#+END_SRC
