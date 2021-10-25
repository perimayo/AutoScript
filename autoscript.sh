#!/bin/bash
# Make sure to install zsh and oh-my-zsh first before running script
# sudo apt install zsh -y
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
## IMPORTANT - change user directory at the end of the golang setup section (line 158)
## >> /home/YOURUSERNAME/.zshrc
### 2 repositories will require additional yes prompts due to nature of setup
#### Wireshark will require an additional yes prompt from GUI

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "run this script as root!" && echo
	exit
fi

BLUE "Updating repositories..."
apt update
apt upgrade -y >/dev/null 2>&1
apt dist-upgrade -y >/dev/null 2>&1

GREEN "Cleaning up..."
apt autoremove -y && apt autoclean -y >/dev/null 2>&1

BLUE "Installing curl..."
apt install -y curl >/dev/null 2>&1

BLUE "Installing git..."
apt install -y git >/dev/null 2>&1

BLUE "Installing Python and Dependencies..."
apt install -y python3 >/dev/null 2>&1
apt install -y python3-pip >/dev/null 2>&1
apt install -y build-essential >/dev/null 2>&1
apt install -y build-essential zlib1g zlib1g-dev libpq-dev libpcap-dev libsqlite3-dev ruby ruby-dev >/dev/null 2>&1
apt install -y python3-pil >/dev/null 2>&1
apt install -y python3-setuptools >/dev/null 2>&1
apt install -y python3.9-venv >/dev/null 2>&1
pip3 install requests >/dev/null 2>&1
pip3 install flask >/dev/null 2>&1
pip3 install flask-login >/dev/null 2>&1
pip3 install colorama >/dev/null 2>&1
pip3 install passlib >/dev/null 2>&1
pip3 install pwntools >/dev/null 2>&1
pip3 install netifaces >/dev/null 2>&1
pip3 install iptools >/dev/null 2>&1
pip3 install pyopenssl >/dev/null 2>&1
pip3 install pydispatch >/dev/null 2>&1
pip3 install scapy >/dev/null 2>&1

BLUE "Installing Java..."
#For MobSF to work
apt install default-jre -y >/dev/null 2>&1

BLUE "Installing gnome tweaks..."
apt install gnome-tweaks -y >/dev/null 2>&1

BLUE "Installing neofetch..."
apt install neofetch -y >/dev/null 2>&1

BLUE "Installing fzf-plugin"
apt install fzf -y >/dev/null 2>&1
#add fzf to the plugins array in your zshrc file:
#plugins=(... fzf)

BLUE "Installing httpie zsh plugin..."
apt install httpie -y >/dev/null 2>&1
#add httpie to plugins

BLUE "Installing locate..."
apt install locate -y >/dev/null 2>&1

BLUE "Installing net-tools..."
apt install net-tools >/dev/null 2>&1

BLUE "Installing terminator..."
apt install -y terminator >/dev/null 2>&1

BLUE "Removing boilerplate home directories..."
rmdir Music Pictures Public Templates Videos

BLUE "Installing nmap..."
apt install -y nmap >/dev/null 2>&1

#BLUE "Installing masscan..."
#sudo apt install masscan -y

BLUE "Installing testssl"
apt install testssl.sh -y >/dev/null 2>&1

BLUE "Installing gobuster"
apt install gobuster >/dev/null 2>&1

BLUE "Installing docker..."
apt install apt-transport-https ca-certificates curl software-properties-common -y >/dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update >/dev/null 2>&1
apt install docker-ce -y >/dev/null 2>&1

BLUE "Installing Atom..."
apt install software-properties-common apt-transport-https >/dev/null 2>&1
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
apt update >/dev/null 2>&1
apt install atom -y >/dev/null 2>&1

BLUE "Installing sublime..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt install apt-transport-https >/dev/null 2>&1
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update >/dev/null 2>&1
apt install sublime-text -y >/dev/null 2>&1

BLUE "Installing Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt update && apt install spotify-client -y >/dev/null 2>&1

BLUE "Installing exiftool..."
apt-get install -y exiftool >/dev/null 2>&1

BLUE "Installing sqlite3..."
apt install sqlite3 -y >/dev/null 2>&1

BLUE "Installing sqlitebrowser..."
apt install -y sqlitebrowser >/dev/null 2>&1

BLUE "Installing Tesseract..."
apt install -y tesseract-ocr >/dev/null 2>&1

BLUE "Installing hexedit..."
apt install -y hexedit >/dev/null 2>&1

BLUE "Downloading Webshells..."
git clone https://github.com/BlackArch/webshells.git >/dev/null 2>&1
mv webshells /opt/
cd

BLUE "Installing Go..."
add-apt-repository ppa:longsleep/golang-backports
apt update >/dev/null 2>&1
apt install golang-go -y >/dev/null 2>&1
BLUE "Adding PATH to .zshrc"
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/ADDusername/.zshrc

BLUE "Installing ffuf..."
go get -u github.com/ffuf/ffuf >/dev/null 2>&1

BLUE "Installing amass..."
go get -v github.com/OWASP/Amass/v3/... >/dev/null 2>&1

BLUE "Installing waybackurls..."
go get github.com/tomnomnom/waybackurls >/dev/null 2>&1

BLUE "Installing nikto..."
apt install -y nikto >/dev/null 2>&1

BLUE "Installing hydra..."
apt install libssl-dev libssh-dev libidn11-dev libpcre3-dev libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev firebird-dev libncp-dev -y >/dev/null 2>&1
apt install hydra -y >/dev/null 2>&1

