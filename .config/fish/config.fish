function fish_greeting
    fortune | cowsay -f (ls /usr/share/cowsay/cows | shuf -n 1) | lolcat
end

if not contains $HOME/bin $PATH
    set -gx PATH $HOME/bin $PATH 
end

if not set -q ANDROID_HOME
    set -gx ANDROID_HOME $HOME/Android/Sdk

    set -gx PATH $ANDROID_HOME/emulator $PATH 
    set -gx PATH $ANDROID_HOME/tools $PATH 
    set -gx PATH $ANDROID_HOME/tools/bin $PATH 
    set -gx PATH $ANDROID_HOME/platform-tools $PATH 
end

function kubectl
    minikube kubectl -- $argv
end

function poetry-venv-activate
    set venv_path (poetry env info --path)
    set -gx VIRTUAL_ENV_DISABLE_PROMPT true

    source $venv_path/bin/activate.fish
end

function cpp-run
    set program_name (echo $argv[1] | sed -nE 's/(.*)\.(.*)/\1/p')

    g++ -Wall $1 -o $program_name $argv[1]
    chmod +x $program_name

    ./$program_name
end

if [ $TILIX_ID ] || [ $VTE_VERSION ]
    bass 'source /etc/profile.d/vte-2.91.sh'
end

if not which asdf &> /dev/null; and [ -e ~/.asdf/asdf.fish ]
    source ~/.asdf/asdf.fish
end

set -gx GOPATH $HOME
# set -x DOTFILES_REPOSITORY ~/src/github.com/kwalter94/dotfiles
set -gx EDITOR (which nvim)

if [ "(cat ~/.config/omf/theme)" = 'bobthefish' ]
    set -g theme_nerd_fonts yes
end
