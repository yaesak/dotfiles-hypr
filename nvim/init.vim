"// PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'folke/tokyonight.nvim'
Plug 'turbio/bracey.vim'
Plug 'Exafunction/codeium.vim'
call plug#end()


"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline_theme = 'tokyonight'
"let g:airline_powerline_fonts = 1
syntax on
"colorscheme monokai_pro

"let g:python3_host_prog = '/usr/bin/python3'
"let g:python_host_prog = '/usr/bin/python3'
let g:loaded_youcompleteme = 1
"let g:denops#deno = '/bin/deno'
set laststatus=2
let g:lightline = { 'colorscheme': 'tokyonight' }
syntax on
colorscheme tokyonight-moon
runtime! ./keymap.rc.vim

