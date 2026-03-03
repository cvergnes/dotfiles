export DOTNET_ROOT=/Users/christophevergnes/.dotnet/
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH=$PATH:$DOTNET_ROOT

. "$HOME/.local/bin/env"

# --- Options de base ---
setopt NO_BEEP              # Désactive le bip
setopt AUTO_CD              # Change automatiquement de répertoire sans 'cd'
setopt CORRECT              # Corrige les commandes mal tapées
setopt INTERACTIVE_COMMENTS # Permet les commentaires dans le shell interactif
setopt NO_CASE_GLOB         # Ignore la casse pour la complétion de fichiers

# --- Historique ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS     # Ignore les doublons dans l'historique
setopt HIST_IGNORE_SPACE    # Ignore les commandes commençant par un espace
setopt HIST_VERIFY          # Affiche la commande avant de l'exécuter
setopt SHARE_HISTORY        # Partage l'historique entre les sessions

# --- Alias utiles ---
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias reload='source ~/.zshrc'

# --- Variables d'environnement ---
export EDITOR='nvim'  # Remplace par ton éditeur préféré (vim, helix, etc.)
export LANG="fr_FR.UTF-8"
export LC_ALL="fr_FR.UTF-8"

# --- Configuration de tmux ---
# Lance tmux au démarrage, sauf si :
# - on est déjà dans une session tmux
# - on est en SSH (pour éviter les problèmes de redirection)
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
    tmux attach -t default || tmux new -s default
fi

# --- Personnalisation du prompt ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'

setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f %F{cyan}%d ${vcs_info_msg_0_}%#%F{white} '
