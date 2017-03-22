filetype plugin on
set nocompatible
set nu 				" set numbers on
set rnu 			" set relative numbers on
set shiftwidth=2
au FileType cpp,c,java,sh  set cindent
set scrolloff=2
set showtabline=1
set mouse=i
set mousehide
set hidden
set autoindent    		" always set autoindenting on
set copyindent    		" copy the previous indentation on autoindenting
set textwidth=80
set backspace=indent,eol,start  " allow backspacing over everything in insert mode 
set whichwrap+=<,>,h,l,[,]      " wrap the end and begining of line for moving cursor.
set showmatch 			" set show matching parenthesis 
set ignorecase 			" ignore case when searching
set smartcase   		" ignore case if search pattern is all lowercase,
set previewheight=8		" Set the height for preview window.
                		" case-sensitive otherwise
set splitbelow			" Preview windows and such open below
set splitright			" Preview windows and such open right
set noequalalways		" So after auto compliltion windows don't get 
				" equal size happens on 'pclose'

set hlsearch      		" highlight search terms
set incsearch     		" show search matches as you type
set wak=no 			" windows alt key (alt key should be captured
				" by vim (yes), gui(menu), no
set guifont=Meslo\ LG\ M\ for\ Powerline\ 13 " <~ set the font
set cursorline
set cpoptions=ces$ 		"understand this

set wildmode=longest,list,full
set wildmenu

set completeopt+=longest

set dictionary=/usr/share/dict/british-english

set confirm

"for code folding
set foldnestmax=3
set foldmethod=syntax
set nofoldenable

"higlight after 80th column
"highlight ColorColumn guibg=red
"let &colorcolumn=join(range(81,999),",")
let &colorcolumn=81
"highlight ColorColumn ctermbg=235 guibg=#1B1C17

" now this is important, arrow keys won't work
"map <up> zk
"map <down> zj
"map <left> <nop>
"map <right> <nop>

map <T-o> :echo "super o"<CR>

let mapleader=","

" Edit and load vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>V :so $MYVIMRC<CR>:AirlineToggle<CR>:AirlineToggle<CR>

" Split the line at current position
nnoremap K i<CR><Esc>

"------------------------------ Vundle things start  ------------------------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
"Plugin 'tpope/vim-endwise' 

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/nerdcommenter'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'bling/vim-airline' 

Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'

"Plugin 'Raimondi/delimitMate'
"Plugin 'spf13/vim-autoclose'
Plugin 'jiangmiao/auto-pairs'

Plugin 'vhdirk/vim-cmake'

Plugin 'vim-scripts/bufkill.vim'

Plugin 'terryma/vim-expand-region'

Plugin 'nelstrom/vim-visual-star-search'

Plugin 'craigemery/vim-autotag'

Plugin 'luochen1990/rainbow'

Plugin 'mutewinter/swap-parameters'

"Plugin 'vim-scripts/yate'

"Plugin 'xolox/vim-session'
"Plugin 'xolox/vim-misc'
Plugin 'mhinz/vim-startify'

Plugin 'kien/ctrlp.vim'

"Plugin 'vim-scripts/greplace.vim' "Greplace command didn't exist. may be in new
				   "version
Plugin 'dkprice/vim-easygrep'

Plugin 'papanikge/vim-voogle'

Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

"Plugin 'bbchung/clighter'
Plugin 'jeaye/color_coded'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'taketwo/vim-ros'

"Plugin 'pelodelfuego/vim-swoop'

" Color schemes
"Plugin 'chriskempson/base16-vim'

Plugin 'tomasr/molokai'

"Plugin to emulate source insight
"Plugin 'wesleyche/SrcExpl'

" Google codefmt plugin
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" the glaive#Install() should go after the \"call vundle#end()"
call glaive#Install()
filetype plugin indent on    " required

"------------------------------ Vundle things end ------------------------

" if color scheme desert
"colorscheme desert
" else color scheme base16 "since base16 is installed via vundle, it cannot be
" above
"set background=dark
"colorscheme base16-default
"let base16colorspace=256
let g:molokai_original = 1
colorscheme molokai
"colorscheme twilighted
"end colorscheme

"---------------------------- Config for plugins and such start ------------

"So, this is a weird one, but a lot easy. Esc is far, was not when vim was
"designed. To deal with that, jj is being mapped to esc, i have never used the
"key combination in life. So, here goes nothing.
imap jj <Esc>

