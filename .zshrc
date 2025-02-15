export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/.cargo/bin:$PATH"
neofetch --ascii ~/.config/neofetch/ascii.txt

for file in ~/.dotfiles/.zshconfig/.*(.); do
  source "$file"
done

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

