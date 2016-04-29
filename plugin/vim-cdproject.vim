" Vim global plugin for cd to a project directory
" Last Change: 2016-04-28 Thu 08:58 PM IST
" Maintainer: juancamilo.nb@gmail.com
" License: www.opensource.org/licenses/bsd-license.php

function! s:cdProject()
    :echo "test"
endfunction
command cdproject :call <SID>cdProject()
