" listchars 
" Unicode Characters:
" Tab: {»·, ↹}
" NewLine: {↩, ↲}
set listchars=tab:»·,trail:·,eol:↩,space:·

" line number
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" identation
set autoindent expandtab tabstop=4 shiftwidth=4

" colorcolumn
set colorcolumn=80
