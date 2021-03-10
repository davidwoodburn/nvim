"  Purpose: initialization file
"  Author:  David Woodburn <david.woodburn@icloud.com>
"  Date:    2021-03-10

"  --------
"  Settings
"  --------

"  Text formatting
filetype plugin on               "  turn on indentation
set linebreak                    "  visually wrap long lines between words
let &showbreak=">  "             "  show at beginning of visually-wrapped lines
set textwidth=80                 "  break after 80 characters
set cinoptions+=:0               "  indent case labels relative to 'switch'
set cinoptions+=l1               "  do not align blocks to end of case label
set expandtab                    "  turn tabs into spaces
set tabstop=3                    "  make tabs 3 spaces wide
set shiftwidth=3                 "  make indents 3 spaces wide
set spell spelllang=en_us        "  turn on spelling for US English
set list                         "  turn on show tabs
set listchars=tab:\|-            "  show tabs as |--
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
set modeline                     "  turn on the reading of settings from files
set modelines=5                  "  set the number of lines read for settings
set spell!                       "  turn on spell checking for all occasions
set smartcase                    "  override ignorecase when capitals are used
set suffixesadd=.c,.m,.tex,.txt,.vim,.md  "  extensions to try for gf (go file)
set undofile                     "  turn on persistent undo
set omnifunc=OmniComplete
set completeopt=menuone

"  Interface
set number                       "  turn on line numbers
set laststatus=2                 "  always show status line
set statusline=\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ \
      \ \{%n\/%{bufnr('$')}\}\ (%{changenr()})\ " _
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
set scrolljump=2                 "  minimum lines to scroll with cursor
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
let g:netrw_sort_by = "name"     "  name, time, size, extension
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

"  (^h) Toggle search hilite visibility
inoremap <silent> <c-h> <esc>:if (v:hlsearch) \| noh \| else
   \ \| set hls \| endif<cr>a
nnoremap <silent> <c-h> :if (v:hlsearch) \| noh \| else
   \ \| set hls \| endif<cr>

"  (^k) Multi-file search for word under cursor or visual-mode selected text
if executable("rg")  "  Use ripgrep (rg), if possible
   set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
else                 "  Otherwise, use grep
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
nnoremap <leader><space> :Rexplore<cr>

"  (\b) Wipeout all hidden buffers
func! Wipebufs()
   "  Get all visible buffers in all tab pages.  This starts with an empty list
   "  and uses the `extend` function to append buffer numbers to the list.  The
   "  `tabpagenr` function returns the number of a tab page.  With the '$' input
   "  it returns a total number of tab pages.  The `tabpagebuflist` function
   "  gets all visible buffers from a given tab page.
   let buflist = []
   for i in range(tabpagenr('$'))
      call extend(buflist, tabpagebuflist(i + 1))
   endfor

   "  Wipeout all hidden buffers.  The `bufnr` function with the '$' input
   "  returns the total number of buffers, visible or not.  The `index` function
   "  returns `-1` if the second parameter is not found in the first parameter.
   "  It returns the zero-based index of the matching value from the first
   "  parameter, otherwise.  The `bufexists` function returns 0 if the given
   "  buffer does not exist and 1 otherwise.  So, if the buffer is not already
   "  in the list of visible buffers, and the buffer does exist, wipe it out.
   for i in range(1, bufnr("$"))
      if index(buflist, i) == -1 && bufexists(i)
         exe 'bw ' . i
      endif
   endfor
endfunc
nnoremap <silent><leader>b :call Wipebufs()<cr>:echo "Bufs wiped"<cr>

"  (\d) Find one-word repeats
nnoremap <leader>d /\(\<\w\+\>\)\s*\<\1\><cr>

"  (\l) New directory
nnoremap <leader>l :sp .<cr>
nnoremap <leader>vl :vs .<cr>
nnoremap <leader>L :tabe .<cr>

"  (\n) Open notes file
nnoremap <silent> <leader>n :sp ~/.config/nvim/notes.txt<cr>:lcd %:p:h<cr>
nnoremap <silent> <leader>vn :vs ~/.config/nvim/notes.txt<cr>:lcd %:p:h<cr>
nnoremap <silent> <leader>N :tabe ~/.config/nvim/notes.txt<cr>:lcd %:p:h<cr>

"  (\r) Retab, remove Windows-style newlines, and find non-ascii characters.
nnoremap <silent> <leader>r :retab<cr>:%s/\r//ge<cr>/[^\x00-\x7F]<cr>

"  (\s) Identify the syntax highlighting rules on text beneath cursor
nnoremap <leader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
   \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
   \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

"  (\t) Create new terminal instance.
nnoremap <silent> <leader>vt :vs<cr>:term<cr>a
nnoremap <silent> <leader>t :sp<cr>:term<cr>:res 10<cr>a
nnoremap <silent> <leader>T :tabe<cr>:term<cr>a

"  (\w) Highlight trailing white-space characters
nnoremap <leader>w /\s\+$<cr>

"
"  Redefined navigation
"

"  Move scroll by more than one line.
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

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
tnoremap <esc> <C-\><C-n>
