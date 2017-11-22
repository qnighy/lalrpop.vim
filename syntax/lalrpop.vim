" Vim syntax file
" Language:     LALRPOP Grammar File
" Author:       Masaki Hara <ackie.h.gmai@gmail.com>
" Date:         November 22, 2017
" File Types:   lalrpop
" Version:      1
" Notes:
"

" Setup
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

setlocal iskeyword=_,a-z,A-Z,48-57

" Case-sensitive
syn case match

syn include @Rust syntax/rust.vim

syn region lalrpopComment start="//" end="$"

syn keyword lalrpopKeyword grammar
syn keyword lalrpopPub pub nextgroup=lalrpopIdentifierContained skipwhite skipempty
syn keyword lalrpopUse use nextgroup=lalrpopModPath skipwhite skipempty
syn keyword lalrpopKeyword enum extern match else if type where for
syn keyword lalrpopStorage mut
syn match lalrpopOperator "[!=~<>+*?]\|->\|@[LR]"
syn match lalrpopOperator "=>@[LR]"

syn region lalrpopSemantics start="=>?\?" end="[])}]\@=\|[,;]" contains=@Rust

syn match lalrpopModPath "\w\+\%(::[^<]\)\@="
syn match lalrpopModPathSep "::"

syn match lalrpopSigil "&"

syn region lalrpopRegex start=+r###"+ end=+"###+
syn region lalrpopRegex start=+r##"+ end=+"##+
syn region lalrpopRegex start=+r#"+ end=+"#+
syn region lalrpopRegex start=+r"+ end=+"+

syn region lalrpopString start=+"+ skip=+\\.+ end=+"+
syn region lalrpopIdentifier start=+`+ end=+`+
syn match lalrpopLifetime display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
syn match lalrpopChar +'[^\\]'+
syn match lalrpopChar +'\[^']\+'+

syn match lalrpopIdentifierContained "\w\+" contained
syn match lalrpopIdentifier "^\w\+"

syn region lalrpopAttribute start="#!\?\[" end="\]" contains=rustString,rustDerive,rustCommentLine,rustCommentBlock,rustCommentLineDocError,rustCommentBlockDocError

" Now we can link them with predefined groups.
hi def link lalrpopIdentifierContained lalrpopIdentifier
hi def link lalrpopUse lalrpopKeyword
hi def link lalrpopPub lalrpopKeyword
hi def link lalrpopKeyword Keyword
hi def link lalrpopOperator Operator
hi def link lalrpopStorage StorageClass
hi def link lalrpopSigil StorageClass
hi def link lalrpopIdentifier Identifier
hi def link lalrpopString String
hi def link lalrpopRegex String
hi def link lalrpopLifetime Special
hi def link lalrpopComment Comment
hi def link lalrpopModPath Include
hi def link lalrpopModPathSep Delimiter
hi def link lalrpopAttribute PreProc

" Mark the buffer as highlighted.
let b:current_syntax = "lalrpop"
