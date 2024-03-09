# Dotfiles/config files
This repo contains the configuration files, dotfiles and scripts to easily port
my setup to a new machine

## Steps to bootstrap
Currently only Linux (More specifically Ubuntu) operating systems are supported 
with this method of bootstrapping (steps are being taken to make it more 
portable).

### Linux
- Clone the repo
- Run `./scripts/bootstap` to start bootstrapping
- At various steps, prompts will be given to ask whether you want to install 
some items
- Configurations and dotfiles are automatically symbolically linked to the 
location where this repo is (when the bootstrap script is run. This means that:
    - Getting updated configs and scripts is as easy as `git pull`
    - If this repo is moved then the `scripts/create-sym-links.sh` must be run to 
    update the links

To see what exactly is being installed please refer to the install scripts in 
the scripts/install directory

