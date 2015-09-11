set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.nvim/bundle/Vundle.vim
" call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
call vundle#begin('~/.nvim/bundle')

 " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'dhruvasagar/vim-vinegar'
" styling
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/VisIncr'
Plugin 'godlygeek/tabular'
" absolute essentials
Plugin 'bling/vim-airline'
Plugin 'kana/vim-arpeggio'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/DirDiff.vim'
" Autocompletion 
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
" not using but would like to improve or use in future or just try later
"Plugin 'chrisbra/csv.vim'
"Plugin 'tpope/vim-unimpaired'


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
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"" Ignore CamelCase words when spell checking
"fun! IgnoreCamelCaseSpell()
	"syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell
	"transparent
	"syn cluster Spell add=CamelCase
"endfun
"autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()


" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime 

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
  "filetype plugin indent on

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

set ignorecase
"set spell
"set nospell

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '|'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"Defines the directory private snippet definition
"files are stored in. For example, if the variable
"is set to '~/.vim/mydir/UltiSnips' and the current
"'filetype' is 'cpp', then :UltiSnipsEdit will open
""~/.vim/mydir/UltiSnips/cpp.snippets". Note that
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" THIS ONE NOT WORKING :( Needs to be done manually inside a session
"The UltiSnipsAddFiletypes command allows for explicit merging of other snippet
"filetypes for the current buffer. For example, if you edit a .rst file but
"also want the Lua snippets to be available you can issue the command >
"The priority will then be html -> xml -> all.
let g:UltiSnipsAddFiletypes='html.xml'

"delimitMate setting
let delimitMate_expand_cr = 1

"CtrlP default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" Easy bindings for its various modes
nmap <leader>f :CtrlPBuffer<cr>
nmap <leader>fa :CtrlPMixed<cr>
nmap <leader>fm :CtrlPMRU<cr>

" " Window remap to something more comfortable
nmap <SPACE>w <C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-repeats                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Window Shift Left
nnoremap <Plug>moveWindowLeft <C-w>>
			\:cal repeat#set("\<Plug>moveWindowLeft")<CR>
nmap <SPACE>w<Left> <Plug>moveWindowLeft

" " Window Shift Right
nnoremap <Plug>moveWindowRight <C-w><
			\:cal repeat#set("\<Plug>moveWindowRight")<CR>
nmap <SPACE>w<Right> <Plug>moveWindowRight

" " Window Shift Up
nnoremap <Plug>moveWindowUp <C-w>-
			\:cal repeat#set("\<Plug>moveWindowUp")<CR>
nmap <SPACE>w<Up> <Plug>moveWindowUp

" " Window Shift Down
nnoremap <Plug>moveWindowDown <C-w>+
			\:cal repeat#set("\<Plug>moveWindowDown")<CR>
nmap <SPACE>w<Down> <Plug>moveWindowDown

" " Page Scroll Up
nnoremap <Plug>scrollUp <C-u>
			\:cal repeat#set("\<Plug>scrollUp")<CR>
nmap <SPACE>u <Plug>scrollUp

" " Page Scroll Down
nnoremap <Plug>scrollDown <C-d>
			\:cal repeat#set("\<Plug>scrollDown")<CR>
nmap <SPACE>d <Plug>scrollDown

" " Go to last buffer
nmap <F11> <C-^>
nnoremap <Plug>bufferLast <C-^>
			\:cal repeat#set("\<Plug>bufferLast")<CR>
nmap <SPACE>k <Plug>bufferLast

" " Move to the next buffer
nmap <F12> :bnext<CR>
nnoremap <Plug>bufferRight :bnext<CR>
			\:cal repeat#set("\<Plug>bufferRight")<CR>
nmap <SPACE>l <Plug>bufferRight

" " Move to the previous buffer
nmap <F10> :bprevious<CR>
nnoremap <Plug>bufferLeft :bprevious<CR>
			\:cal repeat#set("\<Plug>bufferLeft")<CR>
nmap <SPACE>j <Plug>bufferLeft
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" This allows buffers to be hidden if you've modified a buffer.
set hidden

""CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'c'
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
nmap <leader>swh  :topleft  vsplit<CR>
nmap <leader>swl :botright vsplit<CR>
nmap <leader>swk    :topleft  split<CR>
nmap <leader>swj  :botright split<CR>
" buffer split
nmap <leader>sh   :leftabove  vsplit<CR>
nmap <leader>sl  :rightbelow vsplit<CR>
nmap <leader>sk     :leftabove  split<CR>
nmap <leader>sj   :rightbelow split<CR>

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
let g:html_indent_inctags = "body,tbody,script"
"let g:html_indent_zerotags = "meta,head" 

" You should at least change prefix key like this 
map <leader>k <Plug>(easymotion-s)
map f <Plug>(easymotion-s)

" pangloss/vim-javascript Enables HTML/CSS syntax highlighting in your
" JavaScript file.
let g:javascript_enable_domhtmlcss=1

" othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery,angularjs,underscore,backbone,jasmine,requirejs'

" :bufdo vimgrepadd text % | copen, cnext and cprev 
nmap ]q :cnext<CR>
map ]q :cnext<CR>
nmap [q :cprev<CR>
map [q :cprev<CR>

" burnettk/vim-angular
" Jump to definition of service/directive/controller/etc
" assume your filenames are dasherized (likeABoss or LikeABoss goes to like-a-boss.js)
let g:angular_filename_convention = 'camelcased'

" remapping arrow keys
" http://codingfearlessly.com/2012/08/21/vim-putting-arrows-to-use/
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   eclim                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make YCM and Eclim play nice
let g:EclimCompletionMethod = 'omnifunc'

" Import the class under the cursor
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

" Search for the javadocs of the element under the cursor 
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>

" Perform a context sensitive search of the element under the cursor 
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
