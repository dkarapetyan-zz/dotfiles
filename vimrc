"Global Defaults  {

if 1

	set nocompatible
	filetype off

	set rtp+=~/.vim/bundle/vundle/
	"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
	call vundle#rc()
	"Bundle 'LaTeX-Box-Team/LaTeX-Box'
	Bundle 'gmarik/vundle'
	Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
	"Bundle 'Valloric/YouCompleteMe'
	"Bundle 'scrooloose/syntastic'
	"Bundle 'scrooloose/nerdtree'
	Bundle 'SirVer/UltiSnips'
	Bundle 'flazz/vim-colorschemes'
	"Bundle 'Lokaltog/powerline'
	Bundle 'kien/ctrlp.vim'
	Bundle 'vim-scripts/Vim-R-plugin'
	Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
	let mapleader="," " must put before plugins are loaded--otherwise, won't work
	let maplocalleader=","
	let g:tex_flavor="latex"
	filetype plugin indent on  "must come after bundles and rtp or vundle won't work
	syntax enable

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
	set t_Co=256
	set shortmess+=filmnrxoOtT  
	set virtualedit=onemore             " Allow for cursor beyond last character
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
	map <leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf %<CR>
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
	set guifont=Inconsolata\ For\ Powerline:h13
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

"if filereadable(expand("~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim"))
	"set laststatus=2 " Always display the statusline in all windows
	"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
	"set ttimeoutlen=10
	"augroup FastEscape
		"autocmd!
		"au InsertEnter * set timeoutlen=0
		"au InsertLeave * set timeoutlen=1000
	"augroup END
"endif



" Ultisnips {
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
