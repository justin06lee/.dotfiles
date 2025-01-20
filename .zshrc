
export PATH="/opt/homebrew/bin:$PATH"
neofetch --ascii ~/.config/neofetch/ascii.txt

for file in ~/.zshconfig/; do
  [ -r "$file" ] && source "$file"
done

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"




