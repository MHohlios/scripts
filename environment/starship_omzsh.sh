#/bin/bash
if [ `id -u` -eq 0 ]
  then echo Please do not run this scirpt as root!
  exit
fi
#Install dependencies
echo "Installing dependencies..."
sudo apt-get -qq update
sudo apt-get -qq install curl zsh git

#Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Install Starship
echo "Installing Starship..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "" -f

#Backup .zshrc file
echo "Backing up .zshrc file..."
mv ~/.zshrc ~/.zshrc.bak

#Create new .zshrc file
echo 'ZSH="$HOME/.oh-my-zsh"' > ~/.zshrc
echo '' >> ~/.zshrc
echo '#Theme' >> ~/.zshrc
echo 'ZSH_THEME=""' >> ~/.zshrc
echo '' >> ~/.zshrc
echo '#Plugins' >> ~/.zshrc
echo 'plugins=(git zsh-autosuggestions)' >> ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
echo '' >> ~/.zshrc
echo '#Starship' >> ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

#Source .zshrc
echo 'Installation complete!'
echo `Please run "chsh -s $(which zsh)"'
echo 'Please run "source ~/.zshrc"'
