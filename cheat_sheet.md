```
             __      __               _____ _                _
             \ \    / (_)            / ____| |              | |
              \ \  / / _ _ __ ___   | |    | |__   ___  __ _| |_
               \ \/ / | | '_ ` _ \  | |    | '_ \ / _ \/ _` | __|
                \  /  | | | | | | | | |____| | | |  __/ (_| | |_
                 \/   |_|_| |_| |_|  \_____|_| |_|\___|\__,_|\__|
                          _____ _               _
                         / ____| |             | |
                        | (___ | |__   ___  ___| |_
                         \___ \| '_ \ / _ \/ _ \ __|
                         ____) | | | |  __/  __/ |_
                        |_____/|_| |_|\___|\___|\__|
```

Vim Installation with Clipboard Support
---------------------------------------

Using Homebrew, enter

   -  brew rm vim
   -  brew update
   -  cd /usr/local
   -  brew install vim

Quit the Terminal and reopen. This will reinstall vim fresh and you should be
able to copy and paste to the clipboard with `"+y` and `"+p`, or with `"*y` and
`"*p`.

Movement
--------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `h`       | move left                                                       |
| `j`       | move down                                                       |
| `k`       | move up                                                         |
| `l`       | move right                                                      |
| `w`       | jump by start of words (punctuation considered words)           |
| `W`       | jump by words (spaces separate words)                           |
| `e`       | jump to end of words (punctuation considered words)             |
| `E`       | jump to end of words (no punctuation)                           |
| `b`       | jump backward by words (punctuation considered words)           |
| `B`       | jump backward by words (no punctuation)                         |
| `0`       | (zero) start of line                                            |
| `^`       | first non-blank character of line                               |
| `$`       | end of line                                                     |
| `}`       | go to next paragraph                                            |
| `{`       | go to previous paragraph                                        |
| `gg`      | go to beginning of document                                     |
| `G`       | go to end of document (`5G` goes to line 5)                     |
| `f{char}` | find next character matching {char} and move cursor to it       |
| `F{char}` | find previous character matching {char} and move cursor to it   |
| `;`       | go to the next result from either f{char} or F{char}            |
| `,`       | go to the previous result form either `f{char}` or `F{char}`    |
| `^f`      | page down                                                       |
| `^b`      | page up                                                         |
| `^e`      | scroll down without moving cursor                               |
| `^y`      | scroll up without moving cursor                                 |
| `zz`      | center scroll to current line                                   |
| `zt`      | scroll down until current line is at top                        |
| `zb`      | scroll up until current line is at bottom                       |

Prefix a cursor movement command with a number to repeat it. For example, 4j
moves down 4 lines.

Insert Mode
-----------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `i`       | start insert mode at cursor                                     |
| `I`       | insert at the beginning of the line                             |
| `a`       | append after the cursor                                         |
| `A`       | append at the end of the line                                   |
| `o`       | open (append) blank line below current line                     |
| `O`       | open blank line above current line                              |
| `Esc`     | exit insert mode (or enter `^[`)                                |

Editing
-------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `r{char}` | replace a single character (does not use insert mode)           |
| `J`       | join line below to the current one                              |
| `gqq`     | hard wrap the text of the line the cursor is on                 |
| `gq`      | hard wrap the selected lines                                    |
| `yy`      | yank (copy) a line                                              |
| `#yy`     | yank # lines                                                    |
| `yw`      | yank word                                                       |
| `yiw`     | yank inner word (from beginning to end of current word)         |
| `y$`      | yank to end of line                                             |
| `p`       | put (paste) the clipboard after cursor                          |
| `P`       | put (paste) before cursor                                       |
| `dd`      | delete (cut) a line                                             |
| `dw`      | delete (cut) the current word                                   |
| `de`      | delete to the end of the current word                           |
| `x`       | delete (cut) current character                                  |
| `xp`      | transpose two letters (delete and paste, technically)           |
| `s`       | delete character at cursor and substitute text                  |
| `S`       | delete line at cursor and substitute text (same as cc)          |
| `cc`      | change (replace) an entire line (same as S)                     |
| `cw`      | change (replace) to the end of word                             |
| `ciw`     | change inner word (everything from beginning to end of word)    |
| `c$`      | change (replace) to the end of line                             |
| `u`       | undo                                                            |
| `^r`      | redo                                                            |
| `.`       | repeat last command                                             |
| `I`       | insert during column-select mode (after ^v)                     |
| `^n`      | autocomplete                                                    |
| `^v{tab}` | enter a literal tab                                             |
| `^r"`     | enter the contents of the " register (in insert mode)           |
| `r*`      | enter the contents of the system clipboard (in insert mode)     |
| `z=`      | list possible spellings of word under cursor                    |
| `]s`      | go to next misspelled word                                      |
| `[s`      | go to previous misspelled word                                  |

Visual or Normal Mode
---------------------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `v`       | start visual mode, mark lines, then do command                  |
| `V`       | start linewise visual mode                                      |
| `o`       | move to other end of marked area                                |
| `^v`      | start visual block mode (column-select mode)                    |
| `O`       | move to Other corner of block                                   |
| `aw`      | mark a word                                                     |
| `ab`      | Select the whole text within and including ()                   |
| `aB`      | Select the whole text within and including {}                   |
| `ib`      | Select the whole text within ()                                 |
| `iB`      | Select the whole text within {}                                 |
| `>`       | shift right                                                     |
| `<`       | shift left                                                      |
| `y`       | yank (copy) marked text                                         |
| `d`       | delete marked text                                              |
| `w`       | Select word with ending space                                   |
| `W`       | Select word (looser sense) with ending space                    |
| `e`       | Select word, no ending space                                    |
| `E`       | Select word (looser sense), no ending space                     |
| `~`       | switch case                                                     |
| `^a`      | increment all selected values by 1                              |
| `^x`      | decrement all selected values by 1                              |
| `#^a`     | increment all selected values by #                              |
| `#^x`     | decrement all selected values by #                              |
| `#g^a`    | progressively increment all values by #                         |
| `#g^x`    | progressively decrement all values by #                         |
| `yip`     | yank inner paragraph                                            |
| `dip`     | delete inner paragraph                                          |
| `Esc`     | exit visual mode (or enter ^[)                                  |
| `K`       | go to entry in the manual for word under cursor                 |

Replace Mode
------------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `R`       | enter replace mode (any text you type overwrites older text)    |
| `Esc`     | exit replace mode (or enter `^[`)                               |

Folding
-------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `zM`      | fold all functions (Mask)                                       |
| `zR`      | unfold all functions (Reveal)                                   |

Exiting
-------

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `Esc`     | return to normal mode from any other mode                       |
| `^[`      | return to normal mode from any other mode (same as Esc)         |
| `:w`      | write (save) the file (':set noreadonly' for RO files)          |
| `:wq`     | write (save) the file and quit                                  |
| `:q`      | quit (fails if anything has changed)                            |
| `:q!`     | quit and throw away changes                                     |

Search and Replace
------------------

| Keys         | Action                                                       |
| ------------ | ------------------------------------------------------------ |
| `/`          | pattern search for pattern                                   |
| `?`          | pattern search backward for pattern                          |
| `n`          | repeat search in same direction                              |
| `N`          | repeat search in opposite direction                          |
| `:%s/a/b/g`  | replace all a with b throughout file                         |
| `:%s/a/b/gc` | replace all a with b throughout file with confirmations      |

Files, Windows, and Tabs
------------------------

| Keys            | Action                                                    |
| --------------- | --------------------------------------------------------- |
| `:e`            | filename Edit a file in a new buffer                      |
| `:bn`           | go to next buffer                                         |
| `:bp`           | go to previous buffer                                     |
| `:bd`           | delete a buffer (close a file)                            |
| `:sp {dir}`     | open a directory in a new buffer and horiz split window   |
| `:vs {dir}`     | open a directory in a new buffer and vert split window    |
| `:vs`           | open the current file in another vertical split           |
| `:e {dir}`      | open a directory in the current split                     |
| `:e`            | reopen the current file (refresh)                         |
| `^ww`           | switch between windows                                    |
| `^wh`           | move focus to split on left                               |
| `^wj`           | move focus to split below                                 |
| `^wk`           | move focus to split above                                 |
| `^wl`           | move focus to split right                                 |
| `^wq`           | quit a window                                             |
| `^wv`           | split windows vertically (right)                          |
| `^ws`           | split windows horizontally (below)                        |
| `^wr`           | swap splits                                               |
| `^wH`           | move split to left                                        |
| `^wJ`           | move split to bottom                                      |
| `^wK`           | move split to top                                         |
| `^wL`           | move split to right                                       |
| `^wT`           | move split to new tab                                     |
| `:tabe {dir}`   | open a directory or file in another tab                   |
| `gt`            | go to next tab                                            |
| `gT`            | go to previous tab                                        |
| `gf`            | go to file under cursor                                   |

Unicode characters
------------------

In insert mode, press ctrl-v, u, and one of the Unicode values below:

| Symbol | Value  | Name      |     | Symbol | Value  | Name      |
| ------ | ------ | --------- | --- | ------ | ------ | --------- |
| Γ      | 0393   | Gamma     |     | ι      | 03B9   | iota      |
| Δ      | 0394   | Delta     |     | κ      | 03BA   | kappa     |
| Θ      | 0398   | Theta     |     | λ      | 03BB   | lambda    |
| Λ      | 039B   | Lambda    |     | μ      | 03BC   | mu        |
| Ξ      | 039E   | Xi        |     | ν      | 03BD   | nu        |
| Π      | 03A0   | Pi        |     | ξ      | 03BE   | xi        |
| Σ      | 03A3   | Sigma     |     | ο      | 03BF   | omicron   |
| Φ      | 03A6   | Phi       |     | π      | 03C0   | pi        |
| Ψ      | 03A8   | Psi       |     | ρ      | 03C1   | rho       |
| Ω      | 03A9   | Omega     |     | ς      | 03C2   | sigmaf    |
| α      | 03B1   | alpha     |     | σ      | 03C3   | sigma     |
| β      | 03B2   | beta      |     | τ      | 03C4   | tau       |
| γ      | 03B3   | gamma     |     | υ      | 03C5   | upsilon   |
| δ      | 03B4   | delta     |     | φ      | 03C6   | phi       |
| ε      | 03B5   | epsilon   |     | χ      | 03C7   | chi       |
| ζ      | 03B6   | zeta      |     | ψ      | 03C8   | psi       |
| η      | 03B7   | eta       |     | ω      | 03C9   | omega     |
| θ      | 03B8   | theta     |     | ∫      | 222B   | integral  |

Netrw
-----

Netrw is the built-in directory and file browser.

| Key       | Action                                                          |
| ------    | --------------------------------------------------------------- |
| `<F1>`    | Causes Netrw to issue help                                      |
| `<cr>`    | Netrw will enter the directory or read the file                 |
| `<del>`   | Netrw will attempt to remove the file/directory                 |
| `<c-h>`   | Edit file hiding list                                           |
| `<c-l>`   | Causes Netrw to refresh the directory listing                   |
| `<c-r>`   | Browse using a gvim server                                      |
| `<c-tab>` | Shrink/expand a netrw/explore window                            |
| `-`       | Makes Netrw go up one directory                                 |
| `a`       | Cycles between normal display,                                  |
|           | hiding (suppress display of files matching g:netrw_list_hide)   |
|           | and showing (display only files which match g:netrw_list_hide)  |
| `cd`      | Make browsing directory the current directory                   |
| `C`       | Setting the editing window                                      |
| `d`       | Make a directory                                                |
| `D`       | Attempt to remove the file(s)/directory(ies)                    |
| `gb`      | Go to previous bookmarked directory                             |
| `gd`      | Force treatment as directory                                    |
| `gf`      | Force treatment as file                                         |
| `gh`      | Quick hide/unhide of dot-files                                  |
| `gn`      | Make top of tree the directory below the cursor                 |
| `i`       | Cycle between thin, long, wide, and tree listings               |
| `I`       | Toggle the displaying of the banner                             |
| `mb`      | Bookmark current directory                                      |
| `mc`      | Copy marked files to marked-file target directory               |
| `md`      | Apply diff to marked files (up to 3)                            |
| `me`      | Place marked files on arg list and edit them                    |
| `mf`      | Mark a file                                                     |
| `mF`      | Unmark files                                                    |
| `mg`      | Apply vimgrep to marked files                                   |
| `mh`      | Toggle marked file suffices' presence on hiding list            |
| `mm`      | Move marked files to marked-file target directory               |
| `mp`      | Print marked files                                              |
| `mr`      | Mark files using a shell-style |regexp|                         |
| `mt`      | Current browsing directory becomes markfile target              |
| `mT`      | Apply ctags to marked files                                     |
| `mu`      | Unmark all marked files                                         |
| `mv`      | Apply arbitrary vim   command to marked files                   |
| `mx`      | Apply arbitrary shell command to marked files                   |
| `mX`      | Apply arbitrary shell command to marked files en bloc           |
| `mz`      | Compress/decompress marked files                                |
| `o`       | Enter the file/directory under the cursor in a new              |
|           | browser window.  A horizontal split is used.                    |
| `O`       | Obtain a file specified by cursor                               |
| `p`       | Preview the file                                                |
| `P`       | Browse in the previously used window                            |
| `qb`      | List bookmarked directories and history                         |
| `qf`      | Display information on file                                     |
| `qF`      | Mark files using a quickfix list                                |
| `qL`      | Mark files using a |location-list|                              |
| `r`       | Reverse sorting order                                           |
| `R`       | Rename the designated file(s)/directory(ies)                    |
| `s`       | Select sorting style: by name, time, or file size               |
| `S`       | Specify suffix priority for name-sorting                        |
| `t`       | Enter the file/directory under the cursor in a new tab          |
| `u`       | Change to recently-visited directory                            |
| `U`       | Change to subsequently-visited directory                        |
| `v`       | Enter the file/directory under the cursor in a new              |
|           | browser window.  A vertical split is used.                      |
| `x`       | View file with an associated program                            |
| `X`       | Execute filename under cursor via |system()|                    |
| `%`       | Open a new file in netrw's current directory                    |
