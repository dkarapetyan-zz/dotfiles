set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'fugitive.vim'
Bundle 'The-NERD-Commenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'UltiSnips'
Bundle 'livereload/LiveReload2'
Bundle 'LaTeX-Box'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ctrlp.vim'
Bundle 'rails.vim'
Bundle 'benmills/vimux'
Bundle 'xieyu/pyclewn'
Bundle 'flazz/vim-colorschemes'
filetype plugin indent on  "must come after bundles and rtp or vundle won't work
syntax on

"let g:rehash256 = 1
"let g:molokai_original=1
"colorscheme molokai
"autocmd filetype * highlight tagbarsignature ctermfg=bg 
set completeopt=longest,menu
set pumheight=15
set lines=45
let mapleader="," " must put before plugins are loaded--otherwise, won't work
let maplocalleader=","
set shortmess+=filmnrxoOtT  
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000  
set clipboard=unnamed
set tabpagemax=15               " Only show 15 tabs
set splitbelow
set hidden "remember changes to a buffer even when abandoned
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
"set lazyredraw
set previewheight=5 " affects pyclewn
set ttyfast                     
set number                         " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=5                 " Minimum lines to keep above and below cursor
set nowrap
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set ttyscroll=3                " cleaner scrolling with fewer flashes
set nofen 
set noswapfile
set nobackup
set novb
set autochdir
set mouse=a "for compying text with a mouse 
set mousehide
set ls=2 "always show status line
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
set encoding=utf-8
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


" Custom Global Mappings {

command! Q q
command! W w
command! Wq wq
command! WQ wq 
map <F1> :!open -a iTerm ./<CR><CR>
map <F2> :!open -a Excalibur %<CR><CR>
nmap <leader>oV :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader>ov :e ~/dotfiles/vimrc<CR>
nnoremap Y y$
noremap j gj
noremap k gk
nnoremap K <nop>
command! Q q
command! W w
command! Wq wq
command! WQ wq 
"}


"Custom Autocmd Mappings {
augroup vimrc_autocmds
    au!
    autocmd Filetype r vmap <Space> <leader>ss
                \| nmap <Space> <leader>l
    autocmd FileType c map <F9> :!gcc -std=c99 -Wall -Wwrite-strings -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"
                \ | map <F10> :!valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions "%:p:r.out"
                \ |    set columns=181 lines=49




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
"}





"Plugin Loading {

" Nerd-Commenter {
if filereadable(expand("~/.vim/bundle/The-NERD-Commenter/plugin/NERD_commenter.vim"))
    let NERD_c_alt_style=1
endif
" }

" Pyclewn {

if filereadable(expand("~/.vim/bundle/pyclewn/plugin/pyclewn.vim"))
    let g:pyclewn_args="--window=bottom --gdb=async"
    nore <space> :C<space>
    nore ;b :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
    nore ;p :exe "Cprint " . expand("<cword>")<CR>
    nore ;s :exe "Cstep"<CR>
    nore ;r :exe "Cstart"<CR>
    nore ;n :exe "Cnext"<CR>
    nore ;c :exe "Ccontinue"<CR>
    nore ;q :exe "Cquit<CR>"
    nore ;P :call Pyclewn1()<CR>
    nore ;dP :call Pyclewn2()<CR>

    nore ;u :exe "Cuntil " . line(".")<CR>

    fun! Pyclewn1()
        normal gv"ay
        execute "Cprint " . @a
    endfun

    fun! Pyclewn2()
        normal gv"ay
        execute "Cprint *" . @a
    endfun


endif
" }

" Supertab {
if filereadable(expand("~/.vim/bundle/supertab/plugin/supertab.vim"))
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabMappingForward = '<c-n>'
    let g:SuperTabMappingBackward = '<c-p>'
    let g:SuperTabLongestHighlight = 1
    let g:SuperTabLongestEnhanced = 1
endif

"}

