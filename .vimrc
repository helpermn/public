syntax match ciscocomment /^! .*$/
highlight ciscocomment ctermfg=DarkGrey
highlight clear CursorLine
highlight CursorLine ctermfg=none ctermbg=none cterm=underline
map ,p :set cursorline
map ,P :set nocursorline
map ,k :s/^\(.*\)$/! \1/
map ,K :s/^! //
map ,m :set mouse=n
map ,M :set mouse=
map ,f :set foldexpr=getline(v:lnum)[0]==\"!\"\ \&\&\ getline(v:lnum)[1]==\"\ \":set foldmethod=expr
map ,F :set foldexpr=:set foldmethod=manual
