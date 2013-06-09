if has("gui_running")
  call pathogen#infect()
  call pathogen#helptags()
  filetype off
  filetype on
  set nocompatible
  filetype plugin on
  filetype indent on
  syntax on
  "call pathogen#runtime_append_all_bundles()
  "call pathogen#infect()
  command! Q q
  command! W w
  command! Wq wq
  command! WQ wq 
  let vimrplugin_screenplugin = 0
  let vimrplugin_vimpager = "no"
  let mapleader=","
  let maplocalleader=","
  "let g:solarized_visibility = "high"
  "let g:solarized_contrast = "high"
  "let g:solarized_termcolors = 16
  set number

      "else
    "set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
    "set columns=82 lines=53
  "endif

  let g:molokai_original=1
  colorscheme molokai "other good--moria, gardener, leo, xoria, molokai_custom, molokai! 
  "set bg=light
  let gcr="a:blinkon0" "disable blining cursor
  set clipboard=unnamed "now yanking goes to mac clipboard
  imap <c-space> <c-x><c-o>
  map <F2> :!open -a Excalibur %<CR><CR>
  map <F1> :!open -a iTerm ./<CR><CR>

  match errorMsg /[^\t]\zs\t\+/ "marks tabs not used to indent code
  "set cursorline                  " highlight current line
  set showmatch "show matching braces
  set hidden "remember changes to a buffer even when abandoned
  set showmode "show if in insert, command, etc mode
  set report=0 " shows how many lines were changed after running a command
  let g:rct_completion_use_fri = 1
  nnoremap <silent> <F8> :TagbarToggle<CR>
  let g:tagbar_left=1
  let g:tagbar_width = 50

  "set Tlist_Enable_Fold_Column=0
  "set Tlist_Compact_Format=1
  "let g:SuperTabMappingForward = '<c-k>'
  "let g:SuperTabMappingBackward = '<c-l>'

  set updatetime=1000 "all Tlist stuff
  let g:NERDTreeWinPos = 'right'
  let g:SuperTabDefaultCompletionType = "context"
  "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
  "let g:UltiSnipsExpandTrigger="<tab>"
  "let g:UltiSnipsJumpForwardTrigger="<tab>"
  "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  let g:SuperTabMappingForward = '<s-tab>'
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
  "set backspace=indent,eol,start
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
  set noswapfile
  set nobackup
  set autochdir
  "set directory=/Users/davidkarapetyan/.swapbackup
  "set backupdir=/Users/davidkarapetyan/.swapbackup
  "set mouse=r "for compying text with a mouse with terminal
  set mouse=a "for compying text with a mouse with gui
  "set shortmess=astToOI 
  "set shortmess+=filmnrxoOtT
  "to avoid hit-enter prompts"
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
    autocmd Filetype r vmap <Space> <leader>ss
	  \| nmap <Space> <leader>l
    "for the vimr plugin
    "autocmd FileType c map <F9> :!clang -g -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
    "autocmd FileType cpp map <F9> :!clang++ -g -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
    autocmd FileType c map <F9> :!gcc  -Wall -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
			    \ | set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
			    \ |    set columns=181 lines=49
			    \ |   let g:Tlist_Auto_Open=1
			    \ | nested :TagbarOpen
    autocmd VimEnter c       nested :TagbarOpen


    "autocmd FileType cpp map <F9> :!g++ -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>

    "autocmd BufWinEnter * lcd ~/math
    "autocmd TabEnter * lcd ~/math
    autocmd FileType make setlocal noexpandtab
    autocmd Filetype ruby,eruby nmap <Leader>f :make %
	  \ | nmap <silent> ,s :sp ~/.vim/bundle/ultisnips/Ultisnips/ruby_my.snippets<CR>
	  \ | compiler ruby
	  \ | let g:rubycomplete_rails = 1
    "\ | let g:rubycomplete_buffer_loading = 1
    "\ | let g:rubycomplete_classes_in_global = 1
    "improve autocomplete menu color
    "highlight Pmenu ctermbg=238 gui=bold
    autocmd Filetype matlab  compiler mlint
    autocmd Filetype tex  map <silent> <Leader>ls  
	  \ | map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
	  \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p"<CR>
	  \ | let g:LatexBox_viewer = "open"
	  \ | let g:LatexBox_latexmk_options = "-pvc"
	  \ | let g:LatexBox_completion_commands = []
	  \ | let g:LatexBox_completion_environments = []
	  \ | set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
	  \ | set columns=82 lines=53

    autocmd FileType html map <Leader>v :!open -a /Applications/Google\ Chrome.app %<CR><CR>
	  \ | compiler tidy
	  \ | map <buffer> <C-l><C-l> :make <CR><CR>

    autocmd FileType eruby map <Leader>v :!open -a /Applications/Google\ Chrome.app <CR><CR>

    "autocmd FileType html set lines=23 columns=180 formatoptions=w2nrtcq tw=0
    "autocmd FileType php set lines=23 columns=180 formatoptions=w2nrtcq tw=0
    autocmd FileType php  map <buffer> \lv :!open -a /Applications/Google\ Chrome.app %<CR><CR> 
    autocmd Filetype lilypond map <buffer> <C-l><C-l> :make <CR>
	  \ :cwin <CR><CR>
	  \ | compiler lilypond

    "autocmd bufenter * exe "lcd ".escape(expand("%:p:h"), " ")
    "
    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    "autocmd FileType ruby set omnifunc=rubycomplete#Complete

    "autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    "autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    "autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    "autocmd FileType c set omnifunc=ccomplete#Complete
    ":filetype detect
  augroup END


endif


if !has("gui_running")


  filetype on
  set nocompatible
  syntax enable
  command! Q q
  command! W w
  command! Wq wq
  command! WQ wq 
  set antialias 
  set ruler  "show cursor position               
  set shiftwidth=4
  set ignorecase "ignore capitals in search"
  set smartcase  "overrides ignorecase when you use cap letters in search"
  set nofen 
  set noswapfile
  set nobackup
  set autochdir
  set mouse=a "for compying text with a mouse with gui
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
endif
