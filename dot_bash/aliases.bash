# Custom bash aliases

# Use eza for a detailed listing with icons, else fallback to ls
if command -v eza > /dev/null ; then
  alias ll="eza --icons --group-directories-first -l"
else
  # Fallback: GNU ls with similar options (no icons)
  alias ll="ls -l --group-directories-first --human-readable"
fi

# kubectl shortcuts (completion `k` wired in ~/.bashrc after kubectl completion)
if command -v kubectl >/dev/null 2>&1; then
  alias k='kubectl'
  alias kg='kubectl get'
  alias kgp='kubectl get pods'
  alias kgd='kubectl get deploy'
  alias kgs='kubectl get svc'
  alias kgn='kubectl get nodes'
  alias kga='kubectl get all'
  alias kd='kubectl describe'
  alias kdp='kubectl describe pod'
  alias kdd='kubectl describe deploy'
  alias kdel='kubectl delete'
  alias kl='kubectl logs'
  alias klf='kubectl logs -f'
  alias kex='kubectl exec -it'
  alias kaf='kubectl apply -f'
  alias kcf='kubectl create -f'
  alias kpw='kubectl get pods --watch'
  alias kdscale='kubectl scale deployment'
  alias kroll_undo='kubectl rollout undo'
  export do="--dry-run=client -o yaml"

  # Generic comfort (no client ns/site names)
  alias kroll='kubectl rollout status deploy'
  alias kpods='kubectl get pods -o wide'
  alias kev='kubectl get events --sort-by=.lastTimestamp'
  kwhere() {
    local ctx ns
    ctx="$(kubectl config current-context 2>/dev/null)"
    ns="$(kubectl config view --minify -o jsonpath='{..namespace}' 2>/dev/null)"
    echo "ctx=${ctx:-?}  ns=${ns:-default}"
  }
fi

# kubectx / kubens short aliases + official Tab completion
if command -v kubectx >/dev/null 2>&1; then
  alias kx='kubectx'
  # shellcheck source=/dev/null
  [[ -f /usr/share/kubectx/completion/kubectx.bash ]] && . /usr/share/kubectx/completion/kubectx.bash
  complete -F _kube_contexts kx
fi
if command -v kubens >/dev/null 2>&1; then
  alias kn='kubens'
  # shellcheck source=/dev/null
  [[ -f /usr/share/kubectx/completion/kubens.bash ]] && . /usr/share/kubectx/completion/kubens.bash
  complete -F _kube_namespaces kn
fi

# Ponytail wrapper for Cursor agent (installé hors chezmoi si présent)
if [[ -x "$HOME/.local/bin/cursor-agent-ponyask" ]]; then
  alias cursor-agent='cursor-agent-ponyask'
  alias agent='cursor-agent-ponyask'
fi

# Restart WSL → Pageant bridge (SSH_AUTH_SOCK)
alias restart='systemctl --user restart wsl2-ssh-pageant-bridge.service'
