set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'dhruvasagar/vim-vinegar'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-scripts/VisIncr'
Plugin 'godlygeek/tabular'

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
" An example for a vimrc file.
"
let g:NERDTreeDirArrows=0
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set number
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Make vim work with the 'crontab -e' command
set backupskip+=/var/spool/cron/*

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"========================== Custom Mappings ===============================
nmap tg <ESC>:tabprevious<CR>
map tg <ESC>:tabprevious<CR>
imap tg <ESC>:tabprevious<CR>
inoremap jk <Esc>
let mapleader=","
map <C-n> <ESC>:NERDTreeToggle<CR>

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '|'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"delimitMate setting
let delimitMate_expand_cr = 1

"CtrlP default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" Easy bindings for its various modes
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>ba :CtrlPMRU<cr>

" To open a new empty buffer
nmap <leader>T :enew<cr>

" " Move to the next buffer
nmap <leader>k :bnext<CR>

" " Move to the previous buffer
nmap <leader>m :bprevious<CR>

"" This allows buffers to be hidden if you've modified a buffer.
set hidden

""CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'r'
""  c - the directory of the current file.
""  a - like 'c', but only applies when the current working directory outside of
""      CtrlP isn't a direct ancestor of the directory of the current file.
""  r - the nearest ancestor that contains one of these directories or files:
""      .git .hg .svn .bzr _darcs
""  w - begin finding a root from the current working directory outside of CtrlP

" CtrlP will open multiple files in new tabs and switch to those tabs
let g:ctrlp_open_multiple_files = 'ij'
" For the number:
"   - If given, it'll be used as the maximum number of windows or tabs to create
"     when opening the files (the rest will be opened as hidden buffers).
"   - If not given, <c-o> will open all files, each in a new window or new tab.
" For the letters:
"   t - each file in a new tab.
"   h - each file in a new horizontal split.
"   v - each file in a new vertical split.
"   i - all files as hidden buffers.
"   j - after opening, jump to the first opened tab or window.
"   r - open the first file in the current window, then the remaining files in
"       new splits or new tabs depending on which of 'h', 'v' and 't' is also
"       present.

" Use this option to specify how the newly created file is to be opened when
" pressing <c-y>: >
let g:ctrlp_open_new_file = 't'
" t - in a new tab.
" h - in a new horizontal split.
" v - in a new vertical split.
" r - in the current window.

" Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs: >
let g:ctrlp_show_hidden = 1

" Where to put the new tab page when opening one: >
"  a - after.
"  b - before.
"  c - the current tab page.
"  l - the last tab page.
"  f - the first tab page.
let g:ctrlp_tabpage_position = 'ac'

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" window split
nmap <leader>sw<left>  :topleft  vsplit<CR>
nmap <leader>sw<right> :botright vsplit<CR>
nmap <leader>sw<up>    :topleft  split<CR>
nmap <leader>sw<down>  :botright split<CR>
" buffer split
nmap <leader>s<left>   :leftabove  vsplit<CR>
nmap <leader>s<right>  :rightbelow vsplit<CR>
nmap <leader>s<up>     :leftabove  split<CR>
nmap <leader>s<down>   :rightbelow split<CR>

" vim-airline smarter tab line
let g:airline#extensions#tabline#enabled = 1

""vim-airline statusline appear all the time
set laststatus=2
set encoding=utf-8

" debug ycmd server shutdown
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" enable/disable csv integration for displaying the current column. >
 let g:airline#extensions#csv#enabled = 1

" change how columns are displayed. >
  let g:airline#extensions#csv#column_display = 'Number' 
  let g:airline#extensions#csv#column_display = 'Name'

" If you want vim to auto-reload your configuration, you must add the following commands :
" the grouping of autocommand is here to avoid *exponential* reloading if you
" save several times your configuration.
augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:<CR>
vmap <leader>: :Tabularize /:<CR>

" this is for html indentation i found this here:
" http://www.vim.org/scripts/script.php?script_id=2075
" You can add further tags with:
let g:html_indent_inctags = "html,body,head,tbody,script"

" You should at least change prefix key like this 
map <Leader>s <Plug>(easymotion-s)
