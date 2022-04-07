function fish_greeting
    fortune | cowsay -f (ls /usr/share/cowsay/cows | shuf -n 1) | lolcat
end

set -x ANDROID_HOME $HOME/Android/Sdk

set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

function kubectl
    minikube kubectl -- $argv
end

if [ $TILIX_ID ] || [ $VTE_VERSION ]
    bass 'source /etc/profile.d/vte-2.91.sh'
end

if test -e ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

if test -e /home/kwalter/.asdf/installs/rust/1.59.0/env
    bass 'source /home/kwalter/.asdf/installs/rust/1.59.0/env'
end

set -x GOPATH $HOME
# set -x DOTFILES_REPOSITORY ~/src/github.com/kwalter94/dotfiles
set -x EDITOR (which nvim)

if test (cat ~/.config/omf/theme) = 'bobthefish'
    set -g theme_nerd_fonts yes
end
