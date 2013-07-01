if has("gui_running")
    call pathogen#infect()
    call pathogen#helptags()
    filetype off
    filetype on
    set nocompatible
    filetype plugin on
    filetype indent on
    syntax on
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

    "let g:easytags_include_members = 1
    set number
    "let g:UltiSnipsExpandTrigger="<c-tab>"
    "let g:UltiSnipsListSnippets="<c-s-tab>"

    colorscheme molokai 
    let g:molokai_original=1
    set bg=dark
    let gcr="a:blinkon0" 
    set clipboard=unnamed 
    imap <c-space> <c-x><c-o>
    map <F2> :!open -a Excalibur %<CR><CR>
    map <F1> :!open -a iTerm ./<CR><CR>

    match errorMsg /[^\t]\zs\t\+/ 

    set showmatch "show matching braces
    set hidden "remember changes to a buffer even when abandoned
    set showmode "show if in insert, command, etc mode
    set report=0 " shows how many lines were changed after running a command
    let g:rct_completion_use_fri = 1
    nnoremap <silent> <F8> :TagbarToggle<CR>
    let g:tagbar_width = 50
    let g:tagbar_sort = 1
    "highlight TagbarNestedKind guifg=Blue ctermfg=Blue
    "highlight TagbarSignature guifg=#272822 guibg=#272822 
    "highlight link Type Normal
    "highlight link TagbarSignature NonText

    highlight TagbarSignature guifg=bg 

    "highlight clear Type
    "highlight clear Structure

    "highlight clear Keyword


    let g:TagHighlightSettings = {'TagHL-Recurse': '0'} 
    "let g:NERDTreeWinPos = 'left'
    let g:SuperTabDefaultCompletionType = "context"
    "let g:SuperTabMappingForward = '<s-tab>'
    set antialias 
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=T
    set guioptions-=t
    set guioptions-=b "turn off scrollbars and toolbar
    set ruler  "show cursor position               
    "set rulerformat=%-14.(%c%)\ %P
    set shiftwidth=4
    set ignorecase "ignore capitals in search"
    set smartcase  "overrides ignorecase when you use cap letters in search"
    set nofen 
    set noswapfile
    set nobackup
    set autochdir
    set mouse=a "for compying text with a mouse with gui
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2

    nnoremap <silent> <F8> :TagbarToggle<CR>
    let g:tagbar_left=0
    let g:tagbar_width = 30





    noremap j gj
    noremap k gk
    nnoremap K <nop>
    set ls=2 "always show status line
    set showcmd
    set autoread "auto reload a file that has changed
    set completeopt=menu,preview
    set splitbelow
    set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
    augroup vimrc_autocmds
	au!

	autocmd Filetype r vmap <Space> <leader>ss
		    \| nmap <Space> <leader>l
	autocmd FileType c map <F9> :!gcc  -Wall -ggdb -o "%:p:r.out" "%:p" && "%:p:r.out"
		    \ | map <F10> :!valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions "%:p:r.out"
		    \ | set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
		    \ |    set columns=181 lines=49
		    \ | set omnifunc=ccomplete#Complete


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
		    \ | set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
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


endif



if !has("gui_running")


    filetype on
    set nocompatible
    syntax enable
    nnoremap Q <nop>
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
    set autoread "auto reload a file that has changed
    set completeopt=menu,preview
    set splitbelow
    set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
endif
augroup reload_vimrc 
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END 
