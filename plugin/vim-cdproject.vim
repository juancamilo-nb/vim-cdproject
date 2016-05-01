" Vim global plugin for cd to a project directory
" Last Change: 2016-04-28 Thu 08:58 PM IST
" Maintainer: juancamilo.nb@gmail.com
" License: www.opensource.org/licenses/bsd-license.php

function! s:setProject(projectName)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectPWD = expand('%:p:h')
    let projectsFile = eval( projectsFile[0] )
    let projectsFile[a:projectName] =  projectPWD
    call writefile([string(projectsFile)], glob(projectsFilePath) )
    echo "saved project in " . "\"" . projectPWD . "\"". " as " . "\"" . a:projectName . "\"" 
endfunction

function! s:cdProject(projectName)
    let projectsFilePath = '~/.vim/bundle/vim-cdproject/plugin/projectsfile.vimData'
    let projectsFile = readfile(glob(projectsFilePath))
    let projectsFile = eval( projectsFile[0] )
    exe "lcd" . projectsFile[a:projectName]
    echo " now working in project " . "\"" . a:projectName . "\"" . " in " . "\"" . projectsFile[a:projectName] . "\""
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


command! -nargs=1 Setproject :call <SID>setProject(<f-args>)
command! -nargs=1 Cdproject :call <SID>cdProject(<f-args>)
command! -nargs=0 Listprojects :call <SID>listProjects()
command! -nargs=1 Removeproject :call <SID>removeProject(<f-args>)
