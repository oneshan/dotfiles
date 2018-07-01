# dotfiles

## Getting started

```sh
git clone https://github.com/oneshan/dotfiles.git

# Install/Set up in Macos
cd dotfiles/macos
sh brew.sh
sh utility.sh 

# Install dotfiles
cd dotfiles
sh bootstrap.sh
```

## Using duti to script default applications for Macs

```sh
# Get Bundle ID
osascript -e 'id of app "Typora"'

# Set default applications
duti macos/duti.settings
```
