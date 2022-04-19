set number
set relativenumber
set autoindent
set mouse=a
set visualbell
set ignorecase
set smartcase
set wrap
set redrawtime=10000
set termguicolors

" Commented out for auto indentations
"set tabstop=4
"set shiftwidth=4
"set smarttab
"set softtabstop=4

let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/norcalli/nvim-colorizer.lua' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim' " Auto Completion
Plug 'https://github.com/neoclide/coc-tsserver'  " TS Server
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' " Highlight modified
Plug 'https://github.com/ryanoasis/vim-devicons' " Icons pack for nerdtree
Plug 'https://github.com/airblade/vim-gitgutter' " Indication for git changes
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " Show modified code icons
Plug 'https://github.com/scrooloose/nerdcommenter' " commenting
Plug 'https://github.com/christoomey/vim-tmux-navigator' " tmux navigator
Plug 'https://github.com/junegunn/fzf.vim' " fuzzy finder
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder repo
Plug 'https://github.com/SirVer/ultisnips' " Ultisnips engine
Plug 'https://github.com/honza/vim-snippets' " Ultisnips plug
Plug 'https://github.com/tpope/vim-sleuth' " For auto indentations
Plug 'https://github.com/tpope/vim-fugitive' " For git actions
Plug 'https://github.com/wakatime/vim-wakatime' " For github readme
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' " Indent line
Plug 'https://github.com/sheerun/vim-polyglot' " Syntax highlighting
"Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting but lags
Plug 'https://github.com/kyazdani42/nvim-web-devicons' " Tab icons for barbar
Plug 'https://github.com/romgrk/barbar.nvim' " Barbar - buffer/tab style
Plug 'https://github.com/APZelos/blamer.nvim' " inline git blame

call plug#end()

" FOR TREESITTER
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained', -- one of all, maintained (parsers with maintainers), or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
  },
}
EOF

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

imap jj <Esc>

set completeopt-=preview " For No Previews

colorscheme deep-space

" NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Tabs
"noremap <A-t> :tabnew<cr>
"noremap <A-.> :tabn<cr>
"noremap <A-,> :tabp<cr>
"noremap <A-w> :tabc<cr>

" Barbar Tabline
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

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

" Enables syntax highlighting for Flow
let g:javascript_plugin_flow = 1

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
