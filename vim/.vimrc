" Edwin's VIM
"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"
" TODO disable autopair for prose style types like .txt and .md 
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed; check dashboard or activity. GHD! EdwinWenink; GHA! EdwinWenink
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

" File explorers
Plug 'tpope/vim-vinegar'

" Bulk rename files
Plug 'qpkorr/vim-renamer'

" Fuzzy file finding
Plug 'kien/ctrlp.vim'

" Airline bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Default settings everyone can agree on
Plug 'tpope/vim-sensible'

" Handy mappings
Plug 'tpope/vim-unimpaired'

" Git wrapper
Plug 'tpope/vim-fugitive'

" More useful hlsearch
Plug 'romainl/vim-cool'

" ------------------ CODING/IDE SIMULATION ---------------------------

" Surround with brackets (yss new surroundings, cst" change, ds" delete )
Plug 'tpope/vim-surround'

" Support for using ds, cs and yss with the . command
Plug 'tpope/vim-repeat'

" Autocompletion that only uses native vim autocomplete features
" Plug 'lifepillar/vim-mucomplete'
" Autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Code formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Javascript syntax
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Autclose bracket-like symbols
Plug 'jiangmiao/auto-pairs'

" Graphics shader syntax
Plug 'tikhomirov/vim-glsl'
Plug 'beyondmarc/hlsl.vim'

" Run commands without vim in tmux pane with VimuxRunCommand (you are supposed
" to run vim within tmux then)
Plug 'benmills/vimux'

" Smooth navigation between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

" Keeps track of git changes
" Plug 'airblade/vim-gitgutter'

" Display tags of current file in a sidebar / Class outline
" Plug 'majutsushi/tagbar'

" Full-featured document outliner, e.g. voor markdown or latex (:Voom latex)
Plug 'vim-scripts/VOoM'

" Support for todo.txt
" Plug 'freitass/todo.txt-vim'

" Align e.g. on comma's with ' Tabularize /, '
Plug 'godlygeek/tabular'

" ----------------- WORKFLOW ---------------------------

" Integration of vim with pandoc (also handles markdown formats)
Plug 'vim-pandoc/vim-pandoc' 
Plug 'vim-pandoc/vim-pandoc-syntax' 
" Plug 'masukomi/vim-markdown-folding' "Because I disabled folding in vim-pandoc for now; only works for markdown extension currently. 
" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown / Writing
" Plug 'jtratner/vim-flavored-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'godlygeek/tabular'
Plug 'prashanthellina/follow-markdown-links'  "Press ENTER to follow link
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'

" Latex
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold' "simple regexpr for folding sections

" Autocorrect common typos
" Custom list of iabbrev (1 sec delay on startup)
Plug 'panozzaj/vim-autocorrect' 
" This plugin just accepts the default Vim suggestion (dangerous?)
Plug 'sedm0784/vim-you-autocorrect'

" ----------------- THEME ----------------------

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'swalladge/paper.vim'

" Initialize plugin system
call plug#end()


" ----------------------------------- GENERAL SETTINGS -----------------------------------

" Enable yanking to global clipboard for cross-terminal pasting
set clipboard=unnamedplus
set path+=**

" Enable spellchecking (':set spell' to enable again)
set spell

" Use two spell languages by default
set spelllang=en_us,nl,de

" Accept spelling corrections on the fly
" Source: castel.dev
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" In GUI versions, rely on undercurl for spell errors
highlight SpellBad guibg=NONE 
highlight SpellLocal guibg=NONE ctermbg=Yellow

" Fix unreadable cases in the terminal
highlight Visual ctermbg=Yellow


" Enable syntax highlighting
syntax on 

" Ignore case in searches
set ignorecase

" Allow switching buffers with unsaved work
set hidden

" Change default 8 column tab to 4 column tab and expand to spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Filetype detection
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif


" Set fold level: max level to fold on opening a file
set foldlevel=1

" Set updatetime of .swp file (changed for faster LaTeX preview).
" Default=4000
set updatetime=1000  " Perhaps do a filetype check for .tex or .latex and then only do this? Can this cause lag?

" Settings for vim search
set incsearch
set hlsearch

