" Edwin's VIM
"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed; check dashboard or activity. GHD! EdwinWenink; GHA! EdwinWenink
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" File explorers
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
" Git extension for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy file finding
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

" Airline bar at bottom of vim
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Default settings everyone can agree on
" Plug 'tpope/vim-sensible'

" Git wrapper
Plug 'tpope/vim-fugitive'

" ------------------ CODING/IDE SIMULATION ---------------------------

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

" Run commands without vim in tmux pane with VimuxRunCommand (you are supposed
" to run vim within tmux then)
Plug 'benmills/vimux'

" Smooth navigation between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

" Add shortcuts for efficiently commenting out lines in visual mode (cc to comment out selection, c<space> to toggle comment of line)
"Plug 'scrooloose/nerdcommenter'

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Keeps track of git changes
" Plug 'airblade/vim-gitgutter'

" Display tags of current file in a sidebar / Class outline
Plug 'majutsushi/tagbar'

" Full-featured document outliner, e.g. voor markdown or latex (:Voom latex)
Plug 'vim-scripts/VOoM'

" Support for todo.txt
Plug 'freitass/todo.txt-vim'

" Align e.g. on comma's with ' Tabularize /, '
Plug 'godlygeek/tabular'


" ----------------- WRITING ---------------------------

" Integration of vim with pandoc (also handles markdown formats)
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown / Writing
" Plug 'tpope/vim-markdown'
" Plug 'jtratner/vim-flavored-markdown'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'

" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" ----------------- THEME ----------------------

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'swalladge/paper.vim'

" Initialize plugin system
call plug#end()


" GENERAL SETTINGS -----------------------------------
"

" Enable yanking to global clipboard for cross-terminal pasting
set clipboard=unnamedplus

" Disable spellchecking (':set spell' to enable again)
set nospell

" Enable syntax highlighting
syntax on 

" Filetype detection
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" Change default 8 column tab to 4 column tab and expand to spaces
:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set fold level: max level to fold on opening a file
set foldlevel=1

" Set updatetime of .swp file (changed for faster LaTeX preview).
" Default=4000
set updatetime=1000  " Perhaps do a filetype check for .tex or .latex and then only do this? Can this cause lag?

" Settings for vim search
set incsearch
set hlsearch

" Load relevant plugin file
filetype plugin on

" Automatically re-read files files if unmodified in vim
set autoread
" Enable digraph mode for entering special characters. Ä is produced by typing
" A, then backspace, then ':'
" set digraph

" Disable gui clutter for gVim
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Enable base16 colorschemes; take over colorscheme from shell
let base16colorspace=256
set t_Co=256

" Set encoding
set encoding=utf-8
set fileencoding=utf-8

" REMAPS ----------------------------------------

" Map <F2> to NERDTree
" :nnoremap <F2> :NERDTreeToggle<CR>

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

" Use space to quickly open and close folds
:nnoremap <Space> za
:vnoremap <Space> za

" Use ESC to remove the highlighting from the last search
" :nnoremap <silent> <Esc> :nohlsearch<CR><CR>

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
" set laststatus=2 

"If no file is specified, open NERDTree automatically 
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
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
let g:mucomplete#completion_delay = 1

" Make Ctrlp use ripgrep
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_user_caching = 0
endif

" What to ignore while searching files
set wildignore+=*/.git/*,*/tmp/*,*.swp
    
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

" Vim-pandoc and vim-pandoc-syntax (E.g. :Pandoc! pdf)
" Disable folding for now because level indicators were highlighted ugly
" Problem persists for headers and lists... background is highlighted
let g:pandoc#modules#disabled = ["folding"]

" Set default pdf reader for LLPStartPreview (Latex Live Preview)
let g:livepreview_previewer = 'zathura'

" COMPILING STUFF

" Select Latex Compile Defaults
" filetype plugin indent off
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
" View rules
" let g:Tex_ViewRule_pdf='xdg-open'
let g:Tex_ViewRule_pdf='zathura'
