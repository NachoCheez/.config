
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Kjwon15/vim-transparent'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'emacs-eclim/emacs-eclim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
call plug#end()


"colors and autocommands
set number
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
 let g:airline_theme='one'


colo one



let g:EclimFileTypeValidate = 1
autocmd VimEnter * NERDTree | wincmd p

"INDENTATION FOR CODE
set shiftwidth=4
set autoindent
set smartindent


"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark
