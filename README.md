# dotfiles (for My MacBook)

## Setup

```sh
cd $HOME
xcode-select --install
git clone https://github.com/oneshan/dotfiles.git
cd dotfiles
sh bootstrap.sh
```

## Using duti to script default applications for Macs

```sh
# Get Bundle ID
osascript -e 'id of app "LINE"'

# Set default applications
duti macos/duti.settings
```

## Other manual settings

### Install input methods

On Apple Silicon
```sh
# cask "google-japanese-ime"
open /opt/homebrew/Caskroom/google-japanese-ime/latest/GoogleJapaneseInput.pkg
# cask "mcbopomofo"
open /opt/homebrew/Caskroom/mcbopomofo/2.5/McBopomofoInstaller.app
```

To find where exactly a formula has been installed
```
brew info --cask <formula>
```

### Turn on Magnet & Dropbox

System Preferences > Security & Privacy > Accessibility

### Github Cli

- `gh auth login`
- `gh auth setup-git`

### AWS Cli

- `aws configure`

### Node.js (optional)

```sh
brew install nvm

# Install the current LTS Node.js version
nvm install --lts
```
