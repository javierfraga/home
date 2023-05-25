" How to set up [Vundle]: $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" navigation
Plugin 'scrooloose/nerdtree'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'phaazon/hop.nvim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
" vim-glutentags is running cpu 100%
"Plugin 'ludovicchabant/vim-gutentags'
" styling
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-jdaddy'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/VisIncr'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'csexton/trailertrash.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'
Plugin 'ekalinin/Dockerfile.vim'
" absolute essentials
Plugin 'bling/vim-airline'
Plugin 'kana/vim-arpeggio'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'schickling/vim-bufonly'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-expand-region'
" vim-yankstack break vim-surrond
"Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 't9md/vim-choosewin'
" Autocompletion
Plugin 'Valloric/YouCompleteMe'
Plugin 'beloglazov/vim-online-thesaurus'
"Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'mlaursen/vim-react-snippets'
" not using but would like to improve or use in future or just try later
"Plugin 'chrisbra/csv.vim'
"Plugin 'kana/vim-textobj-user'
"Plugin 'kana/vim-textobj-line'


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
set runtimepath^=/home/javier/.vim/plugin/neat.vim
"
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1
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
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" add the proper PEP8 indentation for python
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" trys to match bad whitespace in python
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Saving marks and jumps
set viminfo='100,f1
set dict+=/usr/share/dict/words
"CursorLine highlight
nnoremap <silent> <Leader><S-l> ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader><S-w> :exe "let m=matchadd('WildMenu','\\<\\w*\\%" . line(".") . "l\\%" . col(".") . "c\\w*\\>')"<CR>
noremap <silent> <Leader><CR> :call clearmatches()<CR>
"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au WinLeave * setlocal nocursorline
"augroup END
"function s:SetCursorLine()
    "set cursorline
    "hi cursorline cterm=bold ctermbg=darkgrey
"endfunction
"autocmd VimEnter * call s:SetCursorLine()
set guicursor+=a:-Cursor-blinkwait1-blinkoff1-blinkon1
"set cursorline
"hi clear CursorLine
"highlight CursorLineNR ctermbg=red

""""""""""""""""""""""""""""""""""""""""""""""""
"  * and # super command prevent initial jump  "
""""""""""""""""""""""""""""""""""""""""""""""""
"ref: https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>


" vimdiff whitespace removal
set diffopt+=iwhite
function! DiffW()
let opt = ""
 if &diffopt =~ "icase"
   let opt = opt . "-i "
 endif
 if &diffopt =~ "iwhite"
   let opt = opt . "-w " " vim uses -b by default
 endif
 silent execute "!diff -a --binary " . opt .
   \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction
set diffexpr=DiffW()
" vimdiff wrap text
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
set diffopt+=vertical
"white space removal from file
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! WhitespaceTrimRemove call TrimWhitespace()
"nmap <leader>e :TrimWhitespace<cr> " https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file#answer-456

" file and path name copies custom commands
command! ChangeDirHere cd %:p:h
command! GetDirName redir @+ | echo expand('%:p:h') | redir END | sleep 100ms | let @+ = substitute(@+,'\n','','g') | redir @* | echo expand('%:p:h') | redir END | sleep 100ms | let @* = substitute(@*,'\n','','g')
command! GetFileName redir @+ | echo expand('%:t') | redir END | sleep 100ms | let @+ = substitute(@+,'\n','','g') | redir @* | echo expand('%:t') | redir END | sleep 100ms | let @* = substitute(@*,'\n','','g')
command! GetFullPath redir @+ | echo expand('%:p') | redir END | sleep 100ms | let @+ = substitute(@+,'\n','','g') | redir @* | echo expand('%:p') | redir END | sleep 100ms | let @* = substitute(@*,'\n','','g')


function! TestMe(...)
	"echo a:1
	if join(a:000, ' ') =~ "\a"
		echo "true"
	else
		echo "false"
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ebiz svn functions                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! EbizDiff call DiffFile()
command! EbizAdd call AddSvnFile()
command! EbizCloseDiff call CloseDiff()
command! -nargs=* EbizCommit :call CommitSvnFiles(<f-args>)
command! GetSvnFiles redir @+ | echo g:svnFiles | redir END | sleep 100ms | let @+ = substitute(@+,'\n','','g') | redir @* | echo  g:svnFiles | redir END | sleep 100ms | let @* = substitute(@*,'\n','','g')

function! ListOptions(directories)
	let c = 0
	for i in a:directories
		echo c . ': ' . i
		let c += 1
	endfor
