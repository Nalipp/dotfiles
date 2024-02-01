"==================================================================
"                                              ~My vimrc~
"==================================================================
":PluginInstall
let g:ackprg = "ag --vimgrep"
"Vundle setup
set nocompatible " Required by vundle
filetype off     " Required by vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'lervag/vim-latex'
Plugin 'tpope/vim-rails'
" Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch' "allows you to test in the window with vim-rspec
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomasr/molokai'
Plugin 'joshdick/onedark.vim'
Plugin 'nikvdp/ejs-syntax'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'vim-airline/vim-airline' "status/tabline
" typscript
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
" slim html
Plugin 'slim-template/vim-slim'
" peitalin might cause performance issues on large files see coc plugin instead
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
  " Plugin 'peitalin/vim-jsx-typescript'
  " autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
Plugin 'neoclide/coc.nvim'
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plugin 'neoclide/coc-tsserver'
Plugin 'puremourning/vimspector'
"fuzzy finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
imap jk <esc>
imap kj <esc>
imap <Tab> <C-P>
set relativenumber
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nobackup
set clipboard=unnamed
set incsearch
set hlsearch
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
" setTool tip documentation and diagnostics ignorecase
" set smartcase
set ignorecase
set splitbelow
set splitright
set mousehide
set backspace=indent,eol,start
set guioptions-=R
set guioptions-=L
" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>
"leader comands
let mapleader = "\;"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
"remove relative number
nmap <leader>nr :set number relativenumber!<cr>
"below is just like * except stays on the current instance
nmap <leader>8 *N
nmap <leader>vr :tabedit ~/.vimrc<cr>
nmap <leader>vs :so %<cr>
nmap <leader>s :w<cr>
nmap <leader>h :noh<cr>
nmap <leader>op :!open % -a Google\ Chrome<cr>
nmap <leader>q :q<cr>
nmap <leader>w :q<cr>
nmap <leader>rn :set number relativenumber<cr>
nmap <leader>l <Insert>console.log(<esc>
"save
nmap <leader>so :source ~/.vimrc <cr>
nmap <space> <Insert> <esc>l
nmap <leader>b :Explore <cr>
" nmap <leader>sa :w !sudo tee %<cr>
nmap <leader>ci :set ignorecase<cr>
nmap <leader>cc :set noignorecase<cr>
"copy all lines in a file
  "nmap <leader>co ggVG*y
nmap <leader>ca :w !pbcopy<cr>
"split window with current parent directory file path
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>vv :split <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>t :tabe <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
"shortcuts to note files
"daily-notes are not version controlled
nmap <leader>nnn :tabedit ~/code/notes/daily-notes/daily.txt <cr>
nmap <leader>nne :tabedit ~/code/notes/daily-notes/emails.txt <cr>
nmap <leader>nns :tabedit ~/code/notes/daily-notes/shopping.txt <cr>
nmap <leader>nnf :tabedit ~/code/notes/daily-notes/finance.txt <cr>
nmap <leader>nnp :tabedit ~/code/notes/daily-notes/scrap/scrap.py <cr>
nmap <leader>nnj :tabedit ~/code/notes/daily-notes/scrap/scrap.js <cr>
nmap <leader>nnr :tabedit ~/code/notes/daily-notes/scrap/scrap.rb <cr>
nmap <leader>nnh :tabedit ~/code/notes/daily-notes/scrap/html <cr>
<<<<<<< HEAD
nmap <leader>nnc :tabedit ~/code/notes/daily-notes/shortcuts.txt <cr>
"yank the current path and filename of the current file
nnoremap <leader>y :let @+=expand("%")<CR>
"perm-notes are version controlled for notes that may help you later
nmap <leader>nna :tabedit ~/code/notes/perm-notes <cr>
nmap <leader>nnb :tabedit ~/code/notes/perm-notes/bugs.txt <cr>
"can be used for testing
nmap <leader>T :w<cr>:call RunCurrentSpecFile()<cr>
"indent all lines in the file
nmap <leader>id mmgg=G`m
"move tabs right and left
nmap <leader>gg :tabm +1<cr>
nmap <leader>tt :tabm -1<cr>
"Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk
"Searching
"
"find
" nmap <leader>f :vimgrep // **/*.js
" :vimgrep -R --exclude-dir=node_modules /App/ .
" nmap <leader>ff :grep -R --exclude-dir=node_modules --exclude-dir=build --exclude=\yarn.lock --exclude=\package-lock.json '' %<left><left><left>
" nmap <leader>ff :grep -R --exclude-dir={node_modules,build,venv}
" --exclude={\yarn.lock,\package-lock.json} '' %<left><left><left>
"
" Search with fzf fuzzyfinder
"
nmap <leader>ff :GFiles<cr>
" open the result file using ctr-t (new tab)
nmap <leader>fw :Rg<cr>
" fzf uses ripgrep which needs to be install via $ brew install ripgrep
" Recursively search through all files starting at the direcotry you are currently in (using %)
"   To search starting from a different dirrectlry replace the '%' with the file path
nmap <leader>oo :copen<cr>
"See a list of all files (after grep)"
nmap <leader>n :cnext<cr>
"Cycle through the next file file (after grep)"
nmap <leader>p :cprevious<cr>
"useful when a file automatically folds code"
nmap <leader>nf :set nofoldenable<cr>
"auto comands
autocmd Filetype help nnoremap <buffer> q :q<CR>
"Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
" Colors
colorscheme onedark
let g:airline_theme='onedark'
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:netrw_banner = 0
