# enviroment variables
#+BEGIN_SRC bash
export EDITOR="emacs -nw -q"
#+END_SRC  
# variables
#+BEGIN_SRC bash
  CODE=$HOME/polybox/PhD/code
  UTILITY=~/polybox/PhD/code/c++/utilities
  SIMDIR=$HOME/workdir/na64-tools/geant4/simulation/examples
  ORGDIR=$HOME/polybox/PhD/org_files
  TEMPLATEDIR=$HOME/polybox/PhD/code/c++/templates
  BACKUPDIR=~/BackupDisk/my-linux-backup
  SAMPLEDIR=$HOME/BackupDisk/AnalysisDir/sample/2018samples
  TESTDIR=$HOME/BackupDisk/AnalysisDir/test
  DATA=/run/media/deppy/DATA
  ANAL=$HOME/workdir/AnalysisDir/na64analysis
  DEV=$HOME/workdir/scratch/p348-daq/p348reco
  RECO=$HOME/workdir/AnalysisDir/reco-daq/p348reco
  SCRATCH=$HOME/workdir/scratch
  DM=$HOME/workdir/DarkMatter
  NOTEDIR=$HOME/polybox/PhD/notes
  PRESDIR=$HOME/polybox/PhD/presentation
  SKRIPTDIR=$HOME/workdir/skripts
  COOLDIR=$HOME/workdir/p348-daq/coral/src/coool
  PCPOSETH5=edepero@pcposeth5.dhcp.phys.ethz.ch
  ESSOSHOST=deperoe@essos1.ethz.ch
  ESSOSSTORAGE=/mnt/storage/deperoe/visible-mode-2021
  TMSTORAGE=/mnt/raid/groups/muon-mode-2021/true-muonium/simulation-data/reco
  ESSOS=$ESSOSHOST:$TMSTORAGE
  MMCLUSDIR=$ESSOS:/mnt/raid/groups/mm-clustering/data
  DUMP=deperoe@essos2:/mnt/storage/deperoe/backup
  PKEY=~/.ssh/serverkey_caosowl
  SSHPORT=6626
  MYSERVER=caosowl@akashas.ddns.net
  SERVERBACKUPDIR=/mnt/my-linux-backup
  RESTICPATH="sftp://$MYSERVER:$SSHPORT/$SERVERBACKUPDIR/restic-backup"
  BACKUPTARGET=/home/bubidi
  NOTES=$HOME/workdir/na64-papers
  #SOFTWARE DIRECTORIES
  GEANTDIR=/opt/Geant/geant4.10.05
  ROOTDIR=/opt/root/root-v6-22-00/root_install
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
#hooks to the web digitizer tool
alias webdigitizer="/opt/WebPlotDigitizer/WebPlotDigitizer-4.2-linux-x64/WebPlotDigitizer-4.2"
#+END_SRC
# commands
#+BEGIN_SRC bash
  alias megasource="source $HOME/.bashrc"
  alias vemacs="emacsclient -nw"
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
  alias pushsync="rsync -A --no-perms -avz -e 'ssh -p $SSHPORT -i $PKEY' --delete --progress $BACKUPDIR $MYSERVER:$SERVERBACKUPDIR"
  alias openserver="systemctl start sshd"
  alias closeserver="systemctl stop sshd"
  alias update="sudo dnf update"
  alias dobackup="cd $HOME/.backupbox-phys/ && bash ./restic-run.sh && source restic-env && restic snapshots && cd -"
  alias domybackup="restic backup $BACKUPTARGET -r $RESTICPATH"
  alias looksnapshots="restic -r $RESTICPATH snapshots"
  alias startcool="$RECO/../coral/src/coool/src/coool -map $RECO/../maps -group $RECO/../coral/src/coool/monitor/groups.xlm -geom $RECO/../coral/src/coool/lstrack/detectors.dat"
  #softwares command
  alias menus="$SOFTWARES/mensa-menus/menus"
  #commands to work with unify tools
  alias unifylist="sudo ~/bin/ltunify list"
  alias unifypair="sudo ~/bin/ltunify pair"
  #commands with btrfs
  alias take-snapshot="sudo btrfs subvolume snapshot -r /home /.snapshots/home-$(date +%Y%m%d)"
  #command to show variables
  alias shownet="echo -e '\033[0;31m LIST OF AVAIABLE CONNECTIONS: \033[m' && sed -n '/connections/,/#+END/p' $HOME/.setup.org"
  alias showgit="echo -e '\033[0;31m LIST OF AVAIABLE GIT REPOSITORIES: \033[m' && sed -n '/git/,/#+END/p' $HOME/.setup.org"
  alias showvar="echo -e '\033[0;31m LIST OF ALL DEFINED VARIABLES: \033[m' && sed -n '/variables/,/#+END/p' $HOME/.setup.org"
  alias showcommand="echo -e '\033[0;31m LIST OF ALL DEFINED COMMANDS: \033[m' && sed -n '/commands/,/#+END/p' $HOME/.setup.org"
  alias showfunctions="echo -e '\033[0;31m LIST OF ALL DEFINED FUNCTIONS: \033[m' && sed -n '/function/,/#+END/p' $HOME/.setup.org"
  alias wonderdraft="/opt/Wonderdraft/Wonderdraft-1.1.1.4-Linux64nd/Wonderdraft.x86_64"