" tags file will be hidden, i.e. .tags
set tags=.tags
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --exclude=@.gitignore .<CR>
map <C-F12> :!ctags -f .tags -R --sort=yes --fields=+a --extra=+q --exclude=@.gitignore .<CR>

nmap <silent> <leader>/ :nohlsearch<CR>

"Shortcut is \\, two extra '\' to escape special meaning.
nmap \\\\ <C-W><bar>
nmap -- <C-W>_
nmap -\\ <C-W>_<C-W><bar>
map  <silent> <M-h> :call MoveToWindow("h")<CR>
map  <silent> <M-l> :call MoveToWindow("l")<CR>

map  <silent> <M-k> :call MoveToWindow("k")<CR>
map  <silent> <M-j> :call MoveToWindow("j")<CR>
nmap <T-F5> :echo "Temp"<CR>

map <leader>v :vsplit<CR>

"map  <silent> ;o <C-W>o
"imap  <silent> ;o <Esc><C-W>oi

" Save the file, <C-s> works in gvim
nnoremap <leader>w :w<CR>
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <Esc>:update<CR>

" Paste from clipboard
" <A-v> and <A-c> don't work on gvim, alt key is not captured.
" nnoremap <A-v> "+p
" inoremap <A-v> <Esc>"+pi
nnoremap <leader>p "+p
" Copy to clipboard
" vnoremap <A-c> "+y
vnoremap <leader>y "+y

map <leader>m :make <CR>

"nmap <C-I> gg=G`'
map // <leader>c<Space>

"vmap <silent> <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

"If using taglist
"map <silent> <F8> :TlistToggle<CR>
"map <silent> <F9> :TlistAddFiles *.c*<CR><C-W><left>=<A-right>
" else using tagbar and NerdTree
" end If
map <silent> <F8> :NERDTreeToggle<CR>
map <silent> <F9> :TagbarToggle<CR>
" end If

"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"au InsertLeave * if pumvisible() == 0|silent! pclose|endif

" YCM config
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"map <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"imap <F2> <Esc>:YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F2> :YcmCompleter GoTo<CR>
imap <F2> <Esc>:YcmCompleter GoTo<CR> 
nmap <leader>F :YcmCompleter FixIt<CR>
map <F5> :YcmDiags<CR>
map gt :YcmCompleter GetType<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<C-k>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips config
"let g:UltiSnipsExpandTrigger="C-["
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" vim-ros config
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

"test for maximizing window, make sure wmctrl is installed
"call system("wmctrl -b add,maximized_vert,maximized_horz -r " . v:windowid)
"exec \"echo \" . v:windowid
"exec \"!wmctrl -b add,maximized_vert,maximized_horz -i -r `wmctrl -l grep -i gvim`\"
"exec \"!wmctrl -b add,maximized_vert,maximized_horz -i -r `wmctrl -l | grep -i gvim | cut -f1 -d' '`\"
au GUIEnter * call system("wmctrl -b add,maximized_vert,maximized_horz -i -r " . v:windowid)
map <silent> <leader>b :call system("wmctrl -b add,maximized_vert,maximized_horz -i -r " . v:windowid)<CR>


" CtrlP config
let g:ctrlp_custom_ignore = '\v[\/](build)$'
map <leader>s :CtrlPMixed<CR>

" vim-airline config
"let g:airline_section_b = '%{strftime("%c")}'
autocmd GUIEnter * silent call airline#extensions#whitespace#toggle()
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set laststatus=2

" Old config to search function.
" YATE config
"map <silent> <C-l> :YATE<CR>
"imap <silent> <C-l> <Esc>:YATE<CR>
" New config (using CtrlP)
map <silent> <C-l> :CtrlPBufTag<CR>
imap <silent> <C-l> <Esc>:CtrlPBufTag<CR>

" NERDTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" FSwitch config
nmap <F4> :FSHere<CR>
imap <F4> <C-O>:FSHere<CR>i
nmap <C-F4> :FSRight<CR>
imap <C-F4> <C-O>:FSRight<CR>i
nmap <S-F4> :FSLeft<CR>
imap <S-F4> <C-O>:FSLeft<CR>i
nmap <M-F4> :FSSplitRight<CR>
imap <M-F4> <C-O>:FSSplitRight<CR>i

" Tagbar config
let g:tagbar_autofocus=1

" Easy motion plugin
" Oh my god, this is awesome!!!!!!
nmap <C-f> <Plug>(easymotion-bd-f)

" EasyGrep parameters
let g:EasyGrepMode=2

" Fugitive config. 
map <silent> <M-g> :Gstatus<CR>
" To close Gdiff with key combo but not close Gstatus window.
" As index file is always on left when opened with Gdiff, and i want to keep the
" working directory copy.
" nmeonic diff close
nnoremap <silent> dc :wincmd h<CR> :q<CR> :wincmd j<CR> 
autocmd BufReadPost fugitive://* set bufhidden=delete

" vim-gitgutter config
"let g:gitgutter_realtime = 0 "To avoid the annoying error when file is not in a git repo.

" bufkill.vim config
map <silent> <leader>bd :BD<CR> 
map <silent> <leader>bw :BW<CR> 

"vim-cmake config
"au VimEnter *.cpp,*.hpp,*.h,*.c if exists(':CMake') | CMake
map <F6> :CMake -DCMAKE_BUILD_TYPE=release<CR>
map <C-F6> :CMake -DCMAKE_BUILD_TYPE=debug<CR>

" rainbow config
let g:rainbow_active=1
"let g:rainbow_conf = {
    "\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    "\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    "\   'operators': '_,_',
    "\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    "\   'separately': {
    "\       '*': {},
    "\       'tex': {
    "\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    "\       },
    "\       'vim': {
    "\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    "\       },
    "\	    'cpp': {
    "\	    }
    "\   }
    "\}

