"""""""""""""""""""""""""""""""" Vundle Configuration """""""""""""""""""""""""""""""""
" reset the leader key to <space>
let mapleader = ","
syntax on
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

let g:python3_host_prog='/usr/local/bin/python3'

if has('nvim')
	Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plugin 'Shougo/deoplete.nvim'
	Plugin 'roxma/nvim-yarp'
	Plugin 'roxma/vim-hug-neovim-rpc'
endif
" {{
	let g:deoplete#enable_at_startup = 1
" }}
Plugin 'zchee/deoplete-jedi'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/fzf.vim'
" {{{
	let g:fzf_nvim_statusline = 0 " disable statusline overwriting

	nnoremap <silent> <C-p> :Files<CR>
	nnoremap <leader>t :Buffers<CR>
	nnoremap <leader>f :BLines<CR>
	nnoremap <leader>. :FindInProject<space>
	nnoremap <silent> K :call SearchWordWithAg()<CR>

	imap <C-x><C-f> <plug>(fzf-complete-file-ag)
	imap <C-x><C-l> <plug>(fzf-complete-line)

	function! SearchWordWithAg()
		execute 'Ag' expand('<cword>')
	endfunction

	command! -nargs=+ -complete=dir FindInProject
		\ call fzf#vim#ag(<q-args>, '--hidden', <bang>0)
" }}}
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
" {{
	nnoremap <leader>n :NERDTree .<CR>
	map <C-n> :NERDTreeToggle<CR>
	map <leader>r :NERDTreeFind<cr>

	let g:NERDTreeWinSize=30
	let NERDTreeShowHidden=1
	let NERDTreeChDirMode=2
	let NERDTreeIgnore = ['\.pyc$', '^node_modules$', '\.git', '__pycache__', '\.serverless', '\.requirements-cache']
" }}
Plugin 'junegunn/goyo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'mihaifm/bufstop'
Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons'
" {{
	let g:webdevicons_enable = 1
	let g:webdevicons_enable_nerdtree = 1
	let g:webdevicons_enable_airline_statusline = 1
	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
	let g:webdevicons_conceal_nerdtree_brackets = 1
	let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
	let g:webdevicons_enable_ctrlp = 1
" }}
Plugin 'scrooloose/nerdcommenter'
" {{{
	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1
	" Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1
	" Allow commenting and inverting empty lines (useful when commenting a region)
	let g:NERDCommentEmptyLines = 1
	" Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1
" }}}
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'romainl/vim-cool'
Plugin 'JamshedVesuna/vim-markdown-preview'
" {{
	let vim_markdown_preview_github=1
	let vim_markdown_preview_browser='Google Chrome'
	let vim_markdown_preview_toggle=0
" }}
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
" {{
	let g:go_fmt_command = "goimports"
	let g:go_fmt_fail_silently = 1
	let g:go_highlight_functions = 1
" }}
Plugin 'w0rp/ale'
" {{
	let g:ale_sign_error = '●' " Less aggressive than the default '>>'
	let g:ale_sign_warning = '.'
	let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
	let g:ale_lint_on_save = 1
" }
Plugin 'skywind3000/asyncrun.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""" Settings """"""""""""""""""""""""""""""""""""""""""
set autoindent        " automatically indent new lines
set smartindent       " be smart about it
set ruler
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current
set nu                " Show line numbers
set ai                " auto indent
set ignorecase        " ignore case when seraching
set smartcase         " smarter case handling when searching
set hlsearch          " highlight search results
set nolazyredraw      " turn off lazy redarw
set incsearch         " start searching before pressing enter
set magic
set foldcolumn=1      " Add a bit extra margin to the left
set nosol             " Don't move cursor to beginning to line
set showmatch         " Show matching brackets when text indicator is over them
set encoding=utf-8
set cursorline        " highlight current line
"set cursorcolumn                                        " highlight current foldcolumn
set cmdheight=1       " commandline height
set noerrorbells      " disable annoying bells on errors
set visualbell t_vb=  " disable visual flashes
set autochdir         " change working directory to current file
set nocompatible      " be iMproved, required
set clipboard=unnamed
set autoread
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set guifont=MesloLGLDZ\ Nerd\ Font:h15
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab

" auto remove trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
" set tab width to 2 for yaml files
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""" Colors """""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:nord_cursor_line_number_background = 1
colorscheme nord

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
	colorscheme stellarized_dark
	" colorscheme Tomorrow-Night
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""" Mappings """""""""""""""""""""""""""""""""""""""""""

" Save file on leader + s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Close current buffer
nnoremap <leader>w :bd<cr>

" Close all buffers but currentone
nnoremap <leader>wa :%bd<cr>:e#<cr>

" Clear search highlights after pressing return again
nnoremap <esc> :noh<esc><esc>

" Quit files with leader + q
noremap <leader>q :q<cr>

" Save file in insert mode
inoremap <C-S> <Esc>:w<CR>

" Reformat the whole file:
nnoremap g= gg=G``

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

nmap <c-a> $
nmap <c-i> ^

" Fast scrolling
noremap <Right> 10l
noremap <Left> 10h
noremap <Up> 10k
noremap <Down> 10j

nmap <Right> 10l
nmap <Left> 10h
nmap <Up> 10k
nmap <Down> 10j

" change directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


"if exists(":Tabularize")
	nmap <leader>a= :Tab/=<CR>
	vmap <leader>a= :Tab/=<CR>
	nmap <leader>a: :Tab/:\zs<CR>
	vmap <leader>a: :Tab/:\zs<CR>
	nmap <leader>a" :Tab/"<CR>
	vmap <leader>a" :Tab/"<CR>
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Buffstop
map <leader>b <Esc>:BufstopFast<CR>

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-d>'
let g:multi_cursor_prev_key='<c-f>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim cool
let g:CoolTotalMatches = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete

autocmd FileType go      call GOSET()
"autocmd FileType cpp    call CPPSET()
"autocmd FileType java   call JAVASET()
"

" {{
	set laststatus=2		" Always show the status line
	" let g:airline_theme='minimalist'
	"let g:airline_solarized_bg='dark'
	let g:airline_powerline_fonts=1
	let g:airline_symbols = get(g:,'airline_symbols',{})
	let g:airline_symbols.maxlinenr=''
	let g:airline_section_z = airline#section#create(['windowswap','linenr','maxlinenr', ':%2v'])
	let g:airline_section_y = ''
	let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
" }}
"" GO
function! GOSET()
	noremap ,gob :GoBuild<CR>
	noremap ,go :GoRun<CR>
endfunction

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)

