command! -nargs=1 CreateFile :call CreateFile(<f-args>)

function! CreateFile(filename)
    let l:current_dir = expand('%:p:h')
    let l:file_path = l:current_dir . '/' . a:filename

    if filereadable(l:file_path)
        echo 'File "' . a:filename . '" already exists.'
    else
        execute 'silent! !touch' fnameescape(l:file_path)
        echo 'File "' . a:filename . '" created successfully.'
    endif
endfunction

" Open current file directory in a new tab
command! OpenFileDirectoryInTab :call OpenCurrentFileDirectoryInTab()

function OpenCurrentFileDirectoryInTab()
    let current_file = expand('%:p')
    let current_directory = fnamemodify(current_file, ':h')
    execute 'tabe' current_directory
endfunction

" Open current file directory in a new split
command! OpenFileDirectoryInSplit :call OpenCurrentFileDirectoryInSplit()

function OpenCurrentFileDirectoryInSplit()
    let current_file = expand('%:p')
    let current_directory = fnamemodify(current_file, ':h')
    execute 'sp' current_directory
endfunction