endfunction

function! GetChoice()
	call inputsave()
	let choice = input("Enter choice (#) and add done when done:")
	redraw	" this is only way input is not received twice
	call inputrestore()
	echo choice . " was selected"
	return choice
endfunction

function! GetFindLocation(lists)
	if len(a:lists) == 1
		let choice=0
		return choice
	else
		call ListOptions(a:lists)
		let choice = GetChoice()
		return choice
	endif
endfunction

let g:svnFiles = []
function! DiffFile()
	"gets file name
	let currentFile = expand('%:t')
	echom currentFile

	"transverses ebiz branch directory for 'find' location
	echom "working on traversing branch ....."
	let path = "/ebiz/"
	let choice = ""
	while choice !~ "done"
		let dirs = split(system("ls " . path), "\n")
		let choice = GetFindLocation(dirs)
		if choice !~ "done"
			let path =  path . dirs[choice] . "/"
			echom "current location:  " . path
		endif
	endwhile

	"find command for files
	echom "working on find ....."
	let path = system("find " . path . " -name " . currentFile)[:-2]
	let pathList=split(path,'[\]\|[[:cntrl:]]')
	let choice = GetFindLocation(pathList)

	"svn and vimdiff commands
	echom "working on svn update ....."
	execute("!svn update " . pathList[choice])
	execute("diffsplit" . pathList[choice])
endfunction

function! CloseDiff()
	execute("bd")
	execute("diffoff!")
endfunction

function! AddSvnFile()
	let currentFile = expand('%:p')
	let g:svnFiles = add(g:svnFiles,currentFile)
	call CloseDiff()
	echo g:svnFiles
endfunction

function! CommitSvnFiles(...)
	if len(g:svnFiles) > 0
		execute("!svn ci -m " . join(a:000, ' ') . " " . join(g:svnFiles,' '))
		let g:svnFiles=[]
		"try
			"execute("!svn ci -m " . join(a:000, ' ') . " " . join(g:svnFiles,' '))
			"let success=1
		"catch
			"echo "there was error with svn commit, this msg is from your .vimrc"
			"let success=0
		"endtry
		"if success == 1
			"let g:svnFiles=[]
			"echo "g:svnFiles has not been emptied"
		"endif
	else
		echo "g:svnFiles was empty" g:svnFiles
	endif
endfunction

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
"au CursorHold * checktime
" detecting change
" https://vim.fandom.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
set autoread
au FocusGained,BufEnter * :checktime

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  set backupdir=/tmp " keep backup file in /tmp
endif
set directory=/tmp "keeps swaps in /tmp"
"set patchmode=.original "keeps a copy of original file"
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set iskeyword+=-	"adds '-' to whole word for spinal case edits"
set background=dark	" set color good for dark background, execute before :syntax on
colorscheme industry

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

set ignorecase smartcase
"set spell
"set nospell
"" Ignore CamelCase words when spell checking
fun! IgnoreCamelCaseSpell()
	syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
	syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" vertical line indentation
set list lcs=tab:\|\
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

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
let g:UltiSnipsAddFiletypes='js.html'
"This works below
autocmd FileType javascript UltiSnipsAddFiletypes js.html
autocmd FileType html UltiSnipsAddFiletypes xml

"delimitMate setting
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Ctrl-P mappings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Easy bindings for its various modes
nmap <leader><S-f> :CtrlPBuffer<cr>
nmap <leader><S-f>a :CtrlPMixed<cr>
nmap <leader><S-f>m :CtrlPMRU<cr>

"Not working
"reference: https://github.com/kien/ctrlp.vim/issues/280#issuecomment-42512047
"let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

"func! MyCtrlPMappings()
    "nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
"endfunc

"func! s:DeleteBuffer()
    "let line = getline('.')
    "let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        "\ : fnamemodify(line[2:], ':p')
    "exec "bd" bufid
    "exec "norm \<F5>"
"endfunc
 "buffer delete in Ctrl-P
call ctrlp_bdelete#init()

" " Window remap to something more comfortable
nmap <SPACE>w <C-w>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               copy and paste                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
" copy and replace in visual mode only
"vnoremap <C-r> "hy:s/<C-r>h//<left>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-repeats                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Window Shift Left
nnoremap <Plug>moveWindowLeft <C-w>>
			\:cal repeat#set("\<Plug>moveWindowLeft")<CR>
"nmap <SPACE>w<Left> <Plug>moveWindowLeft
nmap <C-w><Left> <Plug>moveWindowLeft

