let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
Plug 'bling/vim-bufferline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar', { 'on':  'TagbarOpenAutoClose' }


Plug 'prabirshrestha/vim-lsp'

Plug 'ncm2/ncm2'                   " Nvim completion manager
Plug 'ncm2/ncm2-vim-lsp'           " Bridges vim-lsp and ncm2
Plug 'roxma/nvim-yarp'             " Remote plugin framework (needed for NCM2)

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

Plug 'alaviss/nim.nvim'
Plug 'mogelbrod/vim-jsonpath'

call plug#end()

set nofoldenable


" Define mappings for json buffers
au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>

syntax enable
set background=dark

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_diagnostics_float_cursor=1
let g:lsp_diagnostics_float_delay=0
let g:lsp_virtual_text_enabled=1

	" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })

" autocmd User Ncm2Plugin call ncm2#register_source({
" \   'name': 'nim.nvim',
" \   'priority': 9,
" \   'scope': ['nim'],
" \   'mark': 'nim',
" \   'on_complete': {ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> ncm2#complete(ctx, start, candidates)})}
" \})


source ~/.vim/local.vim