" Automatically re-read files if unmodified in vim
set autoread

" Enable digraph mode for entering special characters. Ä is produced by typing
" A, then backspace, then ':'
" set digraph

" Disable gui clutter for gVim
" Settings for gVim on Windows
if has ('gui_running')
	if has ('gui_win32')
		"set guifont=Courier_New:h10
		set guifont=PragmataPro_Mono_Liga:h11
		" Enable yanking to global clipboard for cross-terminal pasting
		" Windows requires unnamed instead of unnamedplus
		set clipboard=unnamed
		" Disable gui clutter for gVim
		set guioptions-=m  "menu bar
		set guioptions-=T  "toolbar
		set guioptions-=r  "scrollbar
		" Prevent annoying jumping after resizing
		set guioptions-=r
		set guioptions-=L
		"set shell=powershell
		set shell=cmd.exe
		" Windows assumes colon to be part of path names
		" but that breaks references like file.txt:linenumber
		set isfname -=:
	endif
endif

" Enable base16 colorschemes; take over colorscheme from shell
let base16colorspace=256
set t_Co=256

" Set encoding
set encoding=utf-8
set fileencoding=utf-8

" Highlight current line
set cursorline

" don't give |ins-completion-menu| messages.
set shortmess+=c

" do not show signcolumns
set signcolumn=no

" PYTHON ----------------------------------------

if has ('gui_running')
	if has ('gui_win32')
        " Enable python support on Windows by showing where the .dll is"
        " Check which .dll is expected with :version
        let $PYTHONHOME = 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python36-32\'
        " let $PYTHONHOME = 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python37-32\'
        " Previous line didn't work... so I manually pointed to the python36.dll
        let &pythonthreedll= 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python36-32\python36.dll'
    " let &pythonthreedll= 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python37-32\python37.dll'
    "let g:pymode_python = 'python3'
    endif
endif

augroup python
	autocmd!
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,cla
	autocmd FileType python set foldmethod=indent foldlevel=99
augroup END

" JAVASCRIPT -------------------------------------- 

augroup javascript
    autocmd!
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
    autocmd Filetype javascript set conceallevel=1
augroup END

" vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 0 " default 0



" MAPPINGS --------------------------------------


" Map <F3> to open writer mode
:nnoremap <F3> :Goyo<CR>

" Open locallist vertically with custom function
:nnoremap <F4> :Vlist<CR>

" Map F8 to disabling auto indenting
:nnoremap <F8> :setl noai nocin nosi<CR>

" Map F9 to show tag sidebar (make sure to have ctags installed)
:nmap <F9> :TagbarToggle<CR>

" Escaping insert mode the lazy way 
:inoremap jj <Esc>

" Use space to quickly open and close folds
" :nnoremap <Space> za
" :vnoremap <Space> za

" Open netrw in folder with blog posts 
nnoremap <leader>ws :e ~/Website/personal_website<CR>

" Open philosophy /th/esis folder
nnoremap <leader>th :e ~/Documents/Philosophy/Thesis<CR>

