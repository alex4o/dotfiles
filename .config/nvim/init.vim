let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on

set number          

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set hidden
set cursorline

call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'stephenway/postcss.vim', { 'for': 'css' }

Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go'
"Plug 'jdkanani/vim-material-theme'
Plug 'flazz/vim-colorschemes'
"
"" work-related
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'slim-template/vim-slim'

" Workflow
Plug 'ciaranm/detectindent'
Plug 'airblade/vim-rooter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'keith/investigate.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'MarcWeber/vim-addon-mw-utils' " for snipmate
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'

" Languages
Plug 'othree/yajs.vim', { 'for': 'js'}
Plug 'plasticboy/vim-markdown'
Plug 'zah/nim.vim', { 'for': 'nim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'lambdatoast/elm.vim'
Plug 'fasterthanlime/ooc.vim', { 'for': 'ooc' }
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
" Integration
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'Gist.vim'
Plug 'ervandew/screen'
Plug 'csexton/jekyll.vim'
"
" Tools
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar', { 'on':  'TagbarOpenAutoClose' }
if isdirectory(expand("$HOME/me/notes"))
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
endif

Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim'
Plug 'taglist.vim'
" Other
Plug 'milkypostman/vim-togglelist'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'sts10/vim-mustard'
"
call plug#end()

" airline conf
"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

syntax enable
set background=dark
colorscheme Kafka

let g:jsx_ext_required = 0
