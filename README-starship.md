# Starship - Configuration personnelle pour serveurs partagés

Configuration Starship personnalisée pour utilisation sur des serveurs de production avec un compte utilisateur partagé.

## Contexte

- Serveur de prod avec un seul compte utilisateur partagé entre plusieurs exploitants
- Besoin d'avoir un affichage personnalisé uniquement pour soi
- Ne pas impacter la configuration du serveur ni les sessions des autres

## Prérequis

1. Installer `starship` sur le serveur (si pas déjà fait)
2. **Ne PAS** ajouter `eval "$(starship init bash)"` dans `~/.bashrc` ou `~/.zshrc`

## Utilisation

### Activer Starship pour votre session uniquement

```bash
export STARSHIP_CONFIG="$HOME/.config/starship-mhd.toml"
eval "$(starship init bash)"   # ou zsh
```

### Désactiver Starship

```bash
exec "$SHELL"
```

## Option : Fichier de configuration personnel

Créez un fichier `~/.bashrc_personal` sur le serveur :

```bash
# ~/.bashrc_personal
export STARSHIP_CONFIG="$HOME/.config/starship-mhd.toml"
eval "$(starship init bash)"
```

### Activation

```bash
source ~/.bashrc_personal
```

### Désactivation

```bash
exec "$SHELL"
```

## Option : Alias pratiques

Ajoutez dans votre `~/.bashrc_personal` :

```bash
alias starship-on='export STARSHIP_CONFIG="$HOME/.config/starship-mhd.toml" && eval "$(starship init bash)"'
alias starship-off='exec "$SHELL"'
```

Utilisation :
```bash
starship-on   # activer
starship-off  # désactiver
```

## Déploiement de la config sur le serveur

1. Copier `starship-mhd.toml` vers le serveur :
   ```bash
   scp starship-mhd.toml user@serveur:~/.config/starship-mhd.toml
   ```

2. (Optionnel) Copier le fichier d'activation personnel :
   ```bash
   scp .bashrc_personal user@serveur:~/.bashrc_personal
   ```

## Notes

- La config par défaut de Starship sera utilisée si aucun fichier n'est spécifié via `STARSHIP_CONFIG`
- Seule votre session sera affectée, les autres utilisateurs du compte partagé ne verront aucun changement
- La config disparaît automatiquement quand vous fermez votre session