"Swap parameters config
let g:SwapParametersMapForwards = '<leader><leader>fs'
let g:SwapParametersMapBackwards = '<leader><leader>bs'

" google's codefmt config
autocmd FileType c,cpp nnoremap <silent><buffer> == :FormatLine clang-format<CR>
autocmd FileType c,cpp vnoremap <silent><buffer> = :FormatLine clang-format<CR>
map <leader><leader>fc :FormatCode clang-format<CR>
map <leader><leader>fl :FormatLine clang-format<CR>
vmap <leader><leader>fl :'<,'>FormatLine clang-format<CR>

"Vim session config
let g:session_persist_globals = ['&makeprg']

"startify config
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 3
let g:startify_bookmarks = [ '~/.vimrc', '~/.bashrc' ]

"-------------------Clighter config----------------------
nmap <leader>r :call clighter#Rename()<CR>
" Free functions
hi link clighterDeclRefExprCall Function
hi link clighterFunctionDecl Function

" Enums
hi link clighterEnumDecl Identifier
hi link clighterEnumConstantDecl Constant
hi link clighterDeclRefExprEnum Constant

hi link clighterMacroInstantiation Constant
hi link clighterPrepro PreProc

" Member variable and method calls
hi link clighterMemberRefExprCall Function

" Not working
hi link clighterMemberRefExprVar Error

" namespace { ... }
hi link clighterNamespace Constant
hi link clighterNamespaceRef Constant

hi link clighterOccurrences IncSearch

" Templated types
hi link clighterTemplateRef Type

" References to templated types
hi link clighterTypeRef Type

" The 'T' in template <class T>
hi link clighterTemplateTypeParameter Type
" ----------------Clighter config end---------------------

"Pyclewn config
"let g:pyclewn_args="--window=right --gdb=./.clewn_info"

" Higlighting the 80 char limit This is here cause if it's set above then it's
" affect are neutralized, don't know why though
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" --------------------------* FUNCTIONS *-------------------------

function! RestartYCMAndDiags()
  execute 'YcmRestartServer'
  execute 'sleep'
  execute 'YcmForceCompileAndDiagnostics'
endfunction
map <C-F5> :call RestartYCMAndDiags()<CR>

function! LookupUsage()
  let c_word = expand("<cword>")
  echo c_word
  execute 'Ggrep ' . c_word
endfunction

nnoremap <silent> <C-k> :call LookupUsage()<CR>

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
"vnoremap <C-a> :call Incr()<CR>

"function! Echo_phrase()
  "let a = line('.') - line("'<")
  "let c = virtcol("'<")
  "echo "a = " . a
  "echo "c = " . c
"endfunction
"vnoremap <F11> :call Echo_phrase()<CR>
vnoremap <leader><C-a> :call Incr()<CR>

