
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/UltiSnips'
Bundle 'livereload/LiveReload2'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails'
Bundle 'xieyu/pyclewn'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-scripts/CRefVim'
filetype plugin indent on  "must come after bundles and rtp or vundle won't work
syntax enable

set completeopt=longest,menu,preview
set pumheight=15
set lines=45
let mapleader="," " must put before plugins are loaded--otherwise, won't work
let maplocalleader=","
set shortmess+=filmnrxoOtT  
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000  
set clipboard=unnamed
set cmdheight=2                 " helps avoid hit enter prompt
set tabpagemax=15               " Only show 15 tabs
set splitbelow
set hidden "remember changes to a buffer even when abandoned
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set winminheight=0              " Windows can be 0 lines high
set previewheight=12 " affects pyclewn
set ttyfast                     
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=5                 " Minimum lines to keep above and below cursor
set wrap
set splitright              "vertical split to right
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=8                   " An indentation every 8 columns
set softtabstop=4               " Let backspace delete indent
set ttyscroll=3                " cleaner scrolling with fewer flashes
set nofen 
set noswapfile
set nobackup
set novb
set autochdir
set mouse=a "for compying text with a mouse 
set mousehide
scriptencoding utf-8
set ls=2 "always show status line
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
set encoding=utf-8
let g:netrw_silent = 1

" Custom Global Mappings {

command! W w
command! Wq wq
command! WQ wq 
map Q <Nop>
nmap <leader>ot :!open -a iTerm ./<CR><CR>
map <leader>ox :!open -a Excalibur %<CR><CR>
nmap <leader>oV :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader>ov :e ~/dotfiles/vimrc<CR>
nmap <leader>a mcgg=G`c

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
    autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
    autocmd BufEnter * if !has('gui_running') | set term=xterm-256color | endif "for tmux rendering
    autocmd Filetype r vmap <Space> <leader>ss
                \| nmap <Space> <leader>l
    autocmd FileType c map <F9> :!gcc -std=c99 -Wall -Wwrite-strings `pkg-config --cflags glib-2.0` `pkg-config --libs glib-2.0` -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"
                \ | map <F10> :!valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions "%:p:r.out"
                \ |    set columns=181 lines=49




    autocmd Filetype ruby,eruby nmap <Leader>f :make %
                \ | nmap <silent> ,s :sp ~/.vim/bundle/ultisnips/Ultisnips/ruby_my.snippets<CR>
                \ | compiler ruby
                \ | let g:rubycomplete_rails = 1
    autocmd FileType eruby map <Leader>v :!open -a /Applications/Google\ Chrome.app <CR><CR>
    autocmd Filetype matlab  compiler mlint
    autocmd Filetype tex  map <silent> <Leader>ls  
                \ | map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>:redraw!<CR>
                \ | let g:LatexBox_viewer = "open"
                \ | let g:LatexBox_latexmk_async=1
                \ | let g:LatexBox_completion_commands = []
                \ | let g:LatexBox_completion_environments = []
                \ | set columns=82 lines=53

    autocmd  BufWritePost *.tex silent Latexmk

    autocmd FileType html map <Leader>v :!open -a /Applications/Google\ Chrome.app %<CR><CR>
                \ | compiler tidy
                \ | map <buffer> <C-l><C-l> :make <CR><CR>


    autocmd FileType php  map <buffer> <Leader>v :!open -a /Applications/Google\ Chrome.app %<CR><CR> 
    autocmd Filetype lilypond map <buffer> <C-l><C-l> :make <CR>
                \ :cwin <CR><CR>
                \ | compiler lilypond

augroup END
"}





"Plugin Loading {

if filereadable(expand("~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim"))
    set laststatus=2 " Always display the statusline in all windows
    set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


" Nerd-Commenter {
if filereadable(expand("~/.vim/bundle/The-NERD-Commenter/plugin/NERD_commenter.vim"))
    let NERD_c_alt_style=1
endif
" }

" Pyclewn {

if filereadable(expand("~/.vim/bundle/pyclewn/plugin/pyclewn.vim"))
    autocmd FileType c let g:pyclewn_args="--window=bottom --gdb=async"
                \ |    nore <buffer> <space> :C<space>
                \ |    nore <buffer> ;b :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
                \ |    nore <buffer> ;p :exe "Cprint " . expand("<cword>")<CR>
                \ |    nore <buffer> ;s :exe "Cstep"<CR>
                \ |    nore <buffer> ;r :exe "Cstart"<CR>
                \ |    nore <buffer> ;n :exe "Cnext"<CR>
                \ |    nore <buffer> ;c :exe "Ccontinue"<CR>
                \ |    nore <buffer> ;q :exe "Cquit<CR>"
                \ |    nore <buffer> ;P :call Pyclewn1()<CR>
                \ |    nore <buffer> ;dP :call Pyclewn2()<CR>
                \ |    nore <buffer> ;u :exe "Cuntil " . line(".")<CR>
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
                \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
                \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
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
    nnoremap <leader>gt :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

    "autocmd VimEnter  *  nested :TagbarOpen
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
if filereadable(expand("~/.vim/bundle/vim-fugitive/plugin/fugitive.vim"))

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


" Cref {
if filereadable(expand("~/.vim/bundle/CRefVim/plugin/crefvim.vim"))
    vmap <silent> <Leader>mr <Plug>CRV_CRefVimVisual
    nmap <silent> <Leader>mr <Plug>CRV_CRefVimNormal
    map <silent> <Leader>mw <Plug>CRV_CRefVimAsk
    map <silent> <Leader>mc <Plug>CRV_CRefVimInvoke
endif
"}





if has('gui_running')
"set gui options
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

