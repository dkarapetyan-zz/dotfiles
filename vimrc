set runtimepath+=/Users/davidkarapetyan/.vim/bundle/vim-pathogen
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
command! Q q
command! W w
command! Wq wq
command! WQ wq

if has("gui_running")
  colorscheme solarized "other good--moria, gardener, leo, xoria, molokai_custom, molokai! 
set bg=dark
set guifont=Menlo:h12 "Monaco:h12, Consolas:h12
set columns=82 lines=53
endif

set gcr=a:blinkon0" "disable blining cursor
set nocompatible
set clipboard=unnamed "now yanking goes to mac clipboard
nmap <silent> ,t :CommandT<CR>
nmap <silent> ,b :CommandTBuffer<CR>
map <F1> :!open -a Excalibur %<CR><CR>
  map <F2> :!open -a Mail %<CR><CR>
  map <F3> :!open -a Terminal ./<CR><CR>

match errorMsg /[^\t]\zs\t\+/ "marks tabs not used to indent code
set cursorline                  " highlight current line
set showmatch "show matching braces
set hidden "remember changes to a buffer even when abandoned
set showmode "show if in insert, command, etc mode
set report=0 " shows how many lines were changed after running a command
let g:rct_completion_use_fri = 1
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_SingleClick = 0
let Tlist_Show_One_File=1 "display tags for only current buffer
"set Tlist_Enable_Fold_Column=0
"set Tlist_Compact_Format=1
let g:SuperTabMappingForward = '<c-n>'
let g:SuperTabMappingBackward = '<c-p>'

set updatetime=1000 "all Tlist stuff
let g:NERDTreeWinPos = 'right'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"let g:SuperTabMappingForward = '<s-tab>'
"let g:SuperTabMappingBackward = '<tab>'
"let g:SuperTabLongestHighlight = 1
set antialias 
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=t
set guioptions-=b "turn off scrollbars and toolbar
set ruler  "show cursor position               
set backspace=indent,eol,start
set shiftwidth=2
"set wrap
"set tabstop=2
"set softtabstop=2
"set expandtab
"set smarttab
"set virtualedit=all  "allow cursor to go anywhere in command mode
"set wrapmargin=1 "wraps 1 characters before you hit end of cursor
"set textwidth=80 
set ignorecase "ignore capitals in search"
set smartcase  "overrides ignorecase when you use cap letters in search"
set nofen 
filetype indent plugin on
syntax on
set noswapfile
set nobackup
set autochdir
"set directory=/Users/davidkarapetyan/.swapbackup
"set backupdir=/Users/davidkarapetyan/.swapbackup
set mouse=a "for compying text with a mouse
"set shortmess=astToOI 
"set shortmess+=filmnrxoOtT
"to avoid hit-enter prompts"
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ 
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
"autoclose syntastic error list
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

noremap j gj
noremap k gk
nnoremap K <nop>
set ls=2 "always show status line
set showcmd
"set lazyredraw " Do not redraw while running macros (much faster).
"set ttyfast "smoother changes
"set report=0 " tell us when anything is changed via :...
set autoread "auto reload a file that has changed
"set cmdheight=2 "to avoid hit-enter prompts
set completeopt=menu,preview
set splitbelow
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
augroup vimrc_autocmds
  au!
  autocmd BufWinEnter * lcd ~/math
  autocmd TabEnter * lcd ~/math
  autocmd FileType make setlocal noexpandtab
  autocmd Filetype ruby,eruby nmap ,f :make %
	\ | nmap <silent> ,s :sp ~/.vim/bundle/ultisnips/Ultisnips/my_ruby.snippets<CR>
	\ | compiler ruby
	"\ | let g:rubycomplete_buffer_loading = 1
	"\ | let g:rubycomplete_rails = 1
	"\ | let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold
  autocmd Filetype matlab  compiler mlint
  "autocmd Filetype tex  map <silent> ,f :silent !/Applications/Skim.app/Contents/SharedSupport/displayline \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
	"\ | let g:LatexBox_viewer = "open"
	"\ | let g:LatexBox_latexmk_options = "-pvc"
	"\ | let g:LatexBox_completion_commands = []
	"\ | let g:LatexBox_completion_environments = []
  autocmd FileType html map <buffer>
	\lv :!open -a /Applications/Google\ Chrome.app %<CR><CR>
	\ | compiler tidy
	\ | map <buffer> <C-l><C-l> :make <CR><CR>

  "autocmd FileType html set lines=23 columns=180 formatoptions=w2nrtcq tw=0
  "autocmd FileType php set lines=23 columns=180 formatoptions=w2nrtcq tw=0
  autocmd FileType php  map <buffer> \lv :!open -a /Applications/Google\ Chrome.app %<CR><CR> 
  autocmd Filetype lilypond map <buffer> <C-l><C-l> :make <CR>
	\ :cwin <CR><CR>
	\ | compiler lilypond
  "autocmd bufenter * exe "lcd ".escape(expand("%:p:h"), " ")
  :filetype detect
augroup END


