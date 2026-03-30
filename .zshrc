export PATH="/opt/homebrew/bin:$PATH"
neofetch --ascii ~/.config/neofetch/ascii.txt

alias gh="cd ~/Workspace/github.com/justin06lee; ls"

for file in ~/.dotfiles/.zshconfig/.*(.); do
  source "$file"
done

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.turso/env"

source <(git-id _load)
export PATH="$HOME/.local/bin:$PATH"