" Ultisnips {
if filereadable(expand("~/.vim/bundle/UltiSnips/plugin/UltiSnips.vim"))
    let g:UltiSnipsSnippetDirectories=["my_snippets"]
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    nmap <leader>os :UltiSnipsEdit<CR>
    let g:UltiSnipsEditSplit="horizontal" 
endif

" }

" Ctrlp {
if filereadable(expand("~/.vim/bundle/ctrlp.vim/plugin/ctrlp.vim"))
    nmap <leader>be :CtrlPBuffer<CR>
    let g:ctrlp_prompt_mappings = {
                \ 'PrtBS()':              ['<bs>', '<c-]>'],
                \ 'PrtDelete()':          ['<del>'],
                \ 'PrtDeleteWord()':      ['<c-w>'],
                \ 'PrtClear()':           ['<c-u>'],
                \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
                \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
                \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
                \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
                \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
                \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
                \ 'PrtHistory(-1)':       ['<c-n>'],
                \ 'PrtHistory(1)':        ['<c-p>'],
                \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
                \ 'AcceptSelection("t")': ['<c-t>'],
                \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
                \ 'ToggleFocus()':        ['<s-tab>'],
                \ 'ToggleRegex()':        ['<c-r>'],
                \ 'ToggleByFname()':      ['<c-d>'],
                \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
                \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
                \ 'PrtExpandDir()':       ['<tab>'],
                \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
                \ 'PrtInsert()':          ['<c-\>'],
                \ 'PrtCurStart()':        ['<c-a>'],
                \ 'PrtCurEnd()':          ['<c-e>'],
                \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
                \ 'PrtCurRight()':        ['<c-l>', '<right>'],
                \ 'PrtClearCache()':      ['<F5>'],
                \ 'PrtDeleteEnt()':       ['<F7>'],
                \ 'CreateNewFile()':      ['<c-y>'],
                \ 'MarkToOpen()':         ['<c-z>'],
                \ 'OpenMulti()':          ['<c-o>'],
                \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
                \ }
endif

" }

" YCM {
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

endif

" }
"
" Easytags {
if filereadable(expand("~/.vim/bundle/vim-easytags/plugin/easytags.vim"))
    let g:easytags_events = ['BufWritePost']
    let g:easytags_updatetime_warn = 0
    "let g:easytags_include_members = 1
    "highlight link cMember Special
    "highlight cMember gui=italic
endif
" }



" Solarized {
if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/solarized.vim"))
    let g:solarized_termtrans = 1
    let g:solarized_termcolors=16
    let g:solarized_visibility="low"
    set bg=dark
    colorscheme solarized
endif

" }

" Syntastic {
if filereadable(expand("~/.vim/bundle/syntastic/plugin/syntastic.vim"))
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
endif

"}
"
" TagBar {
if filereadable(expand("~/.vim/bundle/tagbar/plugin/tagbar.vim"))

    autocmd VimEnter  *  nested :TagbarOpen
    nnoremap <silent><leader>tt :TagbarToggle<CR>
    let g:tagbar_width = 30
    let g:tagbar_sort = 1
    let g:tagbar_left=1
    "highlight TagbarNestedKind guifg=Blue ctermfg=Blue
    "highlight TagbarSignature guifg=#272822 guibg=#272822 
    "highlight link Type Normal
    "highlight clear Type
    "highlight clear Structure
    "highlight clear Keyword
endif
"}

" Fugitive {
if filereadable(expand("~/.vim/bundle/fugitive.vim/plugin/fugitive.vim"))

    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
    nnoremap <silent> <leader>gg :GitGutterToggle<CR>
endif
"}








if has('gui_running')
    set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
    set clipboard=unnamed
    set antialias
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=T
    set guioptions-=t
    set guioptions-=b "turn off scrollbars and toolbar
    let gcr="a:blinkon0" 
    "autocmd filetype * highlight tagbarsignature guifg=bg 
endif