" " Window Shift Right
nnoremap <Plug>moveWindowRight <C-w><
			\:cal repeat#set("\<Plug>moveWindowRight")<CR>
"nmap <SPACE>w<Right> <Plug>moveWindowRight
nmap <C-w><Right> <Plug>moveWindowRight

" " Window Shift Up
nnoremap <Plug>moveWindowUp <C-w>-
			\:cal repeat#set("\<Plug>moveWindowUp")<CR>
"nmap <SPACE>w<Up> <Plug>moveWindowUp
nmap <C-w><Up> <Plug>moveWindowUp

" " Window Shift Down
nnoremap <Plug>moveWindowDown <C-w>+
			\:cal repeat#set("\<Plug>moveWindowDown")<CR>
"nmap <SPACE>w<Down> <Plug>moveWindowDown
nmap <C-w><Down> <Plug>moveWindowDown

" " Page Scroll Up
nnoremap <Plug>scrollUp <C-u>
			\:cal repeat#set("\<Plug>scrollUp")<CR>
"nmap <SPACE>u <Plug>scrollUp
nmap <C-u> <Plug>scrollUp

" " Page Scroll Down
nnoremap <Plug>scrollDown <C-d>
			\:cal repeat#set("\<Plug>scrollDown")<CR>
"nmap <SPACE>d <Plug>scrollDown
nmap <C-d> <Plug>scrollDown

" " Go to last buffer
nmap <F11> <C-^>
nnoremap <Plug>bufferLast <C-^>
			\:cal repeat#set("\<Plug>bufferLast")<CR>
"nmap <SPACE>k <Plug>bufferLast
nmap <C-k> <Plug>bufferLast

" " Move to the next buffer
nmap <F12> :bnext<CR>
nnoremap <Plug>bufferRight :bnext<CR>
			\:cal repeat#set("\<Plug>bufferRight")<CR>
"nmap <SPACE>l <Plug>bufferRight
nmap <C-l> <Plug>bufferRight

" " Move to the previous buffer
nmap <F10> :bprevious<CR>
nnoremap <Plug>bufferLeft :bprevious<CR>
			\:cal repeat#set("\<Plug>bufferLeft")<CR>
"nmap <SPACE>j <Plug>bufferLeft
nmap <C-j> <Plug>bufferLeft
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" This allows buffers to be hidden if you've modified a buffer.
set hidden

""CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'raw'
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
" disable option to disable ycm if file is too big
let g:ycm_disable_for_files_larger_than_kb = 0
"for no .ycm_global_ycm_extra_conf found error in C program
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='$HOME/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               tern settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tern leader or else default '\'
let g:tern_map_prefix = '<leader>'
" enable keyboard shortcuts
let g:tern_map_keys=1
" hold automatic hints after delay
let g:tern_show_arguments_hints='on_hold'

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
	autocmd bufwritepost .nvimrc source ~/.config/nvim/init.vim
augroup END

nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:<CR>
vmap <leader>: :Tabularize /:<CR>
nmap <leader>// :Tabularize /\/\/<CR>
vmap <leader>// :Tabularize /\/\/<CR>

" this is for html indentation i found this here:
" http://www.vim.org/scripts/script.php?script_id=2075
" You can add further tags with:
let g:html_indent_inctags = "body,tbody,script"
"let g:html_indent_zerotags = "meta,head"

" You should at least change prefix key like this
"map <leader>k <Plug>(easymotion-s)
"map f <Plug>(easymotion-s)
lua require'hop'.setup()

"lua << EOF
"require'hop'.setup()
"EOF
map <leader>f <cmd>HopChar1<CR>
omap <leader>f <cmd>HopChar1<CR>
map <leader>w <cmd>HopWord<CR>
omap <leader>w <cmd>HopWord<CR>
map <leader>l <cmd>HopLine<CR>
omap <leader>l <cmd>HopLine<CR>

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
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

"Vim-sessions
let g:session_directory='~/.vim/sessions'
let g:session_autoload='no'
let g:session_autosave='yes'
let g:session_command_aliases = 1
nnoremap <leader>so :SessionOpen
nnoremap <leader>ss :SessionSave
nnoremap <leader>sd :SessionDelete<CR>
nnoremap <leader>sc :SessionClose<CR>

"c++11 syntax highlighting from polyglot
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"vim-chosewin
nmap  <C-w>q  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

"textobj-line
"nmap <leader>v  <Plug>(textobj-line-i)

"Ctags vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
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
