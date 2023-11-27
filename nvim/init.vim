set encoding=UTF-8
set guifont=FiraCodeNerdFont
set number
syntax on

call plug#begin('~/.config/nvim/plugeed')
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'haishanh/night-owl.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/SyntaxComplete'
Plug 'navarasu/onedark.nvim'
call plug#end()

 "INDENTATION FOR CODE
set shiftwidth=4
set autoindent
set smartindent

"autocommands
autocmd VimEnter * NERDTree
set laststatus=2
" Vim
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
"coc setup
let g:coc_global_extensions = ['coc-json', 'coc-git' , 'coc-html' , 'coc-css', 'coc-java', 'coc-jedi' , 'coc-snippets' , 'coc-tsserver']

"font and symbol configuration
let g:airline_powerline_fonts = 1
 let g:airline#extensions#coc#enabled = 0
 let g:airline#extensions#tabline#enabled = 0
 let g:airline_right_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_left_alt_sep= ''
 let g:airline_left_sep = ''
 let g:airline#extensions#tabline#left_sep = ''
 let g:airline#extensions#tabline#left_alt_sep = ''
 let g:airline_theme='onedark'

