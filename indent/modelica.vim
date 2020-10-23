" Vim indent file
" Language:		Modelica
" Maintainer:	Per Östlund
" Last Change:	2009 June 14

if exists("b:did_indent")
	finish
endif

let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetModelicaIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==class,=model,=record,=block,=connector,=function
setlocal indentkeys+=algorithm,=equation,=matchcontinue,=case
setlocal indentkeys+==if,=then,=else,=elseif,=uniontype
setlocal indentkeys+==for,=loop,=when,=elsewhen,=end

if exists("*GetModelicaIndent")
	finish
endif


function! s:GetPrevNoneCommentLineNum(line_num)
	let SKIP_LINES = '^\s*\/\/\|^\s*\/\*'

	let nline = a:line_num
	while nline > 0
		let nline = prevnonblank(nline-1)
		if getline(nline) !~? SKIP_LINES
			break
		endif
	endwhile

	return nline
endfunction

function! s:GetPrevMatchContinue(line_num)
	let nline = a:line_num
	let ends = 0;

	while nline > 0
		if getline(nline) =~ '.*\<\(matchcontinue\)\>'
			break
		endif
		let nline = nline - 1
	endwhile

	return indent(nline)
endfunction

function! GetModelicaIndent(line_num)
	if a:line_num == 0
		return 0
	endif

	let this_codeline = getline(a:line_num)

	if this_codeline =~ '^\s*\*\|^\s*\/'
		return indent(a:line_num)
	endif

	let prev_codeline_num = s:GetPrevNoneCommentLineNum(a:line_num)
	let prev_codeline = getline(prev_codeline_num)
	let ind = indent(prev_codeline_num)

	if this_codeline =~ '^\s*\<\(end\)\>\s*\<\(matchcontinue\)\>'
		return s:GetPrevMatchContinue(a:line_num)
	endif

	if this_codeline =~ '^\s*\(end\)'
		return ind - &shiftwidth
	endif

	if prev_codeline =~ '^\s*\(end\)'
		return ind
	endif

	if this_codeline =~ '^\s*\(case\)'
		return s:GetPrevMatchContinue(a:line_num) + &shiftwidth
	endif

	if prev_codeline =~ '^\s*\(case\)'
		return ind + &sw
	endif

	if this_codeline =~ '^\s*\(then\)'
		return ind - &sw
	endif

	if (this_codeline =~ '^\s*\<\(equation\|algorithm\)\>\s*$' && prev_codeline != '^\s*\(case\)')
		return ind - &sw
	endif

	if prev_codeline =~ '^\s*\<\(equation\|algorithm\|local\)\>\s*$'
		return ind + &sw
	endif

	if prev_codeline =~ '^.*\;'
		return ind
	endif

	if prev_codeline =~ '^.*\<\(class\|model\|record\|block\|connector\|function\|uniontype\|matchcontinue\)\>'
		return ind + &shiftwidth
	endif

	return ind
endfunction
