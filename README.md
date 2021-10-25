# Autoscript (Currently still in development)

Bash script to install essential tools for pentesting. Easy and efficient way to automatically install majority of packages and tools after formatting or getting a new machine. This is for Debian based distros only - not recommended for Kali as some commands will break. This is purely for people using distros like Ubuntu.

Note: Some commands are commented out, please read through script before running and comment out sections not necessary for your workflow.

# Instructions
1. Make sure to install zsh and oh-my-zsh first before running script
```
sudo apt install zsh -y
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
2. IMPORTANT - change user directory at the end of the golang setup section (line 158)
```
>> /home/YOURUSERNAME/.zshrc`
```
3. Three repositories will require additional yes prompts due to the nature of setup
4. Wireshark will require an additional yes prompt from GUI

# Roadmap
- automate yes for oh-my-zsh default shell prompt
- add automation for ENTER prompt when adding repositories
- add yes for wireshark gui prompt
- Layout readme with instructions and tool list
