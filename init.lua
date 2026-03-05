-- =============================================
-- Configuration de base pour Neovim (Markdown + raccourcis Vim)
-- =============================================

-- Activer la coloration syntaxique
vim.cmd('syntax on')

-- Thème clair (ex: 'morning', 'desert', 'zellner')
vim.cmd('colorscheme desert')

-- Numéros de ligne et ligne courante
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true

-- Encodage UTF-8
vim.opt.encoding = 'utf-8'

-- Indentation pour Markdown (2 espaces)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Word wrap (retour à la ligne automatique)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '↪\\'
vim.opt.textwidth = 80
vim.opt.colorcolumn = '80'

-- Recherche incrémentale et ignore la casse
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Défilement fluide
vim.opt.scrolloff = 5

