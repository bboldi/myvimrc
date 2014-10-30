" bboldi/myvimrc file - nothing special

set nocompatible              " be iMproved, required
filetype off                  " required
set background=dark

scriptencoding utf-8
set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'xoria256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'StanAngeloff/php.vim'
Plugin 'godlygeek/tabular'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'joonty/vdebug'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'stephpy/vim-php-cs-fixer'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'rking/ag.vim'
Plugin 'johnhamelink/blade.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

filetype plugin indent on

let mapleader = ","

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>so :so %<CR>
nmap <silent> <leader>rc :!ctags -R<CR>
nmap <silent> <leader>pi :PluginInstall!<CR>
nmap <silent> <leader>o :only<CR>
nmap <silent> <leader>t :TagbarToggle<CR>

nmap <leader>ff :Ag -i -u --php --silent '' .<Left><Left><Left>
nmap <leader>fff :Ag -i -u --silent '' .<Left><Left><Left>
nmap <leader>cu :!./composer.sh update<CR>

nmap <silent> <leader>d :bd<CR>
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>w :w<CR>:SyntasticCheck php<CR>
nmap <silent> <leader>< :10wincmd <<CR>
nmap <silent> <leader>> :10wincmd ><CR>

nmap <silent> <leader>b :CtrlPBuffer<CR>
nmap <silent> <leader>k :tabprevious<CR>
nmap <silent> <leader>j :tabnext<CR>
nmap <silent> <leader>l :bn<CR>
nmap <silent> <leader>h :bp<CR>

autocmd BufWritePre *.php :%s/\s\+$//e
nmap <silent> <leader>ln :set invnumber<CR>

nmap <C-t> :tabnew<CR>
map <C-t> :tabnew<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

if !has("gui_running")
	inoremap <C-@> <C-x><C-o>
endif

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

set t_Co=256

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme xoria256
set nu

" set relativenumber

set hlsearch
let g:gitgutter_enabled = 1
let g:ctrlp_extensions = ['funky']

syntax on

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let g:NERDTreeWinSize = 45
set smartcase
set ignorecase

set incsearch
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --hidden --silent --nocolor -i -g ""'
let g:ctrlp_cmd = 'CtrlPMixed'

nnoremap <CR> :noh<CR><CR>

set list
set listchars=""
set listchars+=tab:\ \ 
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<

set confirm

set backspace=indent,eol,start

set autoindent
" set cindent
" set shiftwidth=4
" set copyindent
set showmatch
" set smartindent

set tabstop=4
set softtabstop=0
set shiftwidth=4
set noexpandtab

set visualbell
set noerrorbells

set nobackup
set noswapfile
set pastetoggle=<F2>
set cursorline

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
set lazyredraw

highlight clear SignColumn
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" set nowrap

let g:syntastic_php_checkers = ['php'] " , 'phpcs', 'phpmd']
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_enable_branch     = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

set wildmenu
nnoremap j gj
noremap k gk

" :set guioptions-=m  "remove menu bar

:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" phpdoc triggers

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>pd :call pdv#DocumentWithSnip()<CR>
vnoremap <leader>pd :call pdv#DocumentWithSnip()<CR>

let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

" YouCompleteMe install

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 0
