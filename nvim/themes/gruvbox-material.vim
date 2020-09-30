" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

let g:gruvbox_material_transparent_background = 1
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material
