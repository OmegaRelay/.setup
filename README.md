# My Dotfiles/config files

[fireship Tutorial Video](https://youtu.be/r_MpUP6aKiQ "Dotfiles in 100 Seconds on YouTube")

## Steps to bootstrap

1. (*if on MacOs*) Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```


2. Clone repo into new hidden directory.

```zsh
# Use SSH
git clone git@github.com:OmegaRelay/.dotfiles.git
```


3. Create symlinks in the Home directory to the real files in the repo.

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

4. Create a local .gitconfig file named ```.gitconfig-local``` to set any local machine configurations such as users for specific folders, etc...

## TODO List

- Create a bootstrap script.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io/).
)!
