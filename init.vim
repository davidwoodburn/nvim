"  Purpose: initialization file
"  Author:  David Woodburn <david.woodburn@icloud.com>
"  Date:    2021-01-29

"  --------
"  Settings
"  --------

"  Text formatting
filetype indent on               "  turn on indentation
set linebreak                    "  visually wrap long lines between words
set textwidth=80                 "  break after 80 characters
set cinoptions+=:0               "  indent case labels relative to 'switch'
set cinoptions+=l1               "  do not align blocks to end of case label
set expandtab                    "  turn tabs into spaces
set tabstop=3                    "  make tabs 3 spaces wide
set shiftwidth=3                 "  make indents 3 spaces wide
set spell spelllang=en_us        "  turn on spelling for US English
set list                         "  turn on show tabs
set listchars=tab:\|-            "  show tabs as >--
syntax enable                    "  enable syntax highlighting
set background=dark              "  turn on the dark theme
colo cterm8                      "  choose the color scheme
let g:tex_no_error=1             "  turn off error markup for LaTeX
let g:tex_flavor = "latex"       "  set the default tex file type

"  Typing and commands
set backspace+=indent            "  allow backspacing over autoindent
set backspace+=eol               "  allow backspacing over line breaks
set backspace+=start             "  allow backspacing over start of insert
set nrformats+=alpha             "  turn on increments for alpha characters
set com=sr:/*,mb:\ ,ex:*/        "  set comments style
set modeline                     "  turn on the reading of settings from files
set modelines=5                  "  set the number of lines read for settings
set spell!                       "  turn on spell checking for all occasions
"set ignorecase                  "  do not ignore case when searching
set smartcase                    "  override ignorecase when capitals are used
set suffixesadd=.c,.m,.tex,.txt,.vim,.md  "  extensions to try for gf (go file)

"  Interface
set number                       "  turn on line numbers
set laststatus=2                 "  always show status line
set statusline=\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ \ \{%n\/%{bufnr('$')}\}\  "_
set splitbelow                   "  make windows split below, not above
set splitright                   "  make windows split right, not left
set mouse=a                      "  turn on the mouse for all modes
set hlsearch                     "  highlight matching search strings
set icm=split                    "  highlight matches as you type
set ruler                        "  show the line and column number of cursor
set cursorline                   "  highlight the line the cursor is on
set colorcolumn=                 "  turn off the color column
set wildmenu                     "  turn on command-line autocompletion (tab)
set wildignore=*.o,*~            "  ignore certain file types for autocompletion
set showcmd                      "  show commands in the bottom-right corner
set scrolloff=1                  "  set the default scroll offset to one
set scrolljump=3                 "  minimum lines to scroll with cursor
set noswapfile                   "  do not create swap files (temp save files)
set belloff=all                  "  turn off all bell sounds
set noerrorbells                 "  turn off error bells
set novisualbell                 "  turn off visual bells
set t_vb=                        "  turn off screen flashes

"  File browsing
let g:netrw_banner = 0           "  turn off the netrw (browser) banner
let g:netrw_preview = 1          "  split vertical
let g:netrw_alto = 1             "  split right
let g:netrw_liststyle = 1        "  (0) thin, (1) long, (2) wide, (3) tree
let g:netrw_sizestyle = "H"      "  (b) bytes, (h) base-1000, (H) base-1024
let g:netrw_browse_split = 0     "  (0) replace, (1) sp, (2) vs, (3) tabe
let g:netrw_sort_options ="i"    "  ignore case when sorting file names
let g:netrw_sort_by = "name"     "  name, time, size, exten
let g:netrw_timefmt = "%Y.%m.%d %H:%M" "  custom date and time format
let g:netrw_keepdir = 0          "  change directory to what is visible

"  ------------------
"  Automatic commands
"  ------------------

"  Remove trail
au BufWritePre * %s/\s\+$//e

"  Turn off line numbers in terminal mode.
au TermOpen * setlocal nonumber norelativenumber

"  --------
"  Mappings
"  --------

"
"  Control key
"

"  (^c) Toggle 80-character limit line
inoremap <silent> <c-c> <esc>:exe "set cc="
   \ . (&colorcolumn == "" ? "81" : "")<cr>a
nnoremap <silent> <c-c> :exe "set cc="
   \ . (&colorcolumn == "" ? "81" : "")<cr>

"  (^h) Turn off hilite
inoremap <silent> <c-h> <esc>:noh<cr>a
nnoremap <silent> <c-h> :noh<cr>

"  (^k) Multi-file search for word under cursor or visual-mode selected text
if executable("rg")  "  Use ripgrep (rg), if possible.
   set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
else                 "  Or, use grep.
   set grepprg=grep\ --vimgrep\ --no-heading\ --smart-case
endif
nnoremap <c-k> :silent exe "grep! -r_ "
   \ . shellescape(expand("<cword>"))
   \ . " ."<cr>:botright copen<cr><c-l>
vnoremap <c-k> "ky:silent grep! -r_ -F "<c-r>k" .<cr>
   \ :botright copen<cr><c-l>

"  (^p) File name search
fun FindFile(filename)
   let error_file = tempname()
   silent exe '!find . -name "'
      \ . a:filename . '" | xargs file | sed "s/:/:1:/" > '
      \ . error_file
   set errorformat=%f:%l:%m
   exe "cgetfile " . error_file
   call delete(error_file)
   botright copen
endfun
nnoremap <c-p> :call FindFile("*<cword>*")<cr>

"  (^q) Close
nnoremap <c-q> :update<cr>:q<cr>

"  (^s) Save
nnoremap <c-s> :w<cr>
inoremap <silent> <c-s> <esc>:w<cr>a

"  (^z) Toggle spell checking
inoremap <silent> <c-z> <esc>:set spell!<cr>a
nnoremap <silent> <c-z> :set spell!<cr>

"
"  Leader key
"

"  (\ ) Invoking netrw in a split vertical window
nnoremap <Leader><Space> :Rexplore<CR>

"  (\a) Highlight non-ascii characters
nnoremap <leader>a /[^\x00-\x7F]<cr>

"  (\b) Close buffer without closing window
nnoremap <silent> <leader>b :bn<bar>bd#<cr>

"  (\r) Retab, remove Windows-style newlines, and find non-ascii characters.
nnoremap <silent> <leader>r :retab<cr>:%s/\r//ge<cr>/[^\x00-\x7F]<cr>

"  (\s) Identify the syntax highlighting rules on text beneath cursor
map <leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
   \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
   \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

"  (\t) Create new vertical terminal instance.
nnoremap <silent> <leader>t :vs .<cr>:term<cr>a

"  (\w) Highlight trailing white-space characters
nnoremap <leader>w /\s\+$<cr>

"
"  Redefined navigation
"

"  Move scroll by more than one line.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"  Faster buffer navigation.
nnoremap <silent> <PageUp>   :bprevious<cr>
nnoremap <silent> <PageDown> :bnext<cr>

"
"  Terminal mode
"

"  Exit terminal mode and close split.
tnoremap <c-q> <c-\><c-n>:q<cr>

"  Exit terminal mode and switch splits.
tnoremap <c-w><c-h>  <c-\><c-n><c-w><c-h>
tnoremap <c-w><c-j>  <c-\><c-n><c-w><c-j>
tnoremap <c-w><c-k>  <c-\><c-n><c-w><c-k>
tnoremap <c-w><c-l>  <c-\><c-n><c-w><c-l>

"  Exit terminal mode.
tnoremap <Esc> <C-\><C-n>
