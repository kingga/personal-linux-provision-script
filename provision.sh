# APT Repositories
sudo add-apt-repository universe
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo add-apt-repository -y ppa:openrazer/stable
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main'
rm winehq.key
sudo apt update

# Git
sudo apt install -y git-all

# cURL
sudo apt-get install curl

# SSH
ssh-keygen -t rsa -b 4096 -C "contact@isaacskelton.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# VIM
sudo apt-get install -y vim

# VS Code
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode-installer.deb -4
sudo apt install -y ./vscode-installer.deb
rm vscode-installer.deb

# Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
echo 'export PATH="$PATH:$HOME/.yarn/bin"' >> ~/.bashrc

# NGINX
sudo apt install -y nginx
sudo ufw allow 'Nginx HTTP'

# PHP
sudo apt install -y php7.3-fpm php7.3-common php7.3-mysql php7.3-dom php7.3-mbstring php7.3-zip

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc

# C++
sudo apt-get install -y build-essential

# MySQL
sudo apt-get install -y mysql-server
service mysql start

echo 'Please enter the following things into MySQL:';
echo 'mysql> USE mysql;';
echo "mysql> UPDATE user SET plugin='mysql_native_password' WHERE User='root';";
echo 'mysql> FLUSH PRIVILEGES;';
echo 'mysql> exit;';
sudo mysql -u root

wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.18-1ubuntu19.10_amd64.deb -O mysql-workbench.deb
sudo apt install -y ./mysql-workbench.deb
rm ./mysql-workbench.deb

# Postgresql
sudo apt install -y postgresql postgresql-contrib

# Redis
sudo apt-get install -y redis-server
sudo systemctl enable redis-server.service
sudo apt-get install -y php7.3-redis

sudo echo 'maxmemory 256mb' >> /etc/redis/redis.conf
sudo echo 'maxmemory-policy allkeys-lru' >> /etc/redis/redis.conf
sudo systemctl restart redis-server.service

# Wine
sudo apt install -y --install-recommends winehq-staging winetricks

# Productivity
## Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.1.2-amd64.deb -O slack-installer.deb
sudo apt install -y ./slack-installer.deb
rm ./slack-installer.deb

## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable

## Inkscape (Converting svgs to pngs)
sudo apt-get install -y inkscape

## FileZilla
sudo apt install -y filezilla

## Putty
sudo apt install -y putty

## GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O gitkraken-installer.deb
sudo apt install ./gitkraken-installer.deb
rm ./gitkraken-installer.deb

## WPS Office
wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/8865/wps-office_11.1.0.8865_amd64.deb -O wps-installer.deb
sudo apt install ./wps-installer.deb
rm ./wps-installer.deb

## Colour Picker
sudo apt-get install -y yad

## KeeWeb
wget https://github.com/keeweb/keeweb/releases/download/v1.12.3/KeeWeb-1.12.3.linux.x64.deb -O ./keeweb-installer.deb
sudo apt install ./keeweb-installer.deb
rm ./keeweb-installer.deb

## Lightshot
wget http://app.prntscr.com/build/setup-lightshot.exe
wine ./setup-lightshot.exe
rm setup-lightshot.exe

## MusicBee (Wine)
# winetricks dotnet20
# winetricks dotnet40
winetricks dotnet461
winetricks xmllite
wget https://www.mediafire.com/file/lcsgyppojc43o0p/MusicBeeSetup_3_3_Update1.zip/file -O musicbee.zip
unzip musicbee.zip -d musicbee
rm musicbee.zip
cd musicbee
mbinstaller=$(ls -t | head -n1)
wine start $mbinstaller
cd ../
rm -rf musicbee

## qBittorrent
sudo apt install -y qbittorrent

## Razer
sudo apt install -y openrazer-meta
sudo gpasswd -a isaacske plugdev

## VLC
sudo snap install vlc

# NPM / Yarn Packages
## Vue CLI
yarn global add @vue/cli@latest

## Composer
composer global require phpunit/phpunit laravel/installer

# Create Folder Structure
## Functions
function create_language_directories() {
    if [ ! -d ./C++ ]; then
        mkdir C++
    fi
    
    if [ ! -d ./PHP ]; then
        mkdir PHP
    fi
    
    if [ ! -d ./JS ]; then
        mkdir JS
    fi
    
    if [ ! -d ./Scripts ]; then
        mkdir Scripts
    fi
}

function create_document_directories() {
    if [ ! -d ./Word ]; then
        mkdir Word
    fi
    
    if [ ! -d ./Powerpoint ]; then
        mkdir Powerpoint
    fi
    
    if [ ! -d ./Spreadsheet ]; then
        mkdir Spreadsheet
    fi
}

## Documents
cd ~/Documents

if [ ! -d ./Development ]; then
    mkdir Development
fi

if [ ! -d ./Work ]; then
    mkdir Work
fi

if [ ! -d ./Personal ]; then
    mkdir Personal
fi

cd ~/Documents/Work
create_document_directories
cd ~/Documents/Personal
create_document_directories

### Development
cd ~/Documents/Development

if [ ! -d ./Work ]; then
    mkdir Work
fi

if [ ! -d ./Personal ]; then
    mkdir Personal
fi

if [ ! -d ./Tests ]; then
    mkdir Tests
fi

cd ~/Documents/Development/Work
create_language_directories
cd ~/Documents/Development/Personal
create_language_directories
cd ~/Documents/Development/Tests
create_language_directories
