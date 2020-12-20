#WARNING: TO BE RUN IN THE MAIN DIRECTORY OF GIT!

#source location
source globals.cfg

#install packages
packages=$(awk '{print $1}' unix/packageinstalled.txt)
sudo dnf install $packages

#copy all setups
cp -v emacs/myinit.org $EMACSLOCATION
cp -v emacs/init.el $EMACSLOCATION
cp -v unix/.setup.org $UNIXLOCATION
cp -v unix/.setup.sh $UNIXLOCATION
cp -v unix/.bashrc $UNIXLOCATION

tar -xzvf emacs/emacs.tar --directory $EMACSLOCATION
exit
