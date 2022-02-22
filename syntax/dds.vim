" Vim synntax file
" Language:	DDS

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn match ddsSpec /^.\{5}[A]/hs=e-1 contained

" C-specs...
syn match ddsNotInd1 /^.\{8}/hs=s+7 contained contains=ddsSpec
syn match ddsInd1 /^.\{8}.\{1,2}/hs=s+8 contained contains=ddsNotInd1
syn match ddsNotInd2 /^.\{10}.\{1,1}/hs=s+10 contained contains=ddsInd1
syn match ddsInd2 /^.\{11}.\{1,2}/hs=s+11 contained contains=ddsNotInd2
syn match ddsNotInd3 /^.\{13}.\{1,1}/hs=s+13 contained contains=ddsInd2
syn match ddsInd3 /^.\{14}.\{1,2}/hs=s+14 contained contains=ddsNotInd3
syn match ddsNameType /^.\{16}.\{1,1}/hs=s+16 contained contains=ddsInd3
syn match ddsName /^.\{18}.\{1,10}/hs=s+18 contained contains=ddsNameType
syn match ddsRef /^.\{28}.\{1,1}/hs=s+28 contained contains=ddsName
syn match ddsLen /^.\{29}.\{1,5}/hs=s+29 contained contains=ddsRef
syn match ddsDataType /^.\{34}.\{1,1}/hs=s+34 contained contains=ddsLen
syn match ddsDecPos /^.\{35}.\{1,2}/hs=s+35 contained contains=ddsDataType
syn match ddsUse /^.\{37}.\{1,1}/hs=s+37 contained contains=ddsDecPos
syn match ddsLine /^.\{38}.\{1,3}/hs=s+38 contained contains=ddsUse
syn match ddsColumn /^.\{41}.\{1,3}/hs=s+41 contained contains=ddsLine
syn match ddsFunction /^.\{44}.*/hs=s+44 contained contains=ddsColumn
syn match ddsAspec /^.\{5}A[^*].*$/ transparent contains=@ddsAspecGroup

syn cluster ddsAspecGroup contains=ddsFunction,ddsColumn,ddsLine,
            \ddsUse,ddsDecPos,ddsDataType,ddsLen,ddsRef,ddsName,
	    \ddsNameType,ddsInd3,ddsInd2,ddsInd1

" Until further implemented...

syn match ddsComment /^.\{6}\*.*$/

highlight link ddsSpec operator
highlight link ddsNotInd1 boolean
highlight link ddsNotInd2 boolean
highlight link ddsNotInd3 boolean
highlight link ddsInd1 conditional
highlight link ddsInd2 conditional
highlight link ddsInd3 conditional
highlight link ddsNameType special
highlight link ddsName type
highlight link ddsRef special
highlight link ddsLen function
highlight link ddsDataType type
highlight link ddsDecPos delimiter
highlight link ddsUse keyword
highlight link ddsLine function
highlight link ddsColumn special
highlight link ddsFunction function
highlight link ddsComment comment
