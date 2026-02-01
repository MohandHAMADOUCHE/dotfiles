# Custom zsh aliases

# Use eza for a detailed listing with icons
if command -v eza > /dev/null ; then
  alias ll="eza --icons --group-directories-first -l"
fi
