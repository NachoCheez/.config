"This is the nvim theme for dracula config.  

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
syntax on
" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1


" vim plug configuration
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Kjwon15/vim-transparent'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
call plug#end()

"colors and autocommands
colo onedark
                                      
set number

"font and symbol configuration
let g:airline_powerline_fonts = 1
 let g:airline#extensions#coc#enabled = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline_right_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_left_alt_sep= ''
 let g:airline_left_sep = ''
 let g:airline#extensions#tabline#left_sep = ''
 let g:airline#extensions#tabline#left_alt_sep = ''
 let g:airline_theme='onedark'
