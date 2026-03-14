" vimwiki requisites
set nocompatible
filetype plugin on
syntax on

" -------------------------
" Basic vimwiki setup
" -------------------------
let g:vimwiki_list = [{
      \ 'path': '~/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md'
      \ }]

" -------------------------
" Avoid conflicts with coc
" -------------------------

" disable all default mappings from vimwiki
let g:vimwiki_key_mappings = { 'all_maps': 0 }

" disable automatic table mappings (they break tab completion)
let g:vimwiki_table_mappings = 0

" disable markdown folding from vimwiki
let g:vimwiki_folding = ''

" -------------------------
" custom minimal mappings
" -------------------------

" follow link
nnoremap <leader>ww :VimwikiFollowLink<CR>

" go back
nnoremap <leader>wb :VimwikiGoBackLink<CR>

" create link
vnoremap <leader>wl :VimwikiNormalizeLink<CR>

" diary
nnoremap <leader>wd :VimwikiDiaryIndex<CR>

" index
nnoremap <leader>wi :VimwikiIndex<CR>


au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/scripts/generate-vimwiki-diary-template.sh '%'
