
" Plug-vim plugins
call plug#begin('~/.config/nvim/plugged')
" :PlugInstall to update :PlugClean to remove

	Plug 'https://github.com/vim-airline/vim-airline.git'
	Plug 'https://github.com/preservim/nerdtree.git'
	Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
	Plug 'https://github.com/ryanoasis/vim-devicons'
"	Plug 'https://github.com/rafi/awesome-vim-colorschemes'
"	Plug 'https://github.com/akinsho/toggleterm.nvim.git'

call plug#end()

"lua require("toggleterm").setup()

noremap <C-t> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFocus<CR>

"colorscheme iceberg

" escape in insert and visual mode
inoremap jj <esc>
vnoremap ;; <esc>

" Coc Tab to confirm completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-Y>" : "\<Tab>"

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Show line numbers
set number
set relativenumber

" Allow use of mouse
set mouse=a

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Replace tabs with spaces
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

