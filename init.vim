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
				\ 'coc-clojure',
				\ '@yaegassy/coc-tailwindcss3',
				\ 'coc-go',
				\ 'coc-eslint',
				\ 'coc-git'
				\ ]

	Plug 'wojciechkepka/vim-github-dark' " github dark theme
	Plug 'vim-airline/vim-airline' " status line
	Plug 'liuchengxu/vim-better-default' " better defaults
	Plug 'ervandew/supertab' " tab insert completion
	Plug 'nathanaelkane/vim-indent-guides' " display indent levels
	Plug 'dense-analysis/ale' " linting

	Plug 'Olical/conjure' " conjure

	" javascript, typescript
	Plug 'elzr/vim-json' " json highlighting
	Plug 'othree/html5.vim' " html5 syntax
	Plug 'leafgarland/typescript-vim' " ts highlighting
	Plug 'peitalin/vim-jsx-typescript' " jsx highlighting
	Plug 'pangloss/vim-javascript' " js highlighting
	Plug 'jparise/vim-graphql' " graphql highlighting
	Plug 'gregsexton/MatchTag' " match html tags
	Plug 'yaegassy/coc-tailwindcss3' " tailwindcss

	" clojure
	Plug 'tpope/vim-dispatch'
	Plug 'clojure-vim/vim-jack-in'
	Plug 'radenling/vim-dispatch-neovim'

	" scala
	Plug 'nvim-lua/plenary.nvim' " for nvim-metals
	Plug 'scalameta/nvim-metals' " scala metals lsp

	" go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" terraform
	Plug 'hashivim/vim-terraform'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search
	Plug 'junegunn/fzf.vim' " fzf search integration
	Plug 'tpope/vim-fugitive' " git
	Plug 'psliwka/vim-smoothie' " smooth scrolling
	Plug 'preservim/nerdtree' " file explorer
	Plug 'ryanoasis/vim-devicons' " icons
	Plug 'timakro/vim-yadi' " auto detect indent
	Plug 'ap/vim-buftabline' " tabs
	Plug 'vifm/vifm.vim' " file finder
	Plug 'airblade/vim-gitgutter' " show git markers
call plug#end()

" theming support
if (has("termguicolors"))
	set termguicolors
endif

autocmd BufRead * DetectIndent " auto detect indentation
runtime! plugin/default.vim " allows overriding vim-better-default
set background=dark " dark background
colorscheme ghdark " github dark
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

let g:indent_guides_enable_on_vim_startup = 1 " enable indent guides on startup

" ALE config
let g:ale_fixers = {
			\ 'css': ['prettier'],
			\ 'clojure': ['clj-kondo', 'joker'],
			\ 'javascript': ['prettier', 'eslint'],
			\ 'javascriptreact': ['prettier', 'eslint'],
			\ 'typescript': ['prettier', 'eslint'],
			\ 'typescriptreact': ['prettier', 'eslint'],
			\ 'go': ['gofmt', 'golint'],
			\ 'scala': ['scalafmt']
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
