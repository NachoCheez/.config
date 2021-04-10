" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

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
Plug 'itchyny/lightline.vim'
Plug 'Kjwon15/vim-transparent'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tomasr/molokai'
Plug 'neovim/pynvim'
Plug 'davidhalter/jedi-vim'
call plug#end()

"colors and autocommands
colo gruvbox 
                                      
set number


" colors for lightline 
" =============================================================================
" Filename: autoload/lightline/colorscheme/molokai.vim
" Author: challsted
" License: MIT License
" Last Change: 2020/02/15 20:57:45.
" =============================================================================

"let s:black = [ '#232526', 233 ]
"let s:gray = [ '#808080', 244 ]
"let s:white = [ '#f8f8f2', 234 ]
"let s:cyan = [ '#66d9ef', 81 ]
"let s:green = [ '#a6e22e', 118 ]
"let s:orange = [ '#ef5939', 166 ]
"let s:pink = [ '#f92672', 161 ]
"let s:red = [ '#ff0000', 160 ]
"let s:yellow = [ '#e6db74', 229 ]

"let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

"let s:p.normal.left = [ [ s:black, s:cyan ], [ s:orange, s:black ] ]
"let s:p.normal.middle = [ [ s:orange, s:black ] ]
"let s:p.normal.right = [ [ s:pink, s:black ], [ s:black, s:pink ] ]

"let s:p.normal.error = [ [ s:pink, s:black ] ]
"let s:p.normal.warning = [ [ s:yellow, s:black ] ]
"let s:p.insert.left = [ [ s:black, s:green ], [ s:green, s:black ] ]
"let s:p.visual.left = [ [ s:black, s:yellow ], [ s:yellow, s:black ] ]
"let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:black ] ]
"let s:p.inactive.left =  [ [ s:pink, s:black ], [ s:white, s:black ] ]
"let s:p.inactive.middle = [ [ s:gray, s:black ] ]
"let s:p.inactive.right = [ [ s:white, s:pink ], [ s:pink, s:black ] ]
"let s:p.tabline.left = [ [ s:pink, s:black ] ]
"let s:p.tabline.middle = [ [ s:pink, s:black] ]
"let s:p.tabline.right = copy(s:p.normal.right)
"let s:p.tabline.tabsel = [ [ s:black, s:pink ] ]

"let g:lightline#colorscheme#molokai#palette = lightline#colorscheme#flatten(s:p)
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
