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

set backspace=indent,eol,start
set autoindent

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden

set selection=exclusive

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar', { 'on':  'TagbarOpenAutoClose' }


Plug 'prabirshrestha/vim-lsp'

Plug 'ncm2/ncm2'                   " Nvim completion manager
Plug 'ncm2/ncm2-vim-lsp'           " Bridges vim-lsp and ncm2
Plug 'roxma/nvim-yarp'             " Remote plugin framework (needed for NCM2)

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'mogelbrod/vim-jsonpath'

source ~/.vim/local.vim

call plug#end()

" Map vim-jsonpath to buffers 

au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>

" Config plugins shouldn't touch

syntax enable
set background=dark
set nofoldenable
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

" Airline Config

let g:airline_theme='owo'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ncm2 autocomplete Config

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" fzf Config

let g:fzf_preview_window = 'right:25%'
map ` :Buffers<cr>
map <C-P> :Commands<cr>
map <C-p> :Files<cr>

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

" autocmd User Ncm2Plugin call ncm2#register_source({
" \   'name': 'nim.nvim',
" \   'priority': 9,
" \   'scope': ['nim'],
" \   'mark': 'nim',
" \   'on_complete': {ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> ncm2#complete(ctx, start, candidates)})}
" \})




