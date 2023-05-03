" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))
	" language client
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	let g:coc_global_extensions = [
				\ 'coc-css',
				\ 'coc-json',
				\ 'coc-prettier',
				\ 'coc-tsserver',
				\ 'coc-conjure',
				\ '@yaegassy/coc-tailwindcss3'
				\ ]

	Plug 'arcticicestudio/nord-vim' " nord theme
	Plug 'liuchengxu/vim-better-default' " better defaults

	Plug 'leafgarland/typescript-vim' " ts highlighting
	Plug 'peitalin/vim-jsx-typescript' " jsx highlighting
	Plug 'pangloss/vim-javascript' " js highlighting
	Plug 'jparise/vim-graphql' " graphql highlighting
	Plug 'gregsexton/MatchTag' " match html tags
	Plug 'yaegassy/coc-tailwindcss3' " tailwindcss

	Plug 'Olical/conjure' " conjure
	Plug 'nvim-lua/plenary.nvim' " for nvim-metals
	Plug 'scalameta/nvim-metals' " scala metals lsp

	Plug 'w0rp/ale' " linting

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search
	Plug 'junegunn/fzf.vim' " fzf search integration
	Plug 'tpope/vim-fugitive' " git
	Plug 'psliwka/vim-smoothie' " smooth scrolling
	Plug 'preservim/nerdtree' " file explorer
	Plug 'ryanoasis/vim-devicons' " icons
call plug#end()

" theming support
if (has("termguicolors"))
	set termguicolors
endif

runtime! plugin/default.vim " allows overriding vim-better-default
set background=dark " dark background
colorscheme nord " nord colorscheme
syntax on " syntax highlighting

set showmatch " show matching brackets
set mouse=a " mouse scrolling
set clipboard+=unnamedplus " system clipboard
set autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 smarttab " indenting
set incsearch ignorecase smartcase hlsearch " highlight text while searching
set list listchars=trail:»,tab:»- " use tab to navigate in list mode
set tw=80 " 80 chars a line
set wrap breakindent " wrap long lines to width set by tab width
set encoding=UTF-8 " text-encoding
set number " enable numbers on the left
set title " tab title as file name

" ALE config
let g:ale_linters = {
            \ 'clojure': ['clj-kondo', 'joker'],
            \ 'javascript': ['prettier', 'eslint'],
            \ 'javascriptreact': ['prettier', 'eslint'],
            \ 'typescript': ['prettier', 'eslint'],
            \ 'typescriptreact': ['prettier', 'eslint'],
            \ }
let g:ale_fix_on_save = 1 " fix on save

" NERDTree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" automatically close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle file explorer with Ctrl+B
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
