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

-- =============================================
-- Configuration spécifique à Markdown
-- =============================================

-- Désactiver l'auto-commentaire pour les nouvelles lignes en Markdown
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.comments = ':#,:b:>,:'
    vim.opt_local.wrap = true
    vim.opt_local.spell = true  -- Correction orthographique (optionnel)
  end,
})

-- =============================================
-- Plugins recommandés (via lazy.nvim)
-- =============================================

-- Installer lazy.nvim (gestionnaire de plugins)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Configurer les plugins
require('lazy').setup({
  -- Coloration syntaxique avancée pour Markdown
  { 'plasticboy/vim-markdown', ft = 'markdown' },

  -- Prévisualisation Markdown en temps réel
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
    config = function()
      vim.g.mkdp_auto_start = 1  -- Ouvrir l'aperçu automatiquement
    end,
  },

  -- Gestion des tables en Markdown
  { 'dhruvasagar/vim-table-mode', ft = 'markdown' },
})

-- =============================================
-- Raccourcis utiles (compatibles VS Code/Rider)
-- =============================================

-- Sauvegarder rapidement
vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = 'Sauvegarder' })

-- Ouvrir l'aperçu Markdown
vim.keymap.set('n', '<Leader>m', ':MarkdownPreview<CR>', { desc = 'Aperçu Markdown' })

-- Basculer entre les fenêtres (comme dans VS Code)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- =============================================
-- Fin de la configuration
-- =============================================

