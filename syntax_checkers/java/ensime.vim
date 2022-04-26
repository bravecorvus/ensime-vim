let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_java_ensime_IsAvailable() dict
    return 1
endfunction

function! SyntaxCheckers_java_ensime_GetLocList() dict
    if exists('b:ensime_notes')
        return b:ensime_notes
    else
        return []
    endif
endfunction

function! SyntaxCheckers_java_ensime_GetHighlightRegex(error)
    if a:error['len']
        let lcol = a:error['col'] - 1
        let rcol = a:error['col'] + a:error['len'] - 1
        let ret = '\%>' . lcol . 'v\%<' . rcol . 'v'
    else
        let ret = ''
    endif

    return ret
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'java',
            \ 'name': 'ensime',
            \ 'exec': '/bin/true'
            \ })

let &cpo = s:save_cpo
unlet s:save_cpo
