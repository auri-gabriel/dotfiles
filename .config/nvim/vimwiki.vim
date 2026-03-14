" =========================
" Vimwiki requirements
" =========================
set nocompatible
filetype plugin on
syntax on

" =========================
" Basic Vimwiki setup
" =========================
let g:vimwiki_list = [{
      \ 'path': expand('~/vimwiki/'),
      \ 'syntax': 'markdown',
      \ 'ext': '.md'
      \ }]

" =========================
" Avoid conflicts with coc.nvim
" =========================

" disable all default mappings from vimwiki
let g:vimwiki_key_mappings = { 'all_maps': 0 }

" disable table mappings (they conflict with <Tab>)
let g:vimwiki_table_mappings = 0

" disable folding (let treesitter/markdown handle it)
let g:vimwiki_folding = ''

" =========================
" Custom minimal mappings
" =========================

" open wiki index
nnoremap <leader>wi :VimwikiIndex<CR>

" follow link
nnoremap <leader>ww :VimwikiFollowLink<CR>

" go back
nnoremap <leader>wb :VimwikiGoBackLink<CR>

" create link from visual selection
vnoremap <leader>wl :VimwikiNormalizeLink<CR>

" open diary index
nnoremap <leader>wd :VimwikiDiaryIndex<CR>

" create today's diary note
nnoremap <leader>wn :VimwikiMakeDiaryNote<CR>

" =========================
" Vimwiki specific autocmds
" =========================
augroup vimwiki_custom
  autocmd!
  
  " diary template
  autocmd BufNewFile ~/vimwiki/diary/*.md silent 0r !~/.config/nvim/scripts/generate-vimwiki-diary-template.sh '%'

  " nicer markdown conceal
  autocmd FileType vimwiki setlocal conceallevel=2

augroup END

