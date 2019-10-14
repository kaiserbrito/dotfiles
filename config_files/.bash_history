git config --global color.ui true
git config --global user.name "Victor Guerra"
git config --global user.email "victorbcguerra@gmail.com"
ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"
ssh-keygen -t rsa -b 4096 -C "victorbcguerra@gmail.com"
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo docker run hello-world
cd Downloads/
ls
sudo tar zxf redis-5.0.2.tar.gz
ls
cd redis-5.0.2/
ls
make
cd ..
sudo rm -rf redis-5.0.2
tar zxf redis-5.0.2.tar.gz
cd redis-5.0.2/
make
ls
cd ..
ls
cd mongodb-src-r3.6.12/
ls
mkdir -p /data/db
mkdir /data
cd
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
export HTTP_PROXY=http://proxy.conseur.org:3128

curl -sSL https://get.rvm.io | bash -s stable
export HTTP_PROXY=http://proxy.conseur.org:3128
export HTTPS_PROXY=http://proxy.conseur.org:3128
export http_proxy=http://proxy.conseur.org:3128
export https_proxy=http://proxy.conseur.org:3128
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.5.3 -n rg302 --rubygems 3.0.2
gem install bundler
gem install teamocil
gem install teamocil rubocop
sudo apt install zsh
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo apt-key fingerprint 0EBFCD88
docker run hello-world
docker run --help
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
