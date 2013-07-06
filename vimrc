set nocompatible
filetype off
filetype plugin indent on 
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
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
Bundle 'ctrlp.vim'
Bundle 'rails.vim'


"Plugin Loading {

if filereadable(expand("~/.vim/bundle/supertab/plugin/supertab.vim"))
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabMappingForward = '<c-n>'
    let g:SuperTabMappingBackward = '<c-p>'
    let g:SuperTabLongestHighlight = 1
    let g:SuperTabLongestEnhanced = 1
endif

if filereadable(expand("~/.vim/bundle/ctrlp.vim/plugin/ctrlp.vim"))
    nmap <leader>be :CtrlPBuffer<CR>
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

endif

if filereadable(expand("~/.vim/bundle/vim-easytags/plugin/easytags.vim"))
    let g:easytags_events = ['BufWritePost']
    let g:easytags_updatetime_warn = 0
endif

if filereadable(expand("~/.vim/bundle/UltiSnips/plugin/UltiSnips.vim"))
    let g:UltiSnipsSnippetDirectories=[".my_snippets"]
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/solarized.vim"))
    set bg=dark
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized                 " Load a colorscheme
    autocmd filetype * highlight tagbarsignature ctermfg=green 
    "colorscheme molokai 
    "let g:molokai_original=1
endif

"}

set completeopt=longest,menu
set pumheight=15
set lines=45
let mapleader=","
let maplocalleader=","
set shortmess+=filmnrxoOtT  
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000  
set tabpagemax=15               " Only show 15 tabs
set splitbelow
set hidden "remember changes to a buffer even when abandoned
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                         " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nowrap
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nofen 
set noswapfile
set nobackup
set autochdir
set mouse=a "for compying text with a mouse 
set mousehide
set ls=2 "always show status line
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
scriptencoding utf-8
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


" Custom Global Mappings {

command! Q q
command! W w
command! Wq wq
command! WQ wq 
map <F1> :!open -a iTerm ./<CR><CR>
map <F2> :!open -a Excalibur %<CR><CR>
nnoremap Y y$
noremap j gj
noremap k gk
nnoremap K <nop>
command! Q q
command! W w
command! Wq wq
command! WQ wq 
map <F1> :!open -a iTerm ./<CR><CR>
map <F2> :!open -a Excalibur %<CR><CR>
"}


"Custom Autocmd Mappings {
augroup vimrc_autocmds
    au!
    autocmd Filetype r vmap <Space> <leader>ss
                \| nmap <Space> <leader>l
    autocmd FileType c map <F9> :!gcc -std=c99 -Wall -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"
                \ | map <F10> :!valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions "%:p:r.out"
                \ |    set columns=181 lines=49

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
"}



" Syntastic {
if filereadable(expand("~/.vim/bundle/syntastic/plugin/syntastic.vim"))
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
endif

" TagBar {
if filereadable(expand("~/.vim/bundle/tagbar/plugin/tagbar.vim"))

    nnoremap <silent> <leader>tt :TagbarToggle<CR>
    let g:tagbar_width = 30
    let g:tagbar_sort = 1
    let g:tagbar_left=0
    "highlight TagbarNestedKind guifg=Blue ctermfg=Blue
    "highlight TagbarSignature guifg=#272822 guibg=#272822 
    "highlight link Type Normal
    "highlight clear Type
    "highlight clear Structure
    "highlight clear Keyword
endif
"}

" Fugitive }
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







if has('gui')
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
    autocmd filetype * highlight tagbarsignature guifg=bg 
endif

