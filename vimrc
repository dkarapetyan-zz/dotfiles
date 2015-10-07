"Global Defaults  {

if 1

	set nocompatible
	filetype off

	set rtp+=~/.vim/bundle/Vundle.vim/
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'SirVer/UltiSnips'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
	Plugin 'honza/vim-snippets'
	Plugin 'bling/vim-airline'
	call vundle#end()
	filetype plugin indent on  
	syntax on

	let mapleader="," " must put before plugins are loaded--otherwise, won't work
	let maplocalleader=","
	let g:tex_flavor="latex"
	let g:solarized_termtrans = 1
	let g:solarized_contrast = "high"
	let g:solarized_visibility = "high"
	"let g:solarized_hitrail = 1
	let g:solarized_menu = 0
	colorscheme solarized
	set bg=dark
	"highlight clear Type 
	"highlight link cTypeTag Include
	"call togglebg#map("<F5>")
	set completeopt=longest,menu
	set pumheight=15
	set lines=45
	set textwidth=80
	set linebreak
	set t_Co=256
	set shortmess+=filmnrxoOtT  
"	set virtualedit=onemore             " Allow for cursor beyond last character
	set history=1000  
	set clipboard=unnamed
	set cmdheight=2                 " helps avoid hit enter prompt
	set tabpagemax=15               " Only show 15 tabs
	set hidden "remember changes to a buffer even when abandoned
	set backspace=indent,eol,start  " Backspace for dummies
	set linespace=0                 " No extra spaces between rows
	set winminheight=0              " Windows can be 0 lines high
	set ttyfast                     
	set showmatch                   " Show matching brackets/parenthesis
	set winminheight=0              " Windows can be 0 line high
	set ignorecase                  " Case insensitive search
	set smartcase                   " Case sensitive when uc present
	set wildmenu                    " Show list instead of just completing
	set cursorline
	set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
	set scrolljump=5                " Lines to scroll when cursor leaves screen
	set scrolloff=5                 " Minimum lines to keep above and below cursor
	set wrap
	set splitbelow
	set splitright              "vertical split to right
	set autoindent                  " Indent at the same level of the previous line
	set shiftwidth=2                " Use indents of 4 spaces
	"set expandtab                   " Tabs are spaces, not tabs
	set tabstop=2                   " An indentation every 8 columns
	set softtabstop=2               " Let backspace delete indent
	set ttyscroll=3                " cleaner scrolling with fewer flashes
	set nofen 
	set noswapfile
	set backup
	set backupdir=~/.vim/.backup//
	set directory=~/.vim/.swp//
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

	inoremap <C-f> <right>
	inoremap <C-n> <down>
	inoremap <C-p> <up>
	noremap Q <Nop>
	nnoremap <leader>ot :!open -a iTerm ./<CR><CR>
	noremap <leader>ox :!open -a Excalibur %<CR><CR>
	nnoremap <leader>oV :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
	nnoremap <leader>ov :sp ~/dotfiles/vimrc<CR>
	nnoremap <leader>a mcgg=G`c
	nnoremap Y y$
	noremap j gj
	noremap k gk
	nnoremap K <nop>
	command! Q q
	command! W w
	command! Wq wq
	command! WQ wq 

endif
"}

 "GUI defaults {

if has('gui_running')
	set clipboard=unnamed
	set guioptions-=L
	set guioptions-=l
	set guioptions-=R
	set guioptions-=r
	set guioptions-=T
	set guioptions-=t
	set guioptions-=b "turn off scrollbars and toolbar
	"set guifont=Inconsolata\ For\ Powerline:h13
	set guifont=Inconsolata:h16
	"let gcr="a:blinkon0" 
	"autocmd filetype * highlight tagbarsignature guifg=bg 
endif
"}


"Custom Autocmd Mappings {
augroup vimrc_autocmds
	au!
	autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
	autocmd BufEnter * if !has('gui_running')
				\	| set term=xterm-256color | endif "for tmux rendering
	autocmd BufEnter *.tex set iskeyword+=:
	"autocmd BufWritePost *.tex :call Tex_CompileMultipleTimes()
	"autocmd Filetype tex inoremap <buffer> <Leader>a \alpha
			"\|inoremap <buffer> <Leader>b \beta
			"\|inoremap <buffer> <Leader>c \chi
			"\|inoremap <buffer> <Leader>d \delta
			"\|inoremap <buffer> <Leader>e \varepsilon
			"\|inoremap <buffer> <Leader>f \varphi
			"\|inoremap <buffer> <Leader>g \gamma
			"\|inoremap <buffer> <Leader>h \eta
			"\|inoremap <buffer> <Leader>i \iota
			"\|inoremap <buffer> <Leader>k \kappa
			"\|inoremap <buffer> <Leader>l \lambda
			"\|inoremap <buffer> <Leader>m \mu
			"\|inoremap <buffer> <Leader>n \nu
			"\|inoremap <buffer> <Leader>o \omega
			"\|inoremap <buffer> <Leader>p \pi
			"\|inoremap <buffer> <Leader>q \theta
			"\|inoremap <buffer> <Leader>r \rho
			"\|inoremap <buffer> <Leader>s \sigma
			"\|inoremap <buffer> <Leader>t \tau
			"\|inoremap <buffer> <Leader>u \upsilon
			"\|inoremap <buffer> <Leader>v \vee
			"\|inoremap <buffer> <Leader>w \wedge
			"\|inoremap <buffer> <Leader>x \xi
			"\|inoremap <buffer> <Leader>y \psi
			"\|inoremap <buffer> <Leader>z \zeta
			"\|inoremap <buffer> <Leader>D \Delta
			"\|inoremap <buffer> <Leader>I \Iota
			"\|inoremap <buffer> <Leader>F \Phi
			"\|inoremap <buffer> <Leader>G \Gamma
			"\|inoremap <buffer> <Leader>L \Lambda
			"\|inoremap <buffer> <Leader>N \nabla
			"\|inoremap <buffer> <Leader>O \Omega
			"\|inoremap <buffer> <Leader>Q \Theta
			"\|inoremap <buffer> <Leader>R \varrho
			"\|inoremap <buffer> <Leader>S \Sigma
			"\|inoremap <buffer> <Leader>U \Upsilon
			"\|inoremap <buffer> <Leader>X \Xi
			"\|inoremap <buffer> <Leader>Y \Psi
			"\|inoremap	<buffer> ^ ^{}<Left>
			"\|inoremap	<buffer> _ _{}<Left>
			"\|inoremap	<buffer> $ $$<Left>
			"\|inoremap	<buffer> ( ()<Left>
			"\|inoremap <buffer> { {}<Left>
			"\|inoremap	<buffer> | ||<Left>
			"\|inoremap <buffer> [ []<Left>
augroup END
"}


"Plugin Loading {

" Vim-Latex { Requires vim 7.4+ to work properly with Ultisnips
if filereadable(expand("~/.vim/bundle/vim-latex/ftplugin/latex-suite/texrc"))
	let g:Tex_DefaultTargetFormat = 'pdf'
	let g:Tex_ViewRule_pdf = 'open -a Skim'
	map <c-space> :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR>:redraw!<CR>
"}
endif

" Ultisnips { Requires vim 7.4+
if filereadable(expand("~/.vim/bundle/UltiSnips/plugin/UltiSnips.vim"))
	"let g:UltiSnipsSnippetDirectories=["my_snippets"]
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	nmap <leader>os :UltiSnipsEdit<CR>
	let g:UltiSnipsEditSplit="horizontal"
	"inoremap <silent> $ $<C-R>=UltiSnips#Anon('\$$1\$', '$', '', 'i')<cr>
	"inoremap <silent> [ [<C-R>=UltiSnips#Anon('[$1]', '[', '', 'i')<cr>
	"inoremap <silent> _ _<C-R>=UltiSnips#Anon('_{$1}', '_', '', 'i')<cr>
	"inoremap <silent> ^ ^<C-R>=UltiSnips#Anon('^{$1}', '^', '', 'i')<cr>
	"inoremap <silent> ( (<C-R>=UltiSnips#Anon('($1)', '(', '', 'i')<cr>
endif

" }

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

if filereadable(expand("~/.vim/bundle/LaTeX-Box/ftplugin/latex-box/latexmk.vim"))
	noremap <silent> <Leader>ls :silent
				\ !/Applications/Skim.app/Contents/SharedSupport/displayline
				\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
				\ "%:p" <CR>:redraw!<CR>
	"let g:LatexBox_latexmk_async=1
	let g:LatexBox_complete_inlineMath=1
	let g:LatexBox_Folding=0
	let g:LatexBox_fold_envs=0
	let g:LatexBox_fold_sections = [
				\ "part",
				\ "chapter",
				\ "section",
				\ ]
	let g:LatexBox_viewer = "open"
	"let g:LatexBox_completion_commands = []
	"let g:LatexBox_completion_environments = []
	set columns=82 lines=53
	let g:LatexBox_latexmk_preview_continuously=1
	let g:LatexBox_quickfix=0

endif
"}