nnoremap <silent> <Space> :call ToggleFoldOrMove()<CR>

function! ToggleFoldOrMove()
  let l:line_num = line(".")
  let l:fold_level = foldlevel(l:line_num)
  if l:fold_level > 0
    " Toggle fold
    execute "normal! za"
  else
    " ow execute the normal bheaviour.
    execute "normal! l"
  endif
endfunction

"nnoremap em :call ExpandCMacro()<CR>

function! ExpandCMacro()
  "get current info
  let l:macro_file_name = "__macroexpand__" . tabpagenr()
  let l:file_row = line(".")
  let l:file_name = expand("%")
  let l:file_window = winnr()
  "create mark
  execute "normal! Iint " . l:macro_file_name . ";"
  silent execute "w"
  "open tiny window ... check if we have already an open buffer for macro
  if bufwinnr( l:macro_file_name ) != -1
    execute bufwinnr( l:macro_file_name) . "wincmd w"
    setlocal modifiable
    execute "normal! ggdG"
  else
    execute "bot 10split " . l:macro_file_name
    "execute "setlocal filetype=cpp"
    execute "setlocal buftype=nofile"
    nnoremap <silent> <buffer> q :bw<CR>
  endif
  "read file with gcc
  for line in readfile("./build/compile_commands.json") 
    if match(line, l:file_name) > 0
      let start_idx = stridx(line, '-I')
      let end_idx = strridx(line, '-o')
      let str_len = end_idx - start_idx
      let l:include_paths = strpart(line, start_idx, str_len)
      break
    endif
  endfor
  let l:output = system("gcc -E " . l:file_name . " " . l:include_paths . "| grep " .  l:macro_file_name)
  let l:str = substitute(l:output, "{", "", "")
  let l:str1 = substitute(l:str, "int " . l:macro_file_name . ";", "", "")
  let l:suc = setline(".", l:str1)
  silent execute "normal! $xx"
  "silent execute "r!gcc -E " . l:file_name . " " . l:include_paths . "| grep " .  l:macro_file_name
  "silent! execute "r!gcc -E " . l:file_name 
  "keep specific macro line
  "silent execute "normal! ggdd"
  "silent execute "normal! ^df;"
  "old code follows to keep macro line
  "silent execute "normal! ggV/int " . l:macro_file_name . ";$\<CR>d"
  "silent execute "normal! jdG"
  "indent
  execute "%!indent -st -kr"
  "silent execute "normal! gg=G"
  ""resize window
  silent execute "normal! G"
  let l:macro_end_row = line(".")
  silent execute "resize " . l:macro_end_row
  "silent execute "normal! gg"
  "no modifiable
  setlocal nomodifiable
  "return to origin place
  execute l:file_window . "wincmd w"
  execute l:file_row
  silent execute "normal!u"
  silent execute "w"
  ""highlight origin line
  "let @/ = getline('.')
endfunction

function! TestFUnctio()
  let l:file_name = expand("%")
  for line in readfile("./build/compile_commands.json") 
    if match(line, l:file_name) > 0
      let start_idx = stridx(line, '-I')
      let end_idx = strridx(line, '-o')
      let str_len = end_idx - start_idx
      let sub_str = strpart(line, start_idx, str_len)
      break
    endif
  endfor
  echo "val =" . sub_str . "END"
endfunction

function! MoveToWindow(to)
  let l:move_dir = a:to
  execute "wincmd " . l:move_dir
  if match(l:move_dir, 'h') == 0
    let l:winwidth = winwidth(0)
    let l:wiw = &wiw
    if l:winwidth == l:wiw
      execute "normal! \<C-W>\<bar>"
    endif
  elseif match(l:move_dir, 'l') == 0
    let l:winwidth = winwidth(0)
    let l:wiw = &wiw
    if l:winwidth == l:wiw
      execute "normal! \<C-W>\<bar>"
    endif
  elseif match(l:move_dir, 'j') == 0
    let l:winheight = winheight(0)
    let l:wh = &wh
    if l:winheight == l:wh
      execute "normal! \<C-W>_"
    endif
  elseif match(l:move_dir, 'k') == 0
    let l:winheight = winheight(0)
    let l:wh = &wh
    if l:winheight == l:wh
      execute "normal! \<C-W>_"
    endif
  else
    echo "What movement you trying son?"
  endif
endfunction
