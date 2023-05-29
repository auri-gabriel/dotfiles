" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Listchars
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" " Reset the space key
" noremap <Space> <Nop>
" " Map space to the leader key
" map <Space> <Leader>
" let g:mapleader = " "

" Map leader + y to copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Search and replace with word under the cursor, case-insensitive, and visually select the result
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Move selected lines down in visual mode
vnoremap J :m '>+1<CR>gv=gv
" Move selected lines up in visual mode
vnoremap K :m '<-2<CR>gv=gv

" Make the current file executable
nnoremap <leader>x :!chmod +x %<CR>

" Source the current file
nnoremap <leader><leader> :so <C-R>=expand("%")<CR><CR>
