" Vim syntax file
" Language: Susan (Template language for Modelica)
" Maintainer: Rickard Lindberg <ricli85@gmail.com>
" Latest Revision: 19 October 2009

if exists("b:current_syntax")
    finish
endif

set nospell

syn sync minlines=50

syn keyword susanKeywords if then else case match

syn match susanComment "//.*"
syn match susanOperator "::="
syn match susanPre "#.*" contains=susanTemplateExp

syn region susanString start=+"+ skip=+\\"+ end=+"+

" Use matchgroup so that susanTemplateExp will not match the tags
syn region susanTemplate matchgroup=susanTemplate start="'" end="'" contains=susanTemplateExp,verbatim
syn region susanTemplate matchgroup=susanTemplate start="<%" end="%>" contains=susanTemplateExp,verbatim

" start, match any < not preceded by \ (see \@<! pattern in doc)
syn region susanTemplateExp start="\\\@<!<" end=">" skip="\\>" contains=susanTemplateExp contained

hi def link susanKeywords Keyword
hi def link susanComment Comment
hi def link susanString String
hi def link susanTemplate Include
hi def link susanTemplateExp Delimiter
hi def link susanOperator Operator
hi def link susanPre Constant

let b:current_syntax = "susan"
