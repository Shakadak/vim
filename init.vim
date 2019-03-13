set nocompatible              " be iMproved, required

call plug#begin()
" General
" Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'

" Language Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'rust-lang/rust.vim'

Plug 'idris-hackers/idris-vim'

" Haskell
Plug 'lukerandall/haskellmode-vim'
Plug 'neovimhaskell/haskell-vim'

" Elixir
Plug 'elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}
"Plug 'maxmellon/vim-jsx-pretty'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" Stephen Diehl

"Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'garbas/vim-snipmate'
" Plug 'godlygeek/tabular'
" Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

call plug#end()

"Put your custom Vim configuration here

"Better command completion
"set wildmenu
"set wildmode=list:longest

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


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

set background=light
colorscheme solarized

let g:haddock_browser="/usr/bin/firefox"

set backspace=2

"Haskell
"	Syntastic
"" map <Leader>s :SyntasticToggleMode<CR>
"" 
"" set statusline+=%#warningmsg#
"" set statusline+=%{SyntasticStatuslineFlag()}
"" set statusline+=%*
"" 
"" let g:syntastic_always_populate_loc_list = 1
"" let g:syntastic_auto_loc_list = 0
"" let g:syntastic_check_on_open = 0
"" let g:syntastic_check_on_wq = 0
"" 
"" "	GHC-mod
"" map <silent> tw :GhcModTypeInsert<CR>
"" map <silent> ts :GhcModSplitFunCase<CR>
"" map <silent> tq :GhcModType<CR>
"" map <silent> te :GhcModTypeClear<CR>
"	Supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"	Nerdtree
" map <Leader>n :NERDTreeToggle<CR>

"	Tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

"	Ctrl-p
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" ALE

function CheckIfFileExists(filename)
  if filereadable(a:filename)
    return 1
  endif

  return 0
endfunction

" Disable GHC linter if in a Haskell Stack project
if (CheckIfFileExists("./stack.yaml") == 1)
  " you can include any other linters in this list too
  let g:ale_linters = {
  \   'haskell': ['hlint', 'stack_build'],
  \}
endif

let g:ale_linters_explicit = 1
