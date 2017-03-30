" Vim global plugin for cd to a project directory
" Last Change: 2016-04-28 Thu 08:58 PM IST
" Maintainer: juancamilo.nb@gmail.com
" License: https://opensource.org/licenses/MIT

function! s:setProject(projectName)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectPWD = expand('%:p:h')
    let projectsFile = eval( projectsFile[0] )
    let projectsDict = { a:projectName : projectPWD }
    call writefile([string(projectsDict)], glob(projectsFilePath) )
    echo "saved project in " . "\"" . projectPWD . "\"". " as " . "\"" . a:projectName . "\"" 
endfunction

function! s:cdProject(projectName)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectsFile = eval( projectsFile[0] )
    exe "cd" . projectsFile[a:projectName]
    echo "now working in project " . "\"" . a:projectName . "\"" . " in " . "\"" . projectsFile[a:projectName] . "\""
endfunction

function! s:listProjects()
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectsFile = eval( projectsFile[0] )
    echo "projects " . string(keys(projectsFile))
endfunction

function! s:removeProject(projectName)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectsFile = eval( projectsFile[0] )

    unlet projectsFile[a:projectName]
    call writefile([string(projectsFile)], glob(projectsFilePath) )
    echo "removed project " . a:projectName
endfunction

function! s:Completeprojects(ArgLead, CmdLine, CursorPos)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectsFile = eval( projectsFile[0] )


    if len(a:ArgLead) > 0
        let posibles = []
        for item in keys(projectsFile)
            echom item
            echom '\'.a:ArgLead
            echom item =~ string('\'.a:ArgLead)
            if item =~ string('\'.a:ArgLead)
                call add(posibles, item)
            endif
        endfor
        return posibles
    else
        return keys(projectsFile)
    endif
endfunction


command! -nargs=1 Setproject :call <SID>setProject(<f-args>)
command! -nargs=1 -complete=customlist,s:Completeprojects Cdproject :call <SID>cdProject(<f-args>)
command! -nargs=0 Listprojects :call <SID>listProjects()
command! -nargs=1 -complete=customlist,s:Completeprojects Removeproject :call <SID>removeProject(<f-args>)
