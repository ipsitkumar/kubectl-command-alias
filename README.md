# kubectl-command-alias
This repository contents command shorthands for kubernetes, git and bash.

# Pre-requisites
Please have the following tool installed in your system. 

Mac:
brew install fzf

Ubuntu: 
sudo apt-get install fzf


# Download the alias file to the desired directory
curl -O https://github.com/ipsitkumar/kubectl-command-alias/blob/main/kube_alias.bash
mv kube_alias.bash ~

#Update your .bashrc as follows
. ~/kube_alias.bash
