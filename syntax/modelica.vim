" Vim syntax file
" Language: Modelica
" Maintainer: Per Östlund
" Latest Revision: 13 June 2009

if exists("b:current_syntax")
	finish
endif

syn keyword modelicaStored			within final
syn keyword modelicaImport			import

syn keyword modelicaClassDefinition	class model record block connector type 
syn keyword modelicaClassDefinition package function uniontype 
syn keyword modelicaClassSpecifier	encapsulated partial expandable extends replaceable 
syn keyword modelicaClassSpecifier	constrainedby redeclare inner outer subtypeof
syn keyword modelicaClassVisibility	public protected
syn keyword modelicaTypePrefix		type flow stream discrete parameter constant input output
syn keyword modelicaTypeAttribute	start fixed nominal
syn keyword modelicaEndDefinition	end

syn keyword modelicaLogicOp			not and or
syn keyword modelicaType			  Real Integer Boolean String enumeration tuple Option
syn match modelicaType          "list\(<\)\@="
syn match modelicaType          "array\(<\)\@="
syn match modelicaType          "Mutable\(<\)\@="
syn match modelicaType          "Pointer\(<\)\@="
syn keyword modelicaIntrinsicOp abs	sign sqrt div mod rem ceil floor integer
syn keyword modelicaIntrinsicOp	sin cos tan asin acos atan atan2 sinh cosh tanh exp log log10
syn keyword modelicaIntrinsicOp	der delay cardinality semiLinear assert terminate
syn keyword modelicaArrayOp			ndims size scalar vector matrix identity diagonal 
syn keyword modelicaArrayOp			zeros ones fill linspace min max sum product
syn keyword modelicaArrayOp			transpose outerProduct symmetric cross skew cat
syn keyword modelicaEventOp			initial terminal noEvent smooth sample pre edge change reinit
syn match modelicaMetaBuiltin   "list\((\)\@="
syn match modelicaMetaBuiltin   "array\((\)\@="
syn match modelicaMetaBuiltin   "Mutable\(\.\)\@="
syn match modelicaMetaBuiltin   "Pointer\(\.\)\@="
syn keyword modelicaMetaBuiltin listReverse threaded

syn keyword modelicaStatement		break return

syn keyword modelicaConditional		if then else elseif
syn keyword modelicaFor				for while loop in
syn keyword modelicaWhen			when elsewhen
syn keyword modelicaConnect			connect
syn keyword modelicaMatch			matchcontinue match case as guard try
syn keyword modelicaSection			algorithm equation local
syn keyword modelicaEquality  equality failure

syn keyword modelicaTime			time

syn case ignore
syn match	modelicaNumbers	display transparent "\<\d\|\.\d" contains=modelicaInteger,modelicaReal
syn match	modelicaNumbersCom	display contained transparent "\<\d\|\.\d" contains=modelicaInteger,modelicaReal
syn match	modelicaInteger		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"

syn match	modelicaReal		display contained "\d\+f"
syn match	modelicaReal		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
syn match	modelicaReal		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match	modelicaReal		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

syn keyword modelicaBoolean			true false

syn match modelicaFlag "Flags\.\zs\(\u\|\d\|_\)\{2,}"

syn match modelicaSingleComment +//.*$+ contains=TODOs
syn match modelicaMultiComment "\/\*\_.\{-}\*\/" contains=modelicaNumbersCom,TODOs

syn match modelicaSpecialCharacter +\\[\'\"?\\abfnrtv]+
syn region modelicaString start=+"+ excludenl end=+"+ contains=modelicaSpecialCharacter

syn region modelicaAnnotation start=+\sannotation\s*(+ excludenl end=+)\s*;+ fold

syn keyword TODOs   TODO FIXME

hi def link modelicaStored				Keyword
hi def link modelicaImport				PreProc

hi def link modelicaClassDefinition 	Identifier
hi def link modelicaClassSpecifier		Keyword
hi def link modelicaClassVisibility		Keyword
hi def link modelicaTypePrefix			Keyword
hi def link modelicaTypeAttribute		Keyword
hi def link modelicaEndDefinition		Keyword

hi def link modelicaType				Type
hi def link modelicaLogicOp				Keyword
hi def link modelicaIntrinsicOp			Keyword
hi def link modelicaArrayOp				Keyword
hi def link modelicaEventOp				Keyword
hi def link modelicaMetaBuiltin   Keyword

hi def link modelicaStatement			Statement

hi def link modelicaConditional			Keyword
hi def link modelicaFor					Keyword
hi def link modelicaWhen				Keyword
hi def link modelicaConnect				Keyword
hi def link modelicaMatch				Keyword
hi def link modelicaSection				Keyword
hi def link modelicaEquality    Keyword

hi def link modelicaTime				Keyword
hi def link modelicaInteger				Number
hi def link modelicaReal				Number
hi def link modelicaBoolean				Number

hi def link modelicaFlag            Keyword

hi def link modelicaSingleComment		Comment
hi def link modelicaMultiComment		Comment
hi def link modelicaString				String

hi def link modelicaAnnotation Comment
hi def link TODOs   Todo

syn sync match modelicaEnv groupthere NONE "^\s*end"

"exec "syntax sync minlines=50"
exec "set foldmethod=syntax"
let b:current_syntax = "modelica"