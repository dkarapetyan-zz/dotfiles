call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
Plug 'python-mode/python-mode'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jpalardy/vim-slime'
Plug 'vim-latex/vim-latex'
Plug 'vim-voom/VOoM'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'godlygeek/tabular'
Plug 'naught101/vim-pweave'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


call plug#end()

if filereadable(expand("~/.vim/plugged/vim-colorschemes/colors/solarized.vim"))
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1 "takes on colors of tmux terminal if 1
	let g:solarized_contrast="normal"
	let g:solarized_visibility="normal"
	let g:solarized_menu = 2
	set bg=light
	color solarized             " Load a colorscheme
endif

if has('statusline')
	set laststatus=2
endif

set nocompatible
let maplocalleader = "," "must put before plugins are loaded--otherwise, won't work
let mapleader = "," "must put before plugins are loaded--otherwise, won't work
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
set completeopt=longest,menuone,preview
set textwidth=79
set t_Co=256
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set history=1000  
set noshowmode
set hidden                          " Allow buffer switching without saving
set backspace=indent,eol,start  " Backspace for dummies
set ttyfast                     
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set cursorline
"set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=5                 " Minimum lines to keep above and below cursor
set splitright
set shiftwidth=2                " Use indents of 4 spaces
"set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every 8 columns
set softtabstop=2               " Let backspace delete indent
"set nofen 
set noswapfile
set backup
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set novb
"set autochdir
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls 
" Custom Global Mappings {
command! W w
command! Wq wq
command! WQ wq
noremap Q <Nop>
map j gj
map k gk
nnoremap <leader>ot :!open -a iTerm ./<CR><CR>
noremap <leader>ox :!open -a Excalibur %<CR><CR>
nnoremap <leader>ov :source ~/.vimrc<CR>
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>a mcgg=G`c
"noremap j gj
"noremap k gk
nnoremap K <nop>
command! Q q
command! W w
command! Wq wq
command! WQ wq 

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
	set guifont=Inconsolata:h14
	"let gcr="a:blinkon0" 
	"autocmd filetype * highlight tagbarsignature guifg=bg 
endif
"}


"Custom Autocmd Mappings {
augroup vimrc_autocmds
	au!
	"autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
	"autocmd BufEnter * if !has('gui_running')
	"\	| set term=xterm-256color | endif "for tmux rendering
	"autocmd BufRead,BufNewFile *.tex set syntax=plaintex
	"autocmd BufWritePost *.tex :call Tex_CompileMultipleTimes()

	au VimEnter * if &filetype == "tex" | let g:tex_flavor = "latex" | endif 
	au VimEnter * if &filetype == "tex" | imap <C-b> <Plug>Tex_MathBF| endif 
	au VimEnter * if &filetype == "tex" | imap <C-c> <Plug>Tex_MathCal| endif 
	au VimEnter * if &filetype == "tex" | imap <C-l> <Plug>Tex_LeftRight| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('`w', '\omega', 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('`v', '\vee', 'tex')| endif 
	"au VimEnter * if &filetype == "tex" | imap <C-i> <Plug>Tex_InsertItemOnThisLine| endif
	"au VimEnter * if &filetype == "tex" | call IMAP('`O', '\Omega', 'tex')| endif 
	au VimEnter * if &filetype == "tex" | set iskeyword+=:| endif 
	"Reload"


	au VimEnter * if &filetype == "tex" | call IMAP('EE*', "\<c-r>=Tex_PutEnvironment('equation*')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('EA*', "\<c-r>=Tex_PutEnvironment('align*')\<CR>", 'tex')| endif 

	au VimEnter * if &filetype == "tex" | call IMAP('EDF', "\<c-r>=Tex_PutEnvironment('definition')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('ELE', "\<c-r>=Tex_PutEnvironment('lemma')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('EPR', "\<c-r>=Tex_PutEnvironment('proposition')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('EPF', "\<c-r>=Tex_PutEnvironment('proof')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('ETH', "\<c-r>=Tex_PutEnvironment('theorem')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('ERE', "\<c-r>=Tex_PutEnvironment('remark')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('EEX', "\<c-r>=Tex_PutEnvironment('example')\<CR>", 'tex')| endif 
	au VimEnter * if &filetype == "tex" | call IMAP('$$', "\\(<++>\\)<++>", 'tex')| endif 

	au VimEnter * if &filetype == "tex" | let g:Tex_UseUtfMenus=1| endif 
	au VimEnter * if &filetype == "tex" | set omnifunc=syntaxcomplete#Complete| endif 
	"au VimEnter * if &filetype == "tex" | let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
	"| endif 
augroup END 
"}


"Plugin Loading {

" Vim-Latex { Requires vim 7.4+ to work properly with Ultisnips
if filereadable(expand("~/.vim/plugged/vim-latex/ftplugin/latex-suite/texrc"))
	let g:Tex_CustomTemplateFolder = ''
	autocmd Filetype tex  imap <C-j> <Plug>IMAP_JumpForward
	autocmd Filetype tex	imap <C-S-j> <Plug>IMAP_JumpBack
	autocmd Filetype tex	set grepprg=grep\ -nH\ $*
	autocmd Filetype tex	nnoremap \rw :%s/\s\+$//e<CR> "remove trailing whitespace
	autocmd Filetype tex	map <c-space> :call Tex_ForwardSearchLaTeX()<CR> 
	autocmd Filetype tex	imap <tab> <F7>

	let g:Tex_DefaultTargetFormat = 'pdf'
	let g:Tex_ViewRule_pdf = 'open -a Skim'
	"let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
	let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

	let g:Tex_EnvEndWithCR = 1
	let g:Tex_Menus = 0

	" Should the label placed before or after the content?
	let g:Tex_LabelAfterContent = 0
	let g:Tex_EnvLabelprefix_table = "tab:"
	let g:Tex_EnvLabelprefix_figure = "fig:"
	let g:Tex_EnvLabelprefix_equation = "eqn:"
	let g:Tex_EnvLabelprefix_theorem = "thm:"
	let g:Tex_EnvLabelprefix_definition = "def:"
	let g:Tex_EnvLabelprefix_remark = "rem:"
	let g:Tex_EnvLabelprefix_notation = "not:"
	let g:Tex_EnvLabelprefix_lemma = "lem:"
	let g:Tex_HotKeyMappings = ''
	let g:Tex_BIBINPUTS = '/Users/davidkarapetyan/Documents/workspace/research/'
	"let g:Tex_MultipleCompileFormats='pdf'
	"let g:Tex_DefaultTargetFormat = 'pdf'
	let g:Tex_AdvancedMath = 1
	let g:Tex_UseUtfMenus = 1
	"let g:Tex_Leader = ';'

	"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
	let g:Tex_CompileRule_pdf = "latexmk -pdflatex='pdflatex -file-line-error -synctex=1 -interaction=nonstopmode' -bibtex -pdf $*"
	"let g:Tex_CompileRule_pdf = "latexmk -lualatex='lualatex -file-line-error -synctex=1 -interaction=nonstopmode' -bibtex -pdf $*"


	let Tex_FoldedSections=""
	let Tex_FoldedEnvironments=""
	let Tex_FoldedMisc=""

	"let g:Tex_CompileRule_pdf = 'latexmk --pdf $*'

	"let g:Tex_CompileRule_pdf = 'xelatex $*'

	"}
endif

" Ultisnips { Requires vim 7.4+
if filereadable(expand("~/.vim/plugged/UltiSnips/plugin/UltiSnips.vim"))
	"let g:UltiSnipsSnippetDirectories=["my_snippets"]
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	nmap <leader>os :UltiSnipsEdit<CR>
	let g:UltiSnipsEditSplit="horizontal"
	"inoremap <silent> $ $<C-R>=UltiSnips#Anon('\$$1\$', '$', '', 'i')<cr>
	"inoremap <silent> [ [<C-R>=UltiSnips#Anon('[$1]', '[', '', 'i')<cr>


endif

" }

" Airline {
if filereadable(expand("~/.vim/plugged/vim-airline/plugin/airline.vim"))
	let g:airline#extensions#tabline#enabled = 0
	let g:airline#extensions#tmuxline#enabled = 1
	"let g:airline_extensions = []
	"let g:airline_extensions = ['branch']

endif
" }

" Fugitive {
if filereadable(expand("~/.vim/plugged/vim-fugitive/plugin/fugitive.vim"))

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

"if filereadable(expand("~/.vim/plugged/vimtex/ftplugin/tex.vim"))
"imap <C-j> <plug>(vimtex-delim-close)
"let g:vimtex_delim_stopline=1
"autocmd Filetype tex inoremap <silent> __ _<c-r>=UltiSnips#Anon('_{$0', '_', '', 'i')<cr>
"inoremap <silent> ^^ ^<c-r>=UltiSnips#Anon('^{$0', '^', '', 'i')<cr>
"inoremap <silent> (( (<C-R>=UltiSnips#Anon('\left($0', '(', '', 'i')<cr>
"inoremap <silent> [[ [<C-R>=UltiSnips#Anon('\left[$0', '[', '', 'i')<cr>
"inoremap <silent> {{ {<C-R>=UltiSnips#Anon('\left\\{$0', '{', '', 'i')<cr>

"map <c-space> <localleader>lv

""imap ^^ ^{
""imap __ _{
"let g:vimtex_view_general_viewer
"\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"let g:vimtex_view_general_options = '-r @line @pdf @tex'

"" This adds a callback hook that updates Skim after compilation
"let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
"function! UpdateSkim(status)
"if !a:status | return | endif

"let l:out = b:vimtex.out()
"let l:tex = expand('%:p')
"let l:cmd = [g:vimtex_view_general_viewer, '-r']
"if !empty(system('pgrep Skim'))
"call extend(l:cmd, ['-g'])
"endif
"if has('nvim')
"call jobstart(l:cmd + [line('.'), l:out, l:tex])
"elseif has('job')
"call job_start(l:cmd + [line('.'), l:out, l:tex])
"else
"call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
"endif
"endfunction
"call vimtex#imaps#add_map({
"\ 'lhs' : '^^',
"\ 'rhs' : '^{'
"\})
"call vimtex#imaps#add_map({
"\ 'lhs' : '__',
"\ 'rhs' : '_{'
"\})

"endif





if filereadable(expand("~/.vim/plugged/syntastic/plugin/syntastic.vim"))
	let g:syntastic_quiet_messages = { "regex": 'You should enclose the previous parenthesis with\|to achieve an ellipsis\|Delete this space to maintain correct\| expected, found\|match the number of'}
	let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
endif

"if filereadable(expand("~/.vim/plugged/LaTeX-Box/ftplugin/latex-box/latexmk.vim"))
"noremap <silent> <Leader>ls :silent
"\ !/Applications/Skim.app/Contents/SharedSupport/displayline
"\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
"\ "%:p" <CR>:redraw!<CR>
""let g:LatexBox_latexmk_async=1
"let g:LatexBox_complete_inlineMath=1
"let g:LatexBox_Folding=0
"let g:LatexBox_fold_envs=0
"let g:LatexBox_fold_sections = [
"\ "part",
"\ "chapter",
"\ "section",
"\ ]
"let g:LatexBox_viewer = "open"
""let g:LatexBox_completion_commands = []
""let g:LatexBox_completion_environments = []
"set columns=82 lines=53
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=0
"endif
"}
"
let g:slime_paste_file = tempname()
"" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
if !executable("ghcmod")
	autocmd Filetype haskell map <silent> tw :GhcModTypeInsert<CR>
	autocmd Filetype haskell map <silent> ts :GhcModSplitFunCase<CR>
	autocmd Filetype haskell map <silent> tq :GhcModType<CR>
	autocmd Filetype haskell map <silent> te :GhcModTypeClear<CR>
	autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif

augroup filetypedetect
	    au BufRead,BufNewFile *.toml set filetype=config
augroup END
au BufRead,BufNewFile,BufNew *.hss setl ft=haskell.script

let slime_target = "tmux" 
let g:slime_python_ipython = 1
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
" TagBar {
if isdirectory(expand("~/.vim/plugged/tagbar/"))
	nnoremap <silent> <leader>tt :TagbarToggle<CR>
	let g:tagbar_left=1
endif
"}
if exists('$TMUX') 
	let g:slime_default_config={"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
endif
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeLineSend

let g:SuperTabMappingForward = '<nul>'
let g:SuperTabMappingBackward = '<s-nul>'
let g:SuperTabClosePreviewOnPopupClose = 0
let g:SuperTabDefaultCompletionType='context'
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'

"deocomplete
"let g:deoplete#enable_at_startup = 1

"zschee
"let g:python_host_prog = '/usr/local/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'
"let g:deoplete#sources#jedi#show_docstring=1

let g:pydoc_window_lines=0.2
let g:pydoc_open_cmd = 'vsplit'"
map <leader>pr :botright vertical pedit previewwindow<CR>:vert resize -68<CR>

autocmd FileType python setlocal completefunc=pythoncomplete#Complete

if isdirectory(expand("~/.vim/plugged/nerdtree/"))
	map <leader>nt :NERDTreeToggle<CR>
endif

" Fugitive {
if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gr :Gread<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>
	nnoremap <silent> <leader>ge :Gedit<CR>
	" Mnemonic _i_nteractive
	nnoremap <silent> <leader>gi :Git add -p %<CR>
	nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

" PyMode {
" Disable if python support not present
if !has('python') && !has('python3')
	let g:pymode = 0
endif

if isdirectory(expand("~/.vim/plugged/python-mode"))
	let g:pymode_rope_lookup_project = 1
	let g:pymode_rope_completion = 1
	let g:pymode_rope_complete_on_dot = 0

	"let g:pymode_lint_checkers = ['pyflakes']
	"let g:pymode_trim_whitespaces = 0
	"let g:pymode_options = 0
	"let g:pymode_rope = 0
endif
" }

if isdirectory(expand("~/.fzf/"))
		map <c-f> :FZF<CR>
endif

" ctrlp {
if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
	let g:ctrlp_working_path_mode = 'ra'
	nnoremap <silent> <D-t> :CtrlP<CR>
	nnoremap <silent> <D-r> :CtrlPMRU<CR>
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\.git$\|\.hg$\|\.svn$',
				\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
	if executable('ag')
		let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
	elseif executable('ack-grep')
		let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
	elseif executable('ack')
		let s:ctrlp_fallback = 'ack %s --nocolor -f'
		" On Windows use "dir" as fallback command.
	elseif WINDOWS()
		let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
	else
		let s:ctrlp_fallback = 'find %s -type f'
	endif
	if exists("g:ctrlp_user_command")
		unlet g:ctrlp_user_command
	endif
	let g:ctrlp_user_command = {
				\ 'types': {
				\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
				\ 2: ['.hg', 'hg --cwd %s locate -I .'],
				\ },
				\ 'fallback': s:ctrlp_fallback
				\ }
endif
"}

