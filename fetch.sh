#LOCATIONS
EMACSLOCATION=/home/deppy/.emacs.d
UNIXLOCATION=/home/deppy

#copy files
cp -v $EMACSLOCATION/myinit.org emacs/
cp -v $EMACSLOCATION/init.el emacs/
cp -v $UNIXLOCATION/.setup.org unix/
cp -v $UNIXLOCATION/.setup.sh unix/
cp -v $UNIXLOCATION/.bashrc unix/

#list user installed package
dnf list installed > unix/packageinstalled.txt
ls -ltr /opt > unix/softwareinstalled.txt

#compress all emacs file
tar -czf emacs/emacs.tar $EMACSLOCATION 
