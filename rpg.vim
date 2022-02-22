" Vim synntax file
" Language:	RPG

syn case ignore

syn match rpgSpec /^.\{5}[HFELICO]/hs=e-1 contained

" C-specs...
syn match rpgNotInd1 /^.\{9}/hs=s+8 contained contains=rpgSpec
syn match rpgInd1 /^.\{9}.\{1,2}/hs=s+9 contained contains=rpgNotInd1
syn match rpgNotInd2 /^.\{11}.\{1,1}/hs=s+11 contained contains=rpgInd1
syn match rpgInd2 /^.\{12}.\{1,2}/hs=s+12 contained contains=rpgNotInd2
syn match rpgNotInd3 /^.\{14}.\{1,1}/hs=s+14 contained contains=rpgInd2
syn match rpgInd3 /^.\{15}.\{1,2}/hs=s+15 contained contains=rpgNotInd3
syn match rpgFactor1 /^.\{17}.\{1,10}/hs=s+17 contained contains=rpgInd3
syn match rpgOpcode /^.\{27}.\{1,5}/hs=s+27 contained contains=rpgFactor1
syn match rpgFactor2 /^.\{32}.\{1,10}/hs=s+32 contained contains=rpgOpcode
syn match rpgResult /^.\{42}.\{1,6}/hs=s+42 contained contains=rpgFactor2
syn match rpgResultLen /^.\{48}.\{1,3}/hs=s+48 contained contains=rpgResult
syn match rpgResultDP /^.\{51}.\{1,1}/hs=s+51 contained contains=rpgResultLen
syn match rpgResultExt /^.\{52}.\{1,1}/hs=s+52 contained contains=rpgResultDP
syn match rpgResultInd /^.\{53}.\{1,6}/hs=s+53 contained contains=rpgResultExt
syn match rpgTailComment /^.\{59}.*/hs=s+59 contained contains=rpgResultInd
syn match rpgCspec /^.\{5}C[^*].*$/ transparent contains=@rpgCspecGroup

syn cluster rpgCspecGroup contains=rpgTailComment,rpgResultInd,rpgResultExt,
            \rpgResultDP,rpgResultLen,rpgResult,rpgFactor2,rpgOpcode,rpgInd3,
	    \rpgInd2,rpgInd1

" Until further implemented...
syn match rpgOtherSpec /^.\{5}[HFIELO][^*].*$/ contains=rpgSpec

syn match rpgComment /^.\{6}\*.*$/

syn match rpgInline /^.\{6}[/+].*$/

syn region rpgData start=/^\*\* / end=/\Z/

highlight link rpgCode operator
highlight link rpgSpec operator
highlight link rpgNotInd1 boolean
highlight link rpgNotInd2 boolean
highlight link rpgNotInd3 boolean
highlight link rpgInd1 conditional
highlight link rpgInd2 conditional
highlight link rpgInd3 conditional
highlight link rpgFactor1 type
highlight link rpgOpcode keyword
highlight link rpgFactor2 special
highlight link rpgResult function
highlight link rpgResultLen number
highlight link rpgResultDP delimiter
highlight link rpgResultExt keyword
highlight link rpgResultInd function
highlight link rpgTailComment comment
highlight link rpgComment comment
highlight link rpgInline function
highlight link rpgData comment
