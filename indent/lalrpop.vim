" Vim indent file
" Language:     LALRPOP Grammar File
" Author:       Roland Fredenhagen <dev@modprog.de>
" Date:         December 11, 2022
" File Types:   lalrpop
" Version:      1
" Notes:        Largely taken from rust.vim's configuration

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal cindent
setlocal cinoptions=L0,(s,Ws,J1,j1,m1,n-4
setlocal cinkeys=0{,0},!^F,o,O,0[,0],0(,0)

" Some preliminary settings
setlocal nolisp		" Make sure lisp indenting doesn't supersede us

let b:undo_indent = "setlocal cindent< cinoptions< cinkeys< lisp<"
