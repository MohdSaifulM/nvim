set number
set relativenumber
set autoindent
set mouse=a
set visualbell
set ignorecase
set smartcase
set wrap
set redrawtime=10000

" Commented out for auto indentations
"set tabstop=4
"set shiftwidth=4
"set smarttab
"set softtabstop=4

call plug#begin('~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/neoclide/coc-tsserver'  " TS Server
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/kien/ctrlp.vim' " Fuzzy find files
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' " Highlight modified
Plug 'https://github.com/ryanoasis/vim-devicons' " Icons pack for nerdtree
Plug 'https://github.com/airblade/vim-gitgutter' " Indication for git changes
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " Show modified code icons
Plug 'https://github.com/scrooloose/nerdcommenter' " commenting
Plug 'https://github.com/christoomey/vim-tmux-navigator' " tmux navigator
Plug 'https://github.com/mxw/vim-jsx' " syntax highlight jsx
Plug 'https://github.com/pangloss/vim-javascript' " syntax highlight js
Plug 'https://github.com/junegunn/fzf.vim' " fuzzy finder
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder repo
Plug 'https://github.com/SirVer/ultisnips' " Ultisnips engine
Plug 'https://github.com/honza/vim-snippets' " Ultisnips plug
Plug 'https://github.com/tpope/vim-sleuth' " For auto indentations
Plug 'https://github.com/tpope/vim-fugitive' " For git actions
Plug 'https://github.com/digitaltoad/vim-pug' " Syntax highlighting for jade files

call plug#end()

set encoding=UTF-8

"-- FOLDING FOR JS--  
set foldmethod=syntax "syntax highlighting items specify folds  
"set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"noremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <space> :

nmap <F8> :TagbarToggle<CR>

imap jj <Esc>

set completeopt-=preview " For No Previews

colorscheme onedark

" NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Enable syntax highlighting
let g:javascript_plugin_jsdoc = 1

" Enable ngdocs highlighting
let g:javascript_plugin_ngdoc = 1

let g:python3_host_prog = '/usr/bin/python3'

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks =
\  [ 'indent', 'trailing', 'conflicts' ]


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" coc config
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-ultisnips',
	\ ]

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
