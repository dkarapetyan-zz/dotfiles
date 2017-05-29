call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'python-mode/python-mode'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular' "must come before vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jpalardy/vim-slime'
Plug 'vim-latex/vim-latex'
Plug 'vim-voom/VOoM'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'naught101/vim-pweave'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'
Plug 'dag/vim2hs'
Plug 'lukerandall/haskellmode-vim'

call plug#end()

"general settings

set autoread
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
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=5                 " Minimum lines to keep above and below cursor
set splitright
"defaults for formatting
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every 8 columns
set softtabstop=2               " Let backspace delete indent
set laststatus=2                "statusline
"
set nofen
set noswapfile
set backup
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set novb
set autoread "auto reload a file that has changed
set wildignore=*.log,*.aux,*.bbl,*.pdfsync,*.dvi,*.aut,*.synctex.gz,*.aux,*.blg,*.fff,*.out,*.pdf,*.ps,*.toc,*.ttt,*.fdb_latexmk,*.fls
" Custom Global Mappings {
command! W w
command! Wq wq
command! WQ wq
noremap Q <Nop>
noremap j gj
noremap k gk
nnoremap <leader>ot :!open -a iTerm ./<CR><CR>
noremap <leader>ox :!open -a Excalibur %<CR><CR>
nnoremap <leader>ov :source ~/.vimrc<CR>
nnoremap <leader>ev :vsp ~/Documents/workspace/dotfiles/vimrc<CR>
nnoremap <leader>a mcgg=G`c
nnoremap K <nop>
command! Q q
command! W w
command! Wq wq
command! WQ wq
nnoremap <leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
map <leader>pr :botright vertical pedit previewwindow<CR>:vert resize -68<CR>
augroup python
  autocmd!
augroup end

augroup haskell_reset
  autocmd!
augroup end

augroup python_reset
  autocmd!
augroup end

autocmd python_reset FileType python setlocal completefunc=pythoncomplete#Complete
autocmd haskell_reset FileType haskell setlocal tabstop=8 expandtab softtabstop=4
      \ shiftwidth=4 shiftround


"}

"Plugin Loading {

if filereadable(expand("~/.vim/plugged/vim-colorschemes/colors/solarized.vim"))
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1 "takes on colors of tmux terminal if 1
  let g:solarized_contrast="normal"
  let g:solarized_visibility="normal"
  let g:solarized_menu = 2
  set bg=light
  colorscheme solarized             " Load a colorscheme

endif



" Vim-Latex { Requires vim 7.4+ to work properly with Ultisnips
if filereadable(expand("~/.vim/plugged/vim-latex/ftplugin/latex-suite/texrc"))
  let g:Tex_CustomTemplateFolder = ''

  let g:Tex_DefaultTargetFormat = 'pdf'
  let g:Tex_ViewRule_pdf = 'open -a Skim'
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
  let g:Tex_AdvancedMath = 1
  let g:Tex_UseUtfMenus = 1
  let g:Tex_CompileRule_pdf = "latexmk -pdflatex='pdflatex -file-line-error -synctex=1 -interaction=nonstopmode' -bibtex -pdf $*"
  let Tex_FoldedSections=""
  let Tex_FoldedEnvironments=""
  let Tex_FoldedMisc=""

  augroup tex
    autocmd!
    autocmd Filetype tex imap <C-j> <Plug>IMAP_JumpForward
    autocmd Filetype tex set grepprg=grep\ -nH\ $*
    autocmd Filetype tex imap <tab> <F7>
    autocmd Filetype tex let g:tex_flavor = "latex"
    autocmd Filetype tex imap <C-b> <Plug>Tex_MathBF
    autocmd Filetype tex imap <C-c> <Plug>Tex_MathCal
    autocmd Filetype tex imap <C-l> <Plug>Tex_LeftRight
    autocmd Filetype tex imap <C-i> <Plug>Tex_InsertItemOnThisLine
    autocmd Filetype tex set iskeyword+=:
    autocmd Filetype tex set sw=2
    autocmd Filetype tex call IMAP('`O', '\Omega', 'tex')
    autocmd Filetype tex call IMAP('`w', '\omega', 'tex')
    autocmd Filetype tex call IMAP('`v', '\vee', 'tex')
    autocmd Filetype tex call IMAP('EE*', "\<c-r>=Tex_PutEnvironment('equation*')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('EA*', "\<c-r>=Tex_PutEnvironment('align*')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('EDE', "\<c-r>=Tex_PutEnvironment('definition')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('ELE', "\<c-r>=Tex_PutEnvironment('lemma')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('EPR', "\<c-r>=Tex_PutEnvironment('proposition')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('EPF', "\<c-r>=Tex_PutEnvironment('proof')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('ETH', "\<c-r>=Tex_PutEnvironment('theorem')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('ECO', "\<c-r>=Tex_PutEnvironment('corollary')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('ERE', "\<c-r>=Tex_PutEnvironment('remark')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('EEX', "\<c-r>=Tex_PutEnvironment('example')\<CR>", 'tex')
    autocmd Filetype tex call IMAP('$$', "\\(<++>\\)<++>", 'tex')
    autocmd Filetype tex let g:Tex_UseUtfMenus=1
    autocmd Filetype tex set omnifunc=syntaxcomplete#Complete
    autocmd Filetype tex let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  augroup end
endif

"}

" Ultisnips { Requires vim 7.4+
if filereadable(expand("~/.vim/plugged/UltiSnips/plugin/UltiSnips.vim"))
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  nmap <leader>os :UltiSnipsEdit<CR>
  let g:UltiSnipsEditSplit="horizontal"


endif
"}

" Airline {
if filereadable(expand("~/.vim/plugged/vim-airline/plugin/airline.vim"))
  let g:airline#extensions#tmuxline#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tagbar#enabled = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_nr_show = 1
  "let g:airline_extensions = ['branch', 'tabline', 'tmuxline']



endif
"}

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

"Ale {
if filereadable(expand("~/.vim/plugged/ale/plugin/ale.vim"))
  let g:ale_tex_chktex_options="-I -n 3 -n 11 -n 24 -n 9 -n 17"
  let g:ale_lint_on_text_changed = "never"
  let g:ale_linters = {'haskell': ['hdevtools', 'ghc']}
endif

"Slime {
if filereadable(expand("~/.vim/plugged/vim-slime/plugin/slime.vim"))
  let slime_target = "tmux"
  let g:slime_python_ipython = 1
  let g:slime_paste_file = tempname()
  if exists('$TMUX')
    let g:slime_default_config={"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
  endif
  let g:slime_no_mappings = 1
  xmap <leader>s <Plug>SlimeRegionSend
  nmap <leader>s <Plug>SlimeMotionSend
  nmap <leader>ss <Plug>SlimeLineSend
endif
"}

"Neco-Ghc {
if isdirectory(expand("~/.vim/plugged/neco-ghc/"))
  autocmd haskell_reset FileType haskell setlocal omnifunc=necoghc#omnifunc
  let g:necoghc_enable_detailed_browse = 1
endif
"}

"GHCMod-Vim {
if isdirectory(expand("~/.vim/plugged/ghcmod-vim/"))
  if executable("ghc-mod")
    autocmd haskell_reset Filetype haskell map <leader>tw :GhcModTypeInsert<CR>
    autocmd haskell_reset Filetype haskell map <leader>ts :GhcModSplitFunCase<CR>
    autocmd haskell_reset Filetype haskell map <leader>tq :GhcModType<CR>
    autocmd haskell_reset Filetype haskell map <leader>te :GhcModTypeClear<CR>
    "autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  endif
endif
"}

" TagBar {
if isdirectory(expand("~/.vim/plugged/tagbar/"))
  nnoremap <silent> <leader>tt :TagbarToggle<CR>
  let g:tagbar_left=1
endif
"}

" Supertab {
if isdirectory(expand("~/.vim/plugged/supertab/"))
  let g:SuperTabMappingForward = '<nul>'
  let g:SuperTabMappingBackward = '<s-nul>'
  let g:SuperTabClosePreviewOnPopupClose = 0
  let g:SuperTabDefaultCompletionType='context'
endif
"}


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

"PyMode {

if isdirectory(expand("~/.vim/plugged/python-mode"))
  let g:pymode_rope_lookup_project = 1
  let g:pymode_rope_completion = 1
  let g:pymode_rope_complete_on_dot = 0
  let g:pymode_options_colorcolumn = 0


  "let g:pymode_lint_checkers = ['pyflakes']
  "let g:pymode_trim_whitespaces = 0
  "let g:pymode_options = 0
  "let g:pymode_rope = 0
endif
" }

if isdirectory(expand("~/.vim/plugged/fzf.vim/"))
  nnoremap <silent> <leader>f :FZF<CR>
endif

" NerdTree {
if isdirectory(expand("~/.vim/plugged/nerdtree/"))
  map <leader>nt :NERDTreeToggle<CR>
endif
"}
"
"Vim Markdown {
if isdirectory(expand("~/.vim/plugged/vim-markdown/"))
  let g:vim_markdown_fenced_languages = ['python=python', 'viml=vim', 'bash=sh', 'ini=dosini']
  let g:vim_markdown_toml_frontmatter = 1
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 0
endif
"}

"Tabular {
if isdirectory(expand("~/.vim/plugged/tabular/"))
  vmap a= :Tabularize /=<CR>
  vmap a; :Tabularize /::<CR>
  vmap a- :Tabularize /-><CR>
endif
"}

"Vim2hs {"
if isdirectory(expand("~/.vim/plugged/vim2hs/"))
  let g:haskell_tabular = 0
endif
"}
"
"Haskellmode {"
if isdirectory(expand("~/.vim/plugged/haskellmode-vim/"))
  let g:haskellmode_completion_ghc=0
  let g:haskellmode_completion_haddock=0
  au haskell_reset BufEnter *.hs compiler ghc
  let g:haddock_browser = "open"
  let g:haddock_browser_callformat = "%s %s"
  let g:haddock_indexfiledir="~/.vim/"
endif
"}
