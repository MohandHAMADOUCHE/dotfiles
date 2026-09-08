# Custom zsh aliases

# Use eza for a detailed listing with icons
if command -v eza > /dev/null ; then
  alias ll="eza --icons --group-directories-first -l"
fi

# Restart WSL → Pageant bridge (SSH_AUTH_SOCK)
alias restart='systemctl --user restart wsl2-ssh-pageant-bridge.service'
