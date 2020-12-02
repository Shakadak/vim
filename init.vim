set nocompatible              " be iMproved, required

call plug#begin()
" General
Plug 'altercation/vim-colors-solarized'

" Language Client
Plug 'neovim/nvim-lspconfig'
" Haskell Language Server config down below [HLScdb]

" Rust
Plug 'rust-lang/rust.vim'

" Plug 'idris-hackers/idris-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}

" Reason
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

"Put your custom Vim configuration here

"Better command completion
"set wildmenu
"set wildmode=list:longest

" Required for operations modifying multiple buffers like rename.
set hidden

"Show current line
"set cursorline

syntax enable
syntax on
filetype on
set number
"set cursorline
"set cuc
"set mouse=a
set expandtab
set tabstop=4
set shiftwidth=4
"au BufWinEnter * let w:m2=matchadd('Tab', '\t', -1)
"au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
"set list listchars=tab:▸\ ,trail:·
"syn match LowVisibilityBraces display '[{}]'

"highlight Tab ctermbg=darkgreen
"highlight Space ctermbg=darkred
"hi LowVisibilityBraces ctermbg=darkgreen

"set term=screen-256color
"set t_ut=
"set t_Co=256
set background=light
let g:solarized_termcolors=256
colorscheme solarized

let g:haddock_browser="/usr/bin/firefox"

set backspace=2

" Haskell Language Server config [HLScdb]
lua << EOF
require'nvim_lsp'.hls.setup{}
require'nvim_lsp'.elixirls.setup{}
EOF

nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
