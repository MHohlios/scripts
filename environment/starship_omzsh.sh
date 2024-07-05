#/bin/bash
if [ `id -u` -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi

#Install dependencies
apt-get update
apt-get install curl
apt-get install zsh
apt-get install git

#Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

#Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "" -f

#Backup .zshrc file
mv ~/.zshrc ~/.zshrc.bak

#Create new .zshrc file
echo 'ZSH="/home/harshith/.oh-my-zsh"' > ~/.zshrc
echo '' > ~/.zshrc
echo '#Theme' > ~/.zshrc
echo 'ZSH_THEME=""' > ~/.zshrc
echo '' > ~/.zshrc
echo '#Plugins' > ~/.zshrc
echo 'plugins=(git zsh-autosuggestions)' > ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' > ~/.zshrc
echo '' > ~/.zshrc
echo '#Starship' > ~/.zshrc
echo 'eval "$(starship init zsh)"' > ~/.zshrc

#Source .zshrc
echo 'Installation complete!'
echo 'Please run "source ~/.zshrc"'