" vimrc Congifuration (Not upto Date)

" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Returns true if the color hex value is light
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction

" Set the background color for Gruvbox
let g:background_color = '#282828'

" Load the Gruvbox color scheme using Vundle
Plugin 'morhetz/gruvbox'

" End Vundle setup
call vundle#end()

" Enable filetype detection, plugins, and indentation
filetype plugin indent on

" Set Vim background to dark
set background=dark

" Set your color scheme (e.g., gruvbox)
colorscheme gruvbox

" Other configurations...

" Set the number of spaces for a tab
set tabstop=2

" Set the number of spaces used for autoindenting
set shiftwidth=4

" Convert tabs to spaces
set expandtab

" Enable auto-indentation
set autoindent

" Enable smart indenting
set smartindent

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Enable incremental search
set incsearch

" Show line numbers relative to the current line
set relativenumber

" Enable mouse support
set mouse=a

" Enable filetype-specific indenting
filetype plugin indent on

" Disable filetype detection (repeated line)
filetype off

" Use the system clipboard for copy/paste (imp)
set clipboard=unnamedplus

" Enable spell checking and set text width to 80
setlocal spell textwidth=80

" Enable syntax highlighting
syn on

" Set cursor style on InsertEnter
autocmd InsertEnter * set guicursor=n-v-c:block-Cursor/lCursor-blinkon0

" Reset cursor style on InsertLeave
autocmd InsertLeave * set guicursor=

" Autocommands for C++ files

" Tab for compiling and run C++ files (saves time)
autocmd FileType cpp nnoremap <Tab> :w<CR>:!chmod +x ~/scripts/build.sh && ~/scripts/build.sh %:r<CR>

" (run) for executing C++ files
autocmd FileType cpp nnoremap run :w<CR>:!./%:r<CR>
