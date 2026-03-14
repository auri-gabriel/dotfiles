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
" Diary index auto-update
" =========================
function! s:AddDiaryEntry(filepath)
  " Extract YYYY-MM-DD from filename
  let l:date = fnamemodify(a:filepath, ':t:r')
  if l:date !~# '^\d\{4}-\d\{2}-\d\{2}$'
    return
  endif

  let l:parts   = split(l:date, '-')
  let l:year    = l:parts[0]
  let l:mon_num = str2nr(l:parts[1])
  let l:months  = ['January','February','March','April','May','June',
        \ 'July','August','September','October','November','December']
  let l:mon_name = l:months[l:mon_num - 1]

  let l:index = expand('~/vimwiki/diary/diary.md')
  let l:link  = '- [' . l:date . '](' . l:date . ')'

  if !filereadable(l:index)
    return
  endif

  let l:lines = readfile(l:index)

  " Idempotent: bail out if the entry is already present
  if index(l:lines, l:link) >= 0
    return
  endif

  let l:year_h  = '## ' . l:year
  let l:month_h = '### ' . l:mon_name

  " ---- Locate year section ----
  let l:year_idx = -1
  for l:i in range(len(l:lines))
    if l:lines[l:i] ==# l:year_h
      let l:year_idx = l:i
      break
    endif
  endfor

  if l:year_idx < 0
    " Year not found: insert a new year/month/entry block, years descending
    let l:ins = len(l:lines)
    for l:i in range(1, len(l:lines) - 1)
      if l:lines[l:i] =~# '^## \d\{4}$'
        if str2nr(l:year) > str2nr(matchstr(l:lines[l:i], '\d\{4}'))
          let l:ins = l:i
          break
        endif
      endif
    endfor
    call extend(l:lines, ['', l:year_h, '', l:month_h, '', l:link], l:ins)
    call writefile(l:lines, l:index)
    return
  endif

  " ---- Find next year boundary ----
  let l:next_year = len(l:lines)
  for l:i in range(l:year_idx + 1, len(l:lines) - 1)
    if l:lines[l:i] =~# '^## '
      let l:next_year = l:i
      break
    endif
  endfor

  " ---- Locate month section within year ----
  let l:month_idx = -1
  for l:i in range(l:year_idx + 1, l:next_year - 1)
    if l:lines[l:i] ==# l:month_h
      let l:month_idx = l:i
      break
    endif
  endfor

  if l:month_idx < 0
    " Month not found: insert new month/entry block, months descending
    let l:ins = l:year_idx + 1
    if l:ins < len(l:lines) && l:lines[l:ins] ==# ''
      let l:ins += 1
    endif
    for l:i in range(l:year_idx + 1, l:next_year - 1)
      if l:lines[l:i] =~# '^### '
        let l:m = index(l:months, matchstr(l:lines[l:i], '^### \zs.*')) + 1
        if l:mon_num > l:m
          let l:ins = l:i
          break
        endif
      endif
    endfor
    call extend(l:lines, ['', l:month_h, '', l:link], l:ins)
    call writefile(l:lines, l:index)
    return
  endif

  " ---- Month exists: insert entry in date-descending order ----
  let l:ins = l:month_idx + 1
  if l:ins < len(l:lines) && l:lines[l:ins] ==# ''
    let l:ins += 1
  endif
  for l:i in range(l:ins, l:next_year - 1)
    if l:lines[l:i] =~# '^- \['
      if l:date >? matchstr(l:lines[l:i], '\d\{4}-\d\{2}-\d\{2}')
        let l:ins = l:i
        break
      endif
      let l:ins = l:i + 1
    elseif l:lines[l:i] =~# '^###\|^##\|^#'
      let l:ins = l:i
      break
    endif
  endfor

  call insert(l:lines, l:link, l:ins)
  call writefile(l:lines, l:index)
endfunction

" =========================
" Vimwiki specific autocmds
" =========================
augroup vimwiki_custom
  autocmd!

  " diary template
  autocmd BufNewFile ~/vimwiki/diary/*.md silent 0r !~/.config/nvim/scripts/generate-vimwiki-diary-template.sh '%'

  " update diary index when a new diary note is created
  autocmd BufNewFile ~/vimwiki/diary/*.md call s:AddDiaryEntry(expand('<afile>:p'))

  " nicer markdown conceal
  autocmd FileType vimwiki setlocal conceallevel=2

augroup END

let g:vimwiki_global_ext = 0

