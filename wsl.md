## WSL setup instructions

### Installing Ubuntu 20.04 in WSL2

Follow youtube video:
https://www.youtube.com/watch?v=_fntjriRe48

NOTE: it is important to use WSL2 and not WSL1

### Linux GUI via X410

You can try it out using the Free trail from Microsoft Store. I brought it (for $13 because there is a discount right now) after testing it and everything worked fine. Follow the following instructions. 

https://x410.dev/cookbook/wsl/using-x410-with-wsl2/

You will need this to launch pdf (evince), rstudio and etc....

### Github cre

git config --global user.email "Your email"

git config --global user.name "Your Name"

git config --global credential.helper cache

git config --global credential.helper 'cache --timeout=600'

### R.4.0 (for Ubuntu 20.04)

https://rtask.thinkr.fr/installation-of-r-4-0-on-ubuntu-20-04-lts-and-tips-for-spatial-packages/#Install_new_version_of_R_(4_0)

### Rstudio for WSL

Download in windows, move the deb from windows download to linux and then follow the following:
https://linuxconfig.org/how-to-install-rstudio-on-ubuntu-20-04-focal-fossa-linux

