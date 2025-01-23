export PATH="/opt/homebrew/bin:$PATH"
neofetch --ascii ~/.config/neofetch/ascii.txt


# for file in /home/snau/.dotfiles/.zshconfig/.*(.); do
#   source "$file"
# done

## ZSHRC
alias q='exit'
alias zconfig='v ~/.zshrc'
alias zso='source ~/.zshrc'

## NEOVIM
alias v='nvim'
alias vcfile='cd ~/.config/nvim'
alias vconfig='v ~/.config/nvim'
alias vrem='v ~/.config/nvim/lua/5nsou/core/keymaps.lua'

## TMUX
alias txks='tmux kill-session -t'
alias tas='tmux a -t'

## ARCH LINUX
alias install="sudo pacman -S"
alias update="sudo pacman -Syu"
alias upgrade="sudo pacman -Syu"
alias uninstall="sudo pacman -Rns"
alias search="sudo pacman -Qs"
alias list="sudo pacman -Q"


## YT-DLP
alias download='yt-dlp -f "bestvideo+bestaudio"'


## MISC
alias next-tauri-template='git clone https://github.com/justin-huiyun-lee/tauri-next-template'


# App Dev
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=/Users/justinlee/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platfor

# bun completions
[ -s "/home/snau/.bun/_bun" ] && source "/home/snau/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$HOME/go/bin


# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="%F{green}hacking...%f"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme


# pnpm
export PNPM_HOME="/Users/justinlee/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


