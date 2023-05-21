call plug#begin('~/.local/share/nvim/plugged')

" Bottom bar
Plug 'itchyny/lightline.vim'

" Sidebar
Plug 'dense-analysis/ale' 

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" file tree view
"Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
"Plug 'nvim-tree/nvim-tree.lua'

" vim ledger
Plug 'ledger/vim-ledger'

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" git integrations
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" colour theme
Plug 'folke/tokyonight.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" Emmet for vim
Plug 'mattn/emmet-vim'

" Surround text selector
Plug 'tpope/vim-surround'

" follow system colourscheme
Plug 'vimpostor/vim-lumen'

" discord rich presence
Plug 'andweeb/presence.nvim'

" vimwiki
Plug 'vimwiki/vimwiki'

" focus extensions 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" vim table mode
Plug 'dhruvasagar/vim-table-mode'

" github copilot
Plug 'github/copilot.vim'

" undo tree
Plug 'mbbill/undotree'

" vim-commentary
Plug 'tpope/vim-commentary'

" nvim-colorizer
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
