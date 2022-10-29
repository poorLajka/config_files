
"-----------------------------------
"           Plugins 
"-----------------------------------
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

"-----------------------------------
"          Sane defaults
"-----------------------------------
set relativenumber
set nu rnu
set linebreak
set showbreak=+++
set tw=80
set wrap

set ignorecase
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler
set undolevels=1000
set backspace=indent,eol,start

"Set default splits (used for FZF)
set splitbelow
set splitright

"-----------------------------------
"         Look/theme 
"-----------------------------------
set termguicolors
syntax enable
let g:nightflyTransparent = v:true
color nightfly

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"Disable explorer banner
let g:netrw_banner=0

"Turn off colors for ripgrep 
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" --smart-case '.shellescape(<q-args>), 1, { 'options': '--color hl:123,hl+:222' }, 0)

let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.4, 'height': 0.2 , 'border': 'vertical'} }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['bg', 'Normal'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"-----------------------------------
"           Keymappings
"-----------------------------------
"Edit file
noremap <silent> <C-e>  :FZF <CR>

"Run ripgrep
noremap <silent> <C-g>  :Rg <CR>

"Open File explorer
nnoremap <silent> <C-space>  :Ex <CR>

nnoremap <silent> <C-f>  :Buffers <CR>

"Buffer navigation
noremap <silent> <C-k>  :bnext <CR>
noremap <silent> <C-j>  :bprev <CR>

"Goto previous open buffer
noremap <C-p> <C-^>

"Relaunch buffers
"noremap <C-f> :argdel * <CR> <bar> :bufdo argadd % <CR> <bar> :%bd <CR> <bar> :argdo e <CR>

"Quit buffer
noremap <silent> <C-q>  :bd <CR>

"Split navigation
noremap <C-h> <C-w><left>
noremap <C-l> <C-w><right>

"Set scroll distance
noremap <C-u> 10<C-u>
noremap <C-d> 10<C-d>

"Clear search
noremap <silent> <C-n>  :noh <CR>

"Smallfixes for ctrl-c
nnoremap <C-c> <silent> <C-c>
imap <C-c> <Esc>

"Remove trailing whitespaces
nnoremap <silent> <F1> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

