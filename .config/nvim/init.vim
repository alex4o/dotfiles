let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

syntax on

set number          
set showcmd
set incsearch
set nocompatible

set nobackup
set hlsearch
set modeline

set backspace=indent,eol,start
set autoindent

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden

set selection=exclusive
" I give up on not using the mouse
set mouse=a

set spell spelllang=en_us

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'doums/darcula'
Plug 'joshdick/onedark.vim'
" Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar', { 'on':  'TagbarOpenAutoClose' }


Plug 'prabirshrestha/vim-lsp'

Plug 'ncm2/ncm2'                   " Nvim completion manager
Plug 'ncm2/ncm2-vim-lsp'           " Bridges vim-lsp and ncm2
Plug 'roxma/nvim-yarp'             " Remote plug-in framework (needed for NCM2)

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" JSON lang support
Plug 'mogelbrod/vim-jsonpath'
" JSX syntax hightlight support
Plug 'maxmellon/vim-jsx-pretty'

Plug 'editorconfig/editorconfig-vim'

Plug 'huawenyu/vimgdb'

source ~/.vim/local.vim

call plug#end()

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
	color darcula
	hi! Normal ctermbg=NONE guibg=NONE
	hi! NonText ctermbg=NONE guibg=NONE
	hi! LineNr ctermbg=NONE guibg=NONE
endif


" Load luajit part
lua require('init')

" Go to the last position of the opened file
autocmd BufReadPost * exe "normal '\""

" Map vim-jsonpath to buffers 

au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>

" Config plugins shouldn't touch

syntax enable
set background=dark
set nofoldenable
map <C-PageUp> :bn<CR>
map <C-PageDown> :bp<CR>

" Airline config

let g:airline_theme='owo'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" git-gutter
let g:gitgutter_sign_allow_clobber = 1
autocmd VimEnter * :GitGutterLineNrHighlightsEnable

" ncm2 autocomplete Config

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" fzf Config
let g:fzf_layout = { 'window': { 'yoffset': 0.1, 'width': 0.9, 'height': 0.7 } }
" let $FZF_DEFAULT_OPTS="--ansi"
let g:fzf_preview_window = 'right:50%'
map ` :Buffers<cr>
map <C-S-P> :Commands<cr>
map <C-p> :GFiles<cr>

" Lsp Config

let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_diagnostics_float_cursor=1
let g:lsp_diagnostics_float_delay=0
let g:lsp_virtual_text_enabled=1


" Lsp Clangd Config

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'typescript-language-server',
		\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
		\ 'whitelist': ['javascript', 'javascript.jsx'],
		\ })
endif

" autocmd User Ncm2Plugin call ncm2#register_source({
" \   'name': 'nim.nvim',
" \   'priority': 9,
" \   'scope': ['nim'],
" \   'mark': 'nim',
" \   'on_complete': {ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> ncm2#complete(ctx, start, candidates)})}
" \})




