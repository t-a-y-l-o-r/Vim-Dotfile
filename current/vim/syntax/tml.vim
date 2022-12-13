if exists("b:current_syntax")
  finish
endif


syntax match tag "\%(^\|\s\)\zs\~\w\+"
highlight link tag Keyword

syntax region attributeContainer matchGroup=PreProc start=/\v[(]/ end=/\v[)]/
highlight link attributeContainer Constant

syntax match bracket /[{}]/
highlight link bracket Type

let b:current_syntax = "tml"
