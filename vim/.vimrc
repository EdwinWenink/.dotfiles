" Edwin's VIM
"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Airline bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Default settings everyone can agree on
Plug 'tpope/vim-sensible'

" Set of handy mappings (see documentation for mnemonics)
Plug 'tpope/vim-unimpaired'

" Surround with brackets (yss new surroundings, cst" change, ds" delete )
Plug 'tpope/vim-surround'

" Support for using ds, cs and yss with the . command
Plug 'tpope/vim-repeat'

" Autocompletion for various languages (don't forget to run install.py)
Plug 'Valloric/YouCompleteMe'

" NERDTree file explorer
Plug 'scrooloose/nerdtree'

" Git extension for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Add shortcuts for efficiently commenting out lines in visual mode (cc to comment out selection, c<space> to toggle comment of line)
Plug 'scrooloose/nerdcommenter'

" Keeps track of git changes
Plug 'airblade/vim-gitgutter'

" Integration of vim with pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


" Initialize plugin system
call plug#end()


" Enable yanking to global clipboard for cross-terminal pasting
set clipboard=unnamedplus

" Disable spellchecking (':set spell' to enable again)
set nospell
syntax on 

" Enable a colorscheme
" let base16colorspace=256
" colorscheme base16-railscasts

" Airline settings
set laststatus=2 

"If no file is specified, open NERDTree automatically 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Select Latex Compile Defaults
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
"set runtimepath=~/.vom,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Settings for limelight (:help cterm-colors)
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient=0.4

" Integrating limelight with Goyo: when Goyo is entered, go in limelight mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Markdown settings
let g:vim_markdown_folding_disabled=1