BLUE "Installing ruby..."
apt install ruby-full -y >/dev/null 2>&1

BLUE "Installing wpscan..."
gem install wpscan >/dev/null 2>&1

BLUE "Installing Evil-winrm..."
gem install evil-winrm >/dev/null 2>&1

BLUE "Installing wafw00f..."
apt install -y wafw00f >/dev/null 2>&1

BLUE "Installing whatweb..."
apt install -y whatweb >/dev/null 2>&1

BLUE "Installing John..."
apt update && apt upgrade -y >/dev/null 2>&1
apt install libssl-dev -y >/dev/null 2>&1
git clone https://github.com/openwall/john -b bleeding-jumbo john >/dev/null 2>&1
cd john/src/
./configure >/dev/null 2>&1
make -s clean && make -sj4 >/dev/null 2>&1
cd
mv john /opt/

BLUE "Installing Hashcat..."
apt install hashcat -y >/dev/null 2>&1

BLUE "Installing droopescan..."
pip3 install droopescan >/dev/null 2>&1

BLUE "Installing ZAP..."
echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_21.04/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list
curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_21.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg >/dev/null 2>&1
apt update >/dev/null 2>&1
apt install owasp-zap -y >/dev/null 2>&1

BLUE "Installing sqlmap..."
apt install sqlmap -y >/dev/null 2>&1

BLUE "Installing ike-scan..."
apt install -y ike-scan >/dev/null 2>&1

BLUE "Installing steghide..."
apt install -y steghide >/dev/null 2>&1

BLUE "Installing pdfcrack..."
apt install -y pdfcrack >/dev/null 2>&1

BLUE "Installing fcrackzip..."
apt install -y fcrackzip >/dev/null 2>&1

BLUE "Installing unrar and unzip..."
apt install -y unrar >/dev/null 2>&1
apt install -y unzip >/dev/null 2>&1

BLUE "Installing aircrack-ng..."
apt install -y aircrack-ng >/dev/null 2>&1

BLUE "Installing subfinder..."
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder >/dev/null 2>&1

BLUE "Installing Findomain..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#rustup self uninstall -- if uninstall
$HOME/.cargo/env
apt install -y make >/dev/null 2>&1
apt install perl -y >/dev/null 2>&1
git clone https://github.com/findomain/findomain.git >/dev/null 2>&1
cd findomain
cargo build --release >/dev/null 2>&1
cd
mv findomain /opt/
cd /opt/
cp findomain/target/release/findomain /usr/bin/
cd

BLUE "Downloading linPEAS and winPEAS..."
cd /opt
mkdir privesc
cd privesc
git clone https://github.com/carlospolop/PEASS-ng.git >/dev/null 2>&1
cd PEASS-ng
rm -rf build_lists CONTRIBUTING.md LICENSE README.md parser
cd linPEAS
rm -rf builder images README.md
cd ..
cd winPEAS
rm -rf README.md
cd

BLUE "Downloading Linux Exploit Suggester..."
cd /opt/privesc
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O les.sh >/dev/null 2>&1
cd

BLUE "Installing Kerbrute..."
go get github.com/ropnop/kerbrute >/dev/null 2>&1

BLUE "Installing CrackMapExec..."
python3 -m pip install pipx >/dev/null 2>&1
python3 -m pipx ensurepath --force >/dev/null 2>&1
pipx install crackmapexec >/dev/null 2>&1

BLUE "Installing Chromium Browser..."
snap install chromium >/dev/null 2>&1

BLUE "Installing GoWitness..."
go get -u github.com/sensepost/gowitness >/dev/null 2>&1
mv go /usr/local/

BLUE "Installing searchsploit..."
git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database >/dev/null 2>&1
ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
cp -n /opt/exploit-database/.searchsploit_rc ~/
searchsploit -u >/dev/null 2>&1

BLUE "Installing flameshot..."
apt install flameshot -y >/dev/null 2>&1

BLUE "Installing Notion..."
apt install -y notion >/dev/null 2>&1

BLUE "Installing cmake..."
apt install -y cmake >/dev/null 2>&1

BLUE "Installing shodan..."
pip3 install shodan >/dev/null 2>&1
shodan init 'Add API'

BLUE "Downloading seclists..."
cd /opt
mkdir wordlists
cd wordlists
git clone https://github.com/danielmiessler/SecLists.git >/dev/null 2>&1

BLUE "Downloading Assetnote Wordlists..."
mkdir Assetnote
cd Assetnote
wget https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt >/dev/null 2>&1
wget https://wordlists-cdn.assetnote.io/data/manual/asp_lowercase.txt >/dev/null 2>&1
wget https://wordlists-cdn.assetnote.io/data/manual/aspx_lowercase.txt >/dev/null 2>&1
wget https://wordlists-cdn.assetnote.io/data/manual/php.txt >/dev/null 2>&1
wget https://wordlists-cdn.assetnote.io/data/manual/xml_filenames.txt >/dev/null 2>&1
cd

BLUE "Installing metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall >/dev/null 2>&1

BLUE "Installing objection..."
pip3 install frida-tools >/dev/null 2>&1
pip3 install objection >/dev/null 2>&1

BLUE "Installing MobSF..."
cd /opt
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git >/dev/null 2>&1
cd Mobile-Security-Framework-MobSF
sudo ./setup.sh >/dev/null 2>&1
cd

BLUE "Installing Wireshark..."
apt install -y wireshark
