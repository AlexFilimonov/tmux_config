call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'Yggdroot/indentLine'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab number

let g:PaperColor_Theme_Options = {'theme': {'default': {'transparent_background': 1}}}
colorscheme PaperColor

"vim-airline
let g:airline_theme='papercolor'

"vim-yaml-folds
set foldlevelstart=3

"indetLine
let g:indentLine_color_term=8
