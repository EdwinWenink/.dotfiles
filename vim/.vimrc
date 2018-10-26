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
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

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

" CODING/IDE SIMULATION-------------------------------------

" Set of handy mappings (see documentation for mnemonics)
Plug 'tpope/vim-unimpaired'

" Surround with brackets (yss new surroundings, cst" change, ds" delete )
Plug 'tpope/vim-surround'

" Support for using ds, cs and yss with the . command
Plug 'tpope/vim-repeat'

" Autocompletion that only uses native vim autocomplete features
Plug 'lifepillar/vim-mucomplete'

" Syntax checking for programming languages
Plug 'vim-syntastic/syntastic'

" Autclose bracket-like symbols
Plug 'jiangmiao/auto-pairs'

" NERDTree file explorer
Plug 'scrooloose/nerdtree'

" Git extension for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Run commands without vim in tmux pane with VimuxRunCommand (you are supposed
" to run vim within tmux then)
Plug 'benmills/vimux'

" Smooth navigation between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

" Add shortcuts for efficiently commenting out lines in visual mode (cc to comment out selection, c<space> to toggle comment of line)
Plug 'scrooloose/nerdcommenter'

" Keeps track of git changes
Plug 'airblade/vim-gitgutter'

" Display tags of current file in a sidebar / Class outline
Plug 'majutsushi/tagbar'

" WRITING ----------------------------------

" Integration of vim with pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown / Writing
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'godlygeek/tabular'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'

" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" THEME -------------------------------------

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Icons for NERDTree and vim airline
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()


" XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


" GENERAL SETTINGS -----------------------------------

" Enable yanking to global clipboard for cross-terminal pasting
set clipboard=unnamedplus

" Disable spellchecking (':set spell' to enable again)
set nospell

" Enable syntax highlighting
syntax on 

" Change default 8 column tab to 4 column tab
:set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Set fold level: max level to fold on opening a file
set foldlevel=2

" Set updatetime of .swp file (changed for faster LaTeX preview).
" Default=4000
set updatetime=1000

" Settings for vim search
set incsearch
set hlsearch

" Automatically re-read files files if unmodified in vim
set autoread
" Enable digraph mode for entering special characters. Ä is produced by typing
" A, then backspace, then ':'
" set digraph

" Disable gui clutter for gVim
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Enable a colorscheme
let base16colorspace=256
set t_Co=256
" colorscheme base16-google-light
colorscheme dracula

" Set encoding
set encoding=UTF-8

" REMAPS ----------------------------------------

" Map <F2> to NERDTree
:nnoremap <F2> :NERDTreeToggle<CR>

" Map <F3> to open writer mode
:nnoremap <F3> :Goyo<CR>

" Open locallist vertically with custom function
:nnoremap <F4> :Vlist<CR>

" Map <F6> to LaTeX preview mode
:nnoremap <F6> :LLPStartPreview<CR>

" Map F8 to disabling auto indenting
:nnoremap <F8> :setl noai nocin nosi<CR>

" Map F9 to show tag sidebar (make sure to have ctags installed)
:nmap <F9> :TagbarToggle<CR>

" Escaping insert mode the lazy way 
:inoremap jj <Esc>

" Navigate between splits
" Currently vim-tmux-navigation already takes care of this
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-J>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Disable arrow movement, resize splits instead
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical-resize +2<CR>
nnoremap <Right> :vertical-resize -2<CR> 

" CUSTOM COMMANDS ----------------------------------

" Compile java files from within vim
:command Javac !javac $(find . -name "*.java")

" 'Notes Grep' (adapted from Conner McDaniel). I set NOTES_DIR in bashrc
command! -nargs=1 Ngrep lvimgrep "<args>\c" $NOTES_DIR/**/*.md
nnoremap <leader>n :Ngrep 
" Tips: use :lne(xt) and :lp(revious) or :lopen for navigation.
" The \c escape makes the search case insensitive

" Open local list in a right vertical split (good for Ngrep results)
command! Vlist botright vertical lopen | vertical resize 40

" Find and list all Markdown headers
nnoremap <leader>h :g/^#/#<CR>

" GENERAL PLUGIN SETTINGS -----------------------------

" Airline settings
set laststatus=2 

"If no file is specified, open NERDTree automatically 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0 "Enabling this breaks my note search function which requires access to the locallist
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" MUComplete settings
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c "Shut off completion messages
set belloff+=ctrlg "Disable vim beeping during completion
let g:mucomplete#enable_auto_at_startup = 1

" VIM / TMUX INTEGRATION -------------------------------

" Hide tmux status bar upon entering vim, and re-enable when leaving vim
autocmd VimEnter,VimLeave * silent !tmux set status

" Prompt for a command to run in tmux from within vim
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" MARKDOWN/PROSE SETTINGS -------------------------------

" Settings for limelight with dark background (:help cterm-colors)
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_default_coefficient=0.8

" Settings for limelight with white background (:help cterm-colors)
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient=0.8

" Settings for limelight in combination with gVim
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777' 

" Integrating limelight with Goyo: when Goyo is entered, go in limelight mode
" Show line number only in prose mode
" Upon entering Goyo, make the background light, resembling a paper

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  Limelight
  " highlight Normal ctermbg=White
  " highlight Normal ctermfg=Black
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"autocmd! User GoyoEnter highlight Normal ctermfg=Black | highlight Normal ctermbg=White | set number | set bg=light | Limelight

"autocmd! User GoyoLeave Limelight! | set bg=dark | highlight Normal ctermbg=Black | set number!

" Markdown settings
let g:vim_markdown_folding_disabled=1
let g:pencil#wrapModeDefault = 'soft'
let g:pencil_higher_contrast_ui = 1
let g:pencil_terminal_italics = 1

augroup pencil
	autocmd!
	autocmd Filetype markdown,mkd call pencil#init()
	autocmd Filetype text call pencil#init()
augroup END

" COMPILING STUFF

" Select Latex Compile Defaults
filetype plugin indent off
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
"set runtimepath=~/.vom,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

