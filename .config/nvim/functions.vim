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
