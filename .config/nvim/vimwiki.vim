" vimwiki requisites
set nocompatible
filetype plugin on
syntax on

" vimwiki config
let g:vimwiki_list = [{'syntax': 'markdown','ext':'.md'}]

au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/scripts/generate-vimwiki-diary-template.sh '%'