#+END_SRC
# function
#+BEGIN_SRC bash#

#start typical program needed in the startup
myinit () { thunderbird & firefox & emacs & update & nautilus; }

#open two files in emacs diff mode
ediff () { emacs -nw -eval "(ediff-files \"$1\" \"$2\")" ; }

#synchronize this on my server
syncthis () { rsync -avze 'ssh -i ~/.ssh/serverkey_caosowl -p 6626' --delete --progress $1 caosowl@akashas.ddns.net:/mnt/my-linux-backup; }

#extract only part of pdf needed
pdfextract () { filename=$1 && pdfseparate -f $2 -l $3 $filename "dummy_%d.pdf" && targets=$(eval echo "dummy_"{$2..$3}".pdf") && echo $targets && pdfunite $targets ${filename%.#}"_extract.pdf" && rm $targets; }

#copy using git has as tag plus a custom one
cptag () { cp -v $1 $2"_$3_"$(git rev-parse HEAD);}

#count and output word frequency in a file WITHOUT all the numbers
wordscount () { cat $1  | sed 's/[[:digit:]]\+//g' | tr -s ' ' '\n' | sort | uniq -c | sort -r | awk '{print $1, $2}'; }

#count and output word frequency in a file WITH all the numbers
numberscount () { cat $1  | sed 's/^[[0-9]]\+//g' | tr -s ' ' '\n' | sort | uniq -c | sort -r | awk '{print $1, $2}'; }

#compress using tar
tarcompress () { tar -czvf $1 $2;}

#decompress tar.gz
targzdecompress () { tar -xzvf $1; }

#+END_SRC
# git repository
#+BEGIN_SRC bash
alias clonedaq="git clone https://gitlab.cern.ch/P348/p348-daq.git && cd p348-daq/ && ./build.sh && cd -"
alias cloneanal="git clone https://gitlab.ethz.ch/XBosonVis/na64analysis"
#+END_SRC
# python
## Standard python
   #+begin_src bash
   
   alias python="/usr/bin/python3"
   alias ipython="/usr/bin/ipython"

   #+end_src   
# julia
#+BEGIN_SRC bash
#switched off for now, using standard
#+END_SRC
# COMMENT root
  #+BEGIN_SRC bash
    source $ROOTDIR/bin/thisroot.sh
  #+END_SRC
# COMMENT geant
#+BEGIN_SRC bash
  #source "$GEANTDIR/install/bin/geant4.sh"
#+END_SRC
