function fish_greeting
    fortune | cowsay -f (ls /usr/share/cowsay/cows | shuf -n 1) | lolcat
end

# function bin-install
#     set path $argv[1]
# 
#     function bin-install-error
#         echo "ERROR: $argv[1]"
#         echo "USAGE: bin-install /path/to/file"
# 
#         exit 255
#     end
# 
#     if -z $path
#         error "No file specified for import"
#     end
# 
#     if test ! -f $path
#         error "Path, $path, does not exist"
#     end
#     
#     ln -s $path ~/bin
# end

set -x ANDROID_HOME $HOME/Android/Sdk
if status --is-login
    set -x PATH $PATH $ANDROID_HOME/emulator
    set -x PATH $PATH $ANDROID_HOME/tools
    set -x PATH $PATH $ANDROID_HOME/tools/bin
    set -x PATH $PATH $ANDROID_HOME/platform-tools


    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH $PATH $PYENV_ROOT/bin
end

if [ $TILIX_ID ] || [ $VTE_VERSION ]
    bass 'source /etc/profile.d/vte-2.91.sh'
end

source ~/.asdf/asdf.fish
bass 'source /home/kwalter/.asdf/installs/rust/1.59.0/env'

set -x GOPATH $HOME
set -x DOTFILES_REPOSITORY ~/src/github.com/kwalter94/dotfiles

