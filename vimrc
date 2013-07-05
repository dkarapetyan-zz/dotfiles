set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'fugitive.vim'
Bundle 'The-NERD-Commenter'
Bundle 'syntastic'
Bundle 'tagbar'
Bundle 'flazz/vim-colorschemes'
Bundle 'UltiSnips'
Bundle 'livereload/LiveReload2'
Bundle 'LaTeX-Box'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'Lokaltog/vim-powerline'
filetype plugin indent on 
syntax on
if has('gui')
    set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
endif
set completeopt=longest,menu
set pumheight=15
set lines=45

command! Q q
command! W w
command! Wq wq
command! WQ wq 
let vimrplugin_screenplugin = 0
let vimrplugin_vimpager = "no"
let mapleader=","
let maplocalleader=","
let g:easytags_updatetime_warn = 0
let g:easytags_on_cursorhold = 1
let g:UltiSnipsSnippetDirectories=[".my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
if filereadable(expand("~/.vim/bundle/supertab/plugin/supertab.vim"))
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabMappingForward = '<c-n>'
    let g:SuperTabMappingBackward = '<c-p>'
    let g:SuperTabLongestHighlight = 1
    let g:SuperTabLongestEnhanced = 1
endif
if filereadable(expand("~/.vim/bundle/YouCompleteMe/plugin/youcompleteme.vim"))
    let g:ycm_filetype_blacklist = {
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'text' : 1,
                \}
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_allow_changing_updatetime = 0
    let g:ycm_global_ycm_extra_conf = '/Users/davidkarapetyan/.ycm_extra_conf.py'
    autocmd BufWritePost *.c,*.cpp,*.h silent YcmForceCompileAndDiagnostics
    "noremap <c-l><c-l>  :YcmForceCompileAndDiagnostics<CR>:write<CR>

endif
if filereadable(expand("~/.vim/bundle/vim-easytags/plugin/easytags.vim"))
    let g:easytags_events = ['BufWritePost']
endif

let gcr="a:blinkon0" 
if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

map <F2> :!open -a Excalibur %<CR><CR>
map <F1> :!open -a iTerm ./<CR><CR>
set shortmess+=filmnrxoOtT  
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000  
if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/solarized.vim"))
    set bg=dark
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized                 " Load a colorscheme
endif

"colorscheme molokai 
"let g:molokai_original=1
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set splitbelow





"match errorMsg /[^\t]\zs\t\+/

set hidden "remember changes to a buffer even when abandoned
set showmode "show if in insert, command, etc mode
set report=0 " shows how many lines were changed after running a command
let g:rct_completion_use_fri = 1
let g:tagbar_width = 50
let g:tagbar_sort = 1
"highlight TagbarNestedKind guifg=Blue ctermfg=Blue
"highlight TagbarSignature guifg=#272822 guibg=#272822 
"highlight link Type Normal

"highlight clear Type
"highlight clear Structure

"highlight clear Keyword
let g:TagHighlightSettings = {'TagHL-Recurse': '0'}
set antialias
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=t
set guioptions-=b "turn off scrollbars and toolbar
"set ruler  "show cursor position
"set rulerformat=%-14.(%c%)\ %P
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd
"if has('statusline')
"set laststatus=2

"" Broken down into easily includeable segments
"set statusline=%<%f\                     " Filename
"set statusline+=%w%h%m%r                 " Options
"set statusline+=%{fugitive#statusline()} " Git Hotness
"set statusline+=\ [%{&ff}/%Y]            " Filetype
"set statusline+=\ [%{getcwd()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
"set incsearch                   " Find as you type search
"set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent




set ignorecase "ignore capitals in search"
set smartcase  "overrides ignorecase when you use cap letters in search"
set nofen 
set noswapfile
set nobackup
set autochdir
set mouse=a "for compying text with a mouse 
set mousehide
scriptencoding utf-8

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:tagbar_left=0
let g:tagbar_width = 30

"if has("autocmd") && exists("+omnifunc")
"autocmd Filetype *
"\if &omnifunc == "" |
"\setlocal omnifunc=syntaxcomplete#Complete |
"\endif
"endif






" TagBar {
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}





nnoremap Y y$
noremap j gj
noremap k gk
nnoremap K <nop>
set ls=2 "always show status line
set showcmd
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
augroup vimrc_autocmds
    au!

    autocmd Filetype r vmap <Space> <leader>ss
                \| nmap <Space> <leader>l
    autocmd FileType c map <F9> :!gcc -std=c99 -Wall -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"
                \ | map <F10> :!valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions "%:p:r.out"
                \ |    set columns=181 lines=49
    autocmd Filetype * highlight TagbarSignature guifg=bg 



    autocmd VimEnter  *  nested :TagbarOpen



    autocmd FileType make setlocal noexpandtab
    autocmd Filetype ruby,eruby nmap <Leader>f :make %
                \ | nmap <silent> ,s :sp ~/.vim/bundle/ultisnips/Ultisnips/ruby_my.snippets<CR>
                \ | compiler ruby
                \ | let g:rubycomplete_rails = 1
    autocmd Filetype matlab  compiler mlint
    autocmd Filetype tex  map <silent> <Leader>ls  
                \ | map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p"<CR>
                \ | let g:LatexBox_viewer = "open"
                \ | let g:LatexBox_latexmk_options = "-pvc"
                \ | let g:LatexBox_completion_commands = []
                \ | let g:LatexBox_completion_environments = []
                \ | set columns=82 lines=53

    autocmd FileType html map <Leader>v :!open -a /Applications/Google\ Chrome.app %<CR><CR>
                \ | compiler tidy
                \ | map <buffer> <C-l><C-l> :make <CR><CR>

    autocmd FileType eruby map <Leader>v :!open -a /Applications/Google\ Chrome.app <CR><CR>

    autocmd FileType php  map <buffer> \lv :!open -a /Applications/Google\ Chrome.app %<CR><CR> 
    autocmd Filetype lilypond map <buffer> <C-l><C-l> :make <CR>
                \ :cwin <CR><CR>
                \ | compiler lilypond

augroup END






