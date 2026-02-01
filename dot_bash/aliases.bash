# Custom bash aliases

# Use eza for a detailed listing with icons, else fallback to ls
if command -v eza > /dev/null ; then
  alias ll="eza --icons --group-directories-first -l"
else
  # Fallback: GNU ls with similar options (no icons)
  alias ll="ls -l --group-directories-first --human-readable"
fi