" Generate ctags
nnoremap <leader>tt :silent !ctags -R . <CR>:redraw!<CR>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" Timestamp
iabbrev date- <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
" Invoegen op dezelfde lijn zou beter zijn
nnoremap <leader>ts i--------------<ESC>:put! =strftime(\"%a %Y/%m/%d\")<CR>i<CR>--------------<CR><Down><Down><ESC>

noremap! <expr> ,Y strftime("%Y")
noremap! <expr> ,D strftime("%b")

" Use SPACE to remove the highlighting from the last search
:nnoremap <silent> <Space> :nohlsearch<CR><CR>
:vnoremap <silent> <Space> :nohlsearch<CR><CR>

" Disable arrow movement, resize splits instead
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical-resize +2<CR>
nnoremap <Right> :vertical-resize -2<CR> 

" ------------------ NOTETAKING SYSTEM ---------------------------
"
" Overview of bindings (assuming "\" as leader key)
" All note taking command start with "\n"
" rg executable is assumed for now (I should have regular grep as fallback)
"
" \ni  go to index file (currently tag_index.md)
" \nz  Create a new Zettelkasten entry
" \nu  Call python update script
" \ng  Ngrep
" \nt  Tgrep
" \nv  Vlist
"
" Other useful bindings:
"
" \st  Use CtrlP to search tags (from ctags; TODO can I pass a custom tags file?)
" \tt  Generate ctags for current working directory
" Ctrl-P Ctrl-X  insert markdown link for current search match
"
" TODO Ngrep en tgrep alleen in Zettelkasten laten zoeken MITS ik alle
" notities daarin zet

" Set your note directories here
let g:notes_dir = "~/Documents/Notes/"
let g:zettelkasten = "~/Documents/Notes/Zettelkasten/"

" 'Notes Grep' with ripgrep (see grepprg)
" -i case insensitive
" -g glob pattern
" ! to not immediately open first search result
command! -nargs=1 Ngrep :silent grep! "<args>" -i -g '*.md' $NOTES | execute ':redraw!'
" TODO functie maken om fnameescape(notes_dir) te gebruiken; evalueer
" variabele met execute
nnoremap <leader>ng :Ngrep 
" Tips: use :lne(xt) and :lp(revious) or :lopen for navigation.
" The \c escape makes the search case insensitive

" Variant for searching a tag starting with @
" Prepopulate search with <cword> i.e. tag under cursor, but allow replacement
" TODO are optimalizations possible, e.g. stopping search early?
command! -nargs=1 Tgrep :silent grep! "@<args>" -i -g "*.md" $NOTES | execute ':redraw!'
"nnoremap <leader>t :Tgrep <cword>

" Helper function for calling Tgrep
" If empty string is provided (default), then the word under the cursor 
" is used as the search pattern
" TODO check for rg and use vimgrep as fallback if not present
:function TagGrep(word)
:	if a:word == ""
:		execute "Tgrep ". "<cword>"
:	else 	
:		execute "Tgrep ". a:word
:	endif
:endfunction

nnoremap <leader>nt :call TagGrep("")<left><left>

" Do a Vimgrep on the current word
" https://vim.fandom.com/wiki/Find_in_files_within_Vim
map <leader>c :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Open quickfix list in a right vertical split (good for Ngrep results)

command! Vlist botright vertical copen | vertical resize 50
nnoremap <leader>v : Vlist<CR>

" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES/tag_index.md<CR>:cd $NOTES<CR>

" Quickly create a new entry into the "Zettelkasten" 
" nnoremap <leader>nz :e $NOTES/Zettelkasten/
" (automatically adds markdown extension)
"nnoremap <leader>nz :e C:/Users/Edwin\ Wenink/Documents/Notes/Zettelkasten/
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nz :NewZettel 

" Notes update ('nu'): run python update script
nnoremap <leader>nu :!python "C:\Users\Edwin Wenink\Documents\Notes\update.py"<CR>

" Find and list all Markdown headers
nnoremap <leader>h :g/^#/#<CR>
 
" Open most recently edited file (selects index 1 from :oldfiles)
nnoremap <leader>r `1

" -------------- CtrlP setup for markdown notes ---------------- "

" CtrlP general settings
let g:ctrlp_match_window = 'bottom,order:ttb'

" Binding for searching tags ("search tag")
nnoremap <leader>st :CtrlPTag<CR>

" By default search on filenames and not paths
let g:ctrlp_by_filename = 1

" Make CtrlP just use Vim's current working directory
let g:ctrlp_working_path_mode = 0

" Make ctrlp and vimgrep use ripgrep
if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" CtrlP function for inserting a markdown link with Ctrl-X
" Adapted from: https://vi.stackexchange.com/questions/8976/is-there-a-way-to-insert-a-path-of-the-file-instead-of-opening-it-with-ctrlp-plu
function! CtrlPOpenFunc(action, line)
   if a:action =~ '^h$'    
      " Get the filename
      let filename = fnameescape(fnamemodify(a:line, ':t'))
	  let filename_wo_timestamp = fnameescape(fnamemodify(a:line, ':t:s/\d*-//'))

      " Close CtrlP
      call ctrlp#exit()
      call ctrlp#mrufiles#add(filename)

      " Insert the markdown link to the file in the current buffer
	  let mdlink = "[".filename_wo_timestamp."](".filename.")"
      put=mdlink
  else    
      " Use CtrlP's default file opening function
      call call('ctrlp#acceptfile', [a:action, a:line])
   endif
endfunction

let g:ctrlp_open_func = { 
         \ 'files': 'CtrlPOpenFunc',
         \ 'mru files': 'CtrlPOpenFunc' 
         \ }



" TODO exclude index.md from all search functions


" ---------------- WIP ---------------- "

" Mostly old efforts to work with JSON file

" TODO Write function that writes tags to a tags file
" Read all "@" staments in the first n lines of a file (to avoid e.g.
" @Override matching)
" Write them somewhere, but without duplicates
" Result should be sorted
" Potentially follow standard ctags or helptags syntax so that :tags command
" can be used

" TODO Decode JSON tags file using native Vim functions
" I do not know how to pass a file to json_decode
:function! ReadTagsJSON()
":	e C:\Users\Edwin Wenink\Documents\Notes\tags.json
:	let test_dict = json_decode('{"a":["b"]}')
:	echo test_dict.a
:endfunction

" From https://vim.fandom.com/wiki/Append_output_of_an_external_command
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"TODO I do not know how to avoid these wrapper functions
" Searches JSON index using jq
command! -nargs=1 SearchJSONTags R jq -r ".<args>" "C:\Users\Edwin Wenink\Documents\Notes\tags.json"<CR>
" Wrapper function for making arguments lowercase
:function! IndexTagSearch(tag)
: let l:lower_tag=tolower(a:tag)
: execute "SearchJSONTags " . l:lower_tag
: cd ~/Documents/Notes
:endfunction
nnoremap <leader>nT :call IndexTagSearch("")<left><left>

"TODO e.g. here I would need to find a way to expand the current filename
"TODO replace all references to ~/Documents/Notes with a variable
"expand("%:t") into the command itself...
" Find backlinks to current document
" TODO DOESNT WORK DONT KNOW WHY"
command! -nargs=1 SearchJSONBacklinks R jq -r "<args>" "C:\Users\Edwin Wenink\Documents\Notes\backlinks.json"<CR>
:function! SearchBacklinkJSON()
: execute "SearchJSONBacklinks " . expand("%:t")
: cd ~/Documents/Notes
:endfunction

" Native Vim alternative: search backlinks to current file in backlinks.json
" Only match key values (end with ":")
" Move cursor to first link after finding match
:function! SearchBacklink()
: let current_file=expand("%:t")
: cd ~/Documents/Notes
" Can I combine opening that file with the search?
" Because then the file wouldnt open if the search fails
: e backlinks.json
: execute "normal /" . current_file . ".*:/+1\<CR>w"
:endfunction

nnoremap <leader>nb : call SearchBacklink()<CR>

" GENERAL PLUGIN SETTINGS -----------------------------

" Airline settings
set laststatus=2 

" Avoid showing mode (e.g. -- INSERT -- ) below airline
set noshowmode

" Theme examples: https://github.com/vim-airline/vim-airline/wiki/Screenshots
"let g:airline_theme='base16_3024'
"let g:airline_theme='jellybeans'
let g:airline_theme='simple'
"colorscheme base16-3024

" Ad-hoc highlighting rules 
highlight VertSplit cterm=NONE
highlight FoldColumn ctermbg=NONE

" Deoplete
let g:deoplete#enable_at_startup = 0
" Enable snippet completion
let g:neosnippet#enable_completed_snippet = 1

" Auto pairs
" Avoid conflict with Mucomplete
let g:AutoPairsMapSpace = 0
"imap <silent> <expr> <space> pumvisible()
    "\ ? "<space>"
    "\ : "<c-r>=AutoPairsSpace()<cr>"

let g:AutoPairsMapCR = 0
"imap <Plug>MyCR <Plug>(MUcompleteCR)<Plug>AutoPairsReturn
"imap <cr> <Plug>MyCR

" Issue: C-J is defined in imap.vim, but I want to use it with ultisnips and
" multicomplete. Set it to something else
"imap <C-space> <Plug>IMAP_JumpForward


" Expand snippet on selecting mucomplete entry
" inoremap <silent> <expr> <plug>MyCR
    "\ mucomplete#ultisnips#expand_snippet("\<cr>")
"imap <cr> <plug>MyCR

 "MUComplete settings
"set completeopt+=menuone
"set completeopt+=noselect
"set shortmess+=c "Shut off completion messages
"set belloff+=ctrlg "Disable vim beeping during completion
"let g:mucomplete#enable_auto_at_startup = 1
"let g:mucomplete#completion_delay = 1

" I seem to have introduced some sort of recursive fallback in the case of
" tex, when a completion is not found.
" let g:mucomplete#chains = {
"   \ 'default' : ['path', 'omni',  'ulti', 'keyn', 'dict', 'uspl'],
"   \ }

" Make dir search (wildmenu) ignore certain files for speedup (could also
" check out ctrlp_custom_ignore)
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Vim easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Shader syntax highlighting
augroup shader
    autocmd!
	autocmd BufNewFile,BufRead *.compute set ft=hlsl
	autocmd BufNewFile,BufRead *.compute set nospell
augroup END
    
" VIM / TMUX INTEGRATION -------------------------------

" Hide tmux status bar upon entering vim, and re-enable when leaving vim
" TODO currently seems to give an error when there is no tmux session?
autocmd VimEnter,VimLeave * silent !tmux set status

" Prompt for a command to run in tmux from within vim
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"------------------------------- MARKDOWN/PROSE SETTINGS -------------------------------

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
	autocmd Filetype pandoc,markdown,mkd call pencil#init()
	autocmd Filetype text call pencil#init()
augroup END

"------------------------------- PANDOC and LATEX styling  -------------------------------

" Vim-pandoc and vim-pandoc-syntax (E.g. :Pandoc! pdf)
" let g:pandoc#modules#disabled = ["folding"]
" Temporarily disable these because they do not work with Python 3.7
let g:pandoc#modules#disabled = ["bibliographies", "command", "templates","menu"]
let g:pandoc#modules#warn_disabled = 0
let g:pandoc#syntax#conceal#urls = 1

" Use compound pandoc.markdown for best of both worlds
" TODO write a blogpost about this
augroup pandoc
    autocmd!
    autocmd Filetype pandoc,markdown set filetype=pandoc.markdown
    autocmd Filetype pandoc,markdown set conceallevel=1
    autocmd Filetype pandoc,markdown highlight Conceal ctermbg=NONE
    autocmd Filetype pandoc,markdown highlight Folded ctermbg=NONE
    "autocmd Filetype pandoc,markdown call AutoCorrect()
    "autocmd Filetype pandoc,markdown EnableAutocorrect
augroup END

augroup latex
	autocmd!
	autocmd Filetype tex highlight Folded ctermbg=NONE guibg=NONE
    autocmd Filetype tex highlight Conceal ctermbg=NONE guibg=NONE
    "autocmd Filetype tex EnableAutocorrect
augroup END
			
" Set default pdf reader for LLPStartPreview (Latex Live Preview)
let g:livepreview_previewer = 'zathura'

" Define thesaurus files (insert mode <C-x><C-t>)
set thesaurus+=~/.vim/mthesaur.txt

" Custom spelling replacements (put in another file later)
iabbrev informatoin information

"------------------------------- COMPILING STUFF / LaTeX -------------------------------

" Compile java files from within vim
:command! Javac !javac $(find . -name "*.java")

" Vimtex

"let g:vimtex_enabled = 1
"let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_complete_bib = { 'simple': 1 }
"let g:vimtex_complete_bib = { 'menu_fmt': '[@type] @author_all (@key), "@title"' }

let g:vimtex_compiler_latexmk = {
	\ 'backend' : 'jobs', 
	\ 'background' : 1,
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 0,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

" Vimtex toggle TOC
nnoremap <leader>lt :VimtexTocToggle<CR>

"call deoplete#custom#var('omni', 'input_patterns', {
      "\ 'tex': g:vimtex#re#deoplete
      "\})

" Select Latex Compile Defaults
" filetype plugin indent off
" set shellslash
let g:tex_flavor = "latex"
let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
" View rules
" let g:Tex_ViewRule_pdf='xdg-open'
let g:Tex_ViewRule_pdf='zathura'
