if has("gui_running")
    call pathogen#infect()
    call pathogen#helptags()
    filetype off
    filetype on
    set nocompatible
    filetype plugin on
    filetype indent on
    syntax on
    set guifont=Consolas:h12 "Menlo:h12, Monaco:h12, Consolas:h12
    set completeopt=menu,longest




    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'/.gosh_completions'
		\ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
	return neocomplete#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'








    "command! Q q
    "command! W w
    "command! Wq wq
    "command! WQ wq 
    let vimrplugin_screenplugin = 0
    let vimrplugin_vimpager = "no"
    let mapleader=","
    let maplocalleader=","
    let g:easytags_updatetime_warn = 0
    let g:easytags_on_cursorhold = 1
    let g:UltiSnipsSnippetDirectories=[".my_snippets"]

    colorscheme molokai 
    let g:molokai_original=1
    set bg=dark
    let gcr="a:blinkon0" 
    set clipboard=unnamed 
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
    set splitbelow
    set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
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
    set splitbelow
    set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
endif
augroup reload_vimrc 
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END 
