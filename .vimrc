" =============================================
" Configuration de base pour la lisibilité
" =============================================

" Activer la coloration syntaxique
syntax on

" Thème clair (ex: 'desert' ou 'morning')
" Pour voir les thèmes disponibles : `ls /usr/share/vim/vim*/colors/`
colorscheme desert

" Numéros de ligne
set number

" Encodage UTF-8 (pour les caractères spéciaux en Markdown)
set encoding=utf-8

" Indentation pour Markdown (2 espaces)
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Mise en évidence de la ligne courante
set cursorline

" Défilement fluide
set scrolloff=5

" Recherche incrémentale et ignore la casse
set incsearch
set ignorecase
set smartcase

set wrap

set clipboard=unnamedplus
