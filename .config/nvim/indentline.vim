" disable conceal for markdown and json
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0

let g:indentLine_setColors = 1
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'

"" Disable the conceal feature
" let g:indentLine_setConceal = 0

" config to work with vimwiki
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

" disable indentLine for man pages
autocmd FileType man IndentLinesDisable
autocmd FileType help IndentLinesDisable
