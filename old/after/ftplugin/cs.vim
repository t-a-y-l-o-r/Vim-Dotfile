set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
setlocal colorcolumn=80

" setlocal path=src/**,tests,bin/**
setlocal path=.,**
setlocal wildignore=*/__pycache__/*,*/venv/*,*.pyc


set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

" convert import x into x.py
" and from x import y into x.y.py
function! PyInclude(fileName)
    let parts = split(a:fileName, ' import ')
    let s:left = parts[0]
    if len(parts) > 1
        let s:right = parts[1]
        if s:left == '.' " replace dots with current project folder
            return s:right . '.py'
        endif
        let joined = join([s:left, s:right], '.')
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(s:left, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)

