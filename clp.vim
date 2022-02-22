" Vim syntax file
" Language:	Control Language (CLP), based on clp.vim
" Maintainer:	Thomas Geulig <geulig@nentec.de>
" Last Change:	2001 May 2
" URL:		http://sites.netscape.net/sharpPeople/vim/syntax/clp.vim
"            or http://www.crosswinds.net/~vimuser/vim/syntax/clp.vim
"
" Special Thanks to Dan Sharp <dwsharp@hotmail.com> for comments and additions
" (and providing the webspace)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" A Keyword is the first symbol in a clause.  A clause begins at the start
" of a line or after a semicolon.  THEN, ELSE, OTHERWISE, and colons are always
" followed by an implied semicolon.
syn match clpClause "\(^\|;\|:\|then \|else \|otherwise \)\s*\w\+" contains=ALL

" Considered keywords when used together in a phrase and begin a clause
syn match clpKeyword contained "\<signal\( on \(error\|failure\|halt\|notready\|novalue\|syntax\|lostdigits\)\(\s\+name\)\=\)\=\>"
syn match clpKeyword contained "\<signal off \(error\|failure\|halt\|notready\|novalue\|syntax\|lostdigits\)\>"
syn match clpKeyword contained "\<call off \(error\|failure\|halt\|notready\)\>"
syn match clpKeyword contained "\<parse \(upper \)\=\(arg\|linein\|pull\|source\|var\|value\|version\)\>"
syn match clpKeyword contained "\<numeric \(digits\|form \(scientific\|engineering\|value\)\|fuzz\)\>"
syn match clpKeyword contained "\<\(address\|trace\)\( value\)\=\>"
syn match clpKeyword contained "\<procedure\( expose\)\=\>"
syn match clpKeyword contained "\<do\( forever\)\=\>"

" Another keyword phrase, separated to aid highlighting in clpFunction
syn match clpKeyword2 contained "\<call\( on \(error\|failure\|halt\|notready\)\(\s\+name\)\=\)\=\>"

" Considered keywords when they begin a clause
syn match clpKeyword contained "\<\(do\|enddo\|chgvar\|pgm\|if\|endpgm\|monmsg\|dcl\|dclf\)\>"
syn match clpKeyword contained "\<\(chkobj\|pull\|push\|queue\|return\|say\|select\|trace\)\>"

" Conditional phrases
syn match clpConditional "\(^\s*\| \)\(to\|by\|for\|until\|while\|then\|when\|otherwise\|else\)\( \|\s*$\)" contains=ALLBUT,clpConditional
syn match clpConditional contained "\<\(to\|by\|for\|until\|while\|then\|when\|else\|otherwise\)\>"

" Assignments -- a keyword followed by an equal sign becomes a variable
syn match clpAssign "\<\w\+\s*=\s*" contains=clpSpecialVariable

" Functions/Procedures
syn match clpFunction	"\<\h\w*\(/\*\s*\*/\)*("me=e-1 contains=clpComment,clpConditional,clpKeyword
syn match clpFunction	"\<\(arg\|trace\)\(/\*\s*\*/\)*("me=e-1
syn match clpFunction	"\<call\( on \(error\|failure\|halt\|notready\)\(\s\+name\)\=\)\=\>\s\+\w\+\>" contains=clpKeyword2

" String constants
syn region clpString	  start=+"+ skip=+\\\\\|\\'+ end=+"+
syn region clpString	  start=+'+ skip=+\\\\\|\\"+ end=+'+
syn match  clpCharacter  +"'[^\\]'"+

" Catch errors caused by wrong parenthesis
syn region clpParen transparent start='(' end=')' contains=ALLBUT,clpParenError,clpTodo,clpUserLabel,clpKeyword
syn match clpParenError	 ")"
syn match clpInParen		"[\\[\\]{}]"

" Comments
syn region clpComment		start="/\*" end="\*/" contains=clpTodo,clpComment
syn match  clpCommentError	"\*/"

syn keyword clpTodo contained	TODO FIXME XXX

" Highlight User Labels
syn match clpUserLabel		 "\<\I\i*\s*:"me=e-1

" Special Variables
syn keyword clpSpecialVariable  sigl rc result
syn match   clpCompoundVariable "\<\w\+\.\w*\>"

if !exists("clp_minlines")
  let clp_minlines = 10
endif
exec "syn sync ccomment clpComment minlines=" . clp_minlines

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_clp_syn_inits")
  if version < 508
    let did_clp_syn_inits = 1
    command -nargs=+ highlight link hi link <args>
  else
    command -nargs=+ highlight link hi def link <args>
  endif

  highlight link clpUserLabel		Function
  highlight link clpCharacter		Character
  highlight link clpParenError		clpError
  highlight link clpInParen		clpError
  highlight link clpCommentError	clpError
  highlight link clpError		Error
  highlight link clpKeyword		Statement
  highlight link clpKeyword2		clpKeyword
  highlight link clpFunction		Function
  highlight link clpString		String
  highlight link clpComment		Comment
  highlight link clpTodo		Todo
  highlight link clpSpecialVariable	Special
  highlight link clpConditional	clpKeyword

  delcommand highlight link
endif

let b:current_syntax = "clp"

"vim: ts=8
