"  Purpose: color scheme
"  Author:  David Woodburn <david.woodburn@icloud.com>
"  Date:    2021-03-02
"
"  This color scheme is designed specifically for use in the terminal, not a
"  GUI, hence the name.  It is designed to explicitly specify each scheme
"  setting so that no settings are inherited from previous scheme choices.  The
"  design choices focus on creating a clean, consistent style that keeps the
"  content as the focus and makes the framework subtle.
"
"  8-bit colors, rather than the 3-bit named colors, were chosen in order to
"  give a consistent appearance across terminal emulators and to provide more
"  choices in color.  Also, although most terminals support 256 colors (8-bit),
"  some (macOS builtin Terminal) do not support millions of colors.  The 8-bit
"  grays range from 232 to 255.  The chosen colors are listed here:
"
"     Name         | Value       | Name         | Value
"     ------------ | ----------- | ------------ | -----
"     black        | 234         | cyan         | 080
"     dark gray    | 235         | green        | 112
"     gray         | 238         | yellow       | 214
"     light gray   | 244         | magenta      | 170
"     white        | 230         | red          | 202
"
"  In an attempt to maintain some consistency, yellow is used to highlight
"  current search selections.  Red is used for errors.  Green is used for
"  literals and non-search highlights.  Cyan is used for keywords that mean
"  something in the given language.  Magenta is used for macros and special
"  characters like '\n'.
"
"  Color is well supported by most terminals, but bold, italics, and underline
"  are not as well supported.  Consequently, this color scheme makes no use of
"  the 'cterm' option, and sets it to 'none' everywhere.
"
"  Color schemes define coloring based on groups.  Some of the color groups are
"  used by the file type for syntax highlighting of the text.  Other color
"  groups are used by the interface for coloring aspects such as the status bar,
"  search results, or the tabs.  Several of the explanatory comments here are
"  taken directly from Vim's help files.
"
"  Some groups will not have any effect on the syntax highlighting, but this is
"  due to the syntax definition file for that file type not linking the
"  appropriate syntax group to the highlight group.  The builtin C syntax file,
"  for example, does not link to the following highlight groups: Boolean,
"  Identifier, Function, Operator, Exception, and Define.
"
"  For more help with highlight groups and explanations of what each one is,
"  enter the following:
"     :help highlight-groups

"  Reset all color highlighting.
hi clear

"  Define the name of this color scheme.
let g:colors_name="cterm8"

"  Try to turn on 8-bit colors. This should be possible for most terminals.
set t_Co=256

"  This is the baseline styling for all text.  The background color is
"  explicitly set here because when left undefined, some terminals will try to
"  be 'smart' and make sure the foreground color has good contrast with the
"  terminal's background color by overriding the foreground color choices you
"  have made.  To prevent this behavior, you can explicitly set the background
"  color, which has been done here.
hi Normal            ctermfg=230          ctermbg=234          cterm=none

"  --------------------------
"  Syntax-highlighting groups
"  --------------------------

"  For each of the following sets of color groups, the order matters.  The first
"  in each set defines all the groups that follow.  The groups after the first
"  modify the settings made by the first group in the set.

"  Constant is any constant literal.
hi Constant          ctermfg=112          ctermbg=none         cterm=none
hi String            ctermfg=202          ctermbg=none         cterm=none
hi Character         ctermfg=202          ctermbg=none         cterm=none
hi Number            ctermfg=112          ctermbg=none         cterm=none
hi Boolean           ctermfg=112          ctermbg=none         cterm=none
hi Float             ctermfg=112          ctermbg=none         cterm=none

"  Identifier is any variable, function, method, class, etc. name. Functions
"  includes methods for classes.
hi Identifier        ctermfg=080          ctermbg=none         cterm=none
hi Function          ctermfg=080          ctermbg=none         cterm=none

"  These are reserved keywords. Statement includes 'return', 'break'.
"  Conditional includes 'if', 'else', 'switch'.  Label includes 'case' and
"  'default'.  Operator includes 'sizeof', '+', '*', etc.  Exception includes
"  'try', 'catch', 'throw'.  And, Keyword is any other keyword.
hi Statement         ctermfg=080          ctermbg=none         cterm=none
hi Conditional       ctermfg=080          ctermbg=none         cterm=none
hi Repeat            ctermfg=080          ctermbg=none         cterm=none
hi Label             ctermfg=080          ctermbg=none         cterm=none
hi Operator          ctermfg=230          ctermbg=none         cterm=none
hi Exception         ctermfg=080          ctermbg=none         cterm=none
hi Keyword           ctermfg=080          ctermbg=none         cterm=none

"  These are any of the preprocessor keywords.  PreProc is the general category.
"  Include is 'include'.  Define is 'define'.  Macro is the same as Define.
"  PreCondit (preprocessor conditional) includes '#if', '#endif', etc.
hi PreProc           ctermfg=170          ctermbg=none         cterm=none
hi Include           ctermfg=170          ctermbg=none         cterm=none
hi Define            ctermfg=170          ctermbg=none         cterm=none
hi Macro             ctermfg=170          ctermbg=none         cterm=none
hi PreCondit         ctermfg=170          ctermbg=none         cterm=none

"  Type includes 'int', 'float', ' ctermfg', etc.  StorageClass includes
"  'const', 'static', etc.  Structure includes 'struct', 'union', 'enum', etc.
"  Typedef includes 'typedef'.
hi Type              ctermfg=080          ctermbg=none         cterm=none
hi StorageClass      ctermfg=080          ctermbg=none         cterm=none
hi Structure         ctermfg=080          ctermbg=none         cterm=none
hi Typedef           ctermfg=080          ctermbg=none         cterm=none

"  Special is the general group category.  It includes any special symbol.
"  SpecialChar includes escape sequences in strings or any special character
"  in a constant.  Tag is any word that has been tagged by programs like ctags
"  and can be searched with 'CTRL-]'.  Delimiter is a character that needs
"  attention.  SpecialComment is special things inside a comment.  Debug is any
"  debugging statement.
hi Special           ctermfg=170          ctermbg=none         cterm=none
hi SpecialChar       ctermfg=170          ctermbg=none         cterm=none
hi Tag               ctermfg=244          ctermbg=none         cterm=none
hi Delimiter         ctermfg=214          ctermbg=none         cterm=none
hi SpecialComment    ctermfg=112          ctermbg=none         cterm=none
hi Debug             ctermfg=202          ctermbg=none         cterm=none

"  Any text that stands out, like HTML links or titles
hi Underlined        ctermfg=214          ctermbg=none         cterm=none

"  Keywords such as 'TODO', 'FIXME', or 'NOTE' in comments
hi Todo              ctermfg=234          ctermbg=112          cterm=none

"  Error is any erroneous construct.
hi Error             ctermfg=234          ctermbg=202          cterm=none

"  Comments
hi Comment           ctermfg=244          ctermbg=none         cterm=none

"  ---------------------
"  User-interface groups
"  ---------------------

"  Although these color groups are grouped according to the similar aspects of
"  the interface that they control, the order does not matter.

"  SpecialKey is text that is displayed differently than what it really is,
"  such as '|--' for a tab character.  NonText is any character that does not
"  really exist in the text but is used to convey some information to the user,
"  such as where a line break is.  Ignore is any text that is to be ignored by
"  hiding it.  Conceal is any placeholder characters substituted for concealed
"  text.  Concealed text is text that can be completely hidden (no character
"  displayed) as with `set conceallevel=2`.
hi SpecialKey        ctermfg=238          ctermbg=none         cterm=none
hi NonText           ctermfg=235          ctermbg=none         cterm=none
hi Ignore            ctermfg=none         ctermbg=234          cterm=none
hi Conceal           ctermfg=none         ctermbg=234          cterm=none

"  Spell checking can be turned on by the command 'set spell'.  SpellBad is for
"  miss-spelled words.  SpellCap is for words that should start with a capital
"  letter.  SpellLocal is for correctly spelled words that do not fit the
"  set region.  For example 'grey' is the British spelling; 'gray' is the US
"  spelling.  SpellRare is for correctly spelled words that are just rarely ever
"  used.
hi SpellBad          ctermfg=202          ctermbg=235          cterm=none
hi SpellCap          ctermfg=202          ctermbg=235          cterm=none
hi SpellLocal        ctermfg=202          ctermbg=235          cterm=none
hi SpellRare         ctermfg=none         ctermbg=none         cterm=none

"  MatchParen is for matching parentheses, brackets, and braces.
hi MatchParen        ctermfg=230          ctermbg=238          cterm=none

"  Visual is the selected text in visual mode.  VisualNOS is the visual mode
"  selection when Vim is 'Not Owning the Selection'.  This means that some other
"  program has overridden what Vim had put into the X clipboard.
hi Visual            ctermfg=none         ctermbg=238          cterm=none
hi VisualNOS         ctermfg=none         ctermbg=238          cterm=none

"  Cursor is the character under the cursor, but it seems to be irrelevant
"  because the cursor color is controlled by the terminal emulator.  lCursor
"  is the character under the cursor when 'language-mapping' is used.
"  CursorIM is like Cursor, but used when in IME mode.  CursorColumn is the
"  whole column of text under the cursor.  It only takes effect when that
"  feature is turned on with the 'set cursorcolumn' command.  CursorLine is the
"  whole row of text (in the current split) under the cursor.  CursorLineNr is
"  the actual line number text on the row the cursor is on.  Both CursorLine and
"  CursorLineNr only take effect when those features are turned on with 'set
"  cursorline'.  Because of performance issues, most of these are turned 'off'
"  by setting them to 'none'.
hi Cursor            ctermfg=none         ctermbg=244          cterm=none
hi lCursor           ctermfg=none         ctermbg=244          cterm=none
hi CursorIM          ctermfg=none         ctermbg=244          cterm=none
hi CursorColumn      ctermfg=none         ctermbg=244          cterm=none
hi CursorLine        ctermfg=none         ctermbg=none         cterm=none
hi CursorLineNr      ctermfg=230          ctermbg=238          cterm=none

"  LineNr is the column of text showing the line numbers for each row of text.
"  LineNrAbove is the line numbers above the row the cursor is on.  LineNrBelow
"  is the line numbers below the row the cursor is on.  Both LineNrAbove and
"  LineNrBelow apply only when the 'set relativenumber' command has been given.
"  EndOfBuffer is the filler '~' in the line number column used beyond the last
"  line of text in a file.  By default, this color group will match the NonText
"  color group.  It has been made to match the background so you do not see it.
hi LineNr            ctermfg=238          ctermbg=none         cterm=none
hi LineNrAbove       ctermfg=238          ctermbg=none         cterm=none
hi LineNrBelow       ctermfg=238          ctermbg=none         cterm=none
hi EndOfBuffer       ctermfg=234          ctermbg=none         cterm=none

"  VertSplit is the column separating the vertically split windows.  By setting
"  both the foreground and background to the same color, you cannot see the '|'
"  characters.
hi VertSplit         ctermfg=235          ctermbg=235          cterm=none

"  Folded is the whole row of text where a fold is made.  FoldColumn is the
"  extra column (or columns) to the left of the line numbers reserved for
"  marking which row folds are on.  This depends on the 'set foldcolumn='
"  command, which is 0 (off) by default.  SignColumn is a column reserved for
"  signals, such as from debuggers.
hi Folded            ctermfg=238          ctermbg=none         cterm=none
hi FoldColumn        ctermfg=234          ctermbg=214          cterm=none
hi SignColumn        ctermfg=230          ctermbg=none         cterm=none

"  ColorColumn is used for text columns that are specifically highlighted by
"  the 'set colorcolumn=' command.  It can be used for aligning text.
hi ColorColumn       ctermfg=230          ctermbg=235          cterm=none

"  These are for use with Vim's Diff mode.  You can enter 'vimdiff' followed by
"  two or more files to compare with each other.  DiffAdd is for added lines of
"  text.  DiffDelete is for deleted lines.  DiffChange is for changed lines.
"  And, DiffText is for changed text within a changed line.
hi DiffAdd           ctermfg=234          ctermbg=112          cterm=none
hi DiffDelete        ctermfg=234          ctermbg=202          cterm=none
hi DiffChange        ctermfg=none         ctermbg=none         cterm=none
hi DiffText          ctermfg=234          ctermbg=214          cterm=none

"  ErrorMsg is for error messages on the command line.  WarningMsg is for
"  warning messages on the command line.  ModeMsg is the message in the command
"  line telling you which mode you are in.  MoreMsg is the message in the
"  command line telling you more messages are available.
hi ErrorMsg          ctermfg=202          ctermbg=none         cterm=none
hi WarningMsg        ctermfg=214          ctermbg=none         cterm=none
hi ModeMsg           ctermfg=230          ctermbg=none         cterm=none
hi MoreMsg           ctermfg=230          ctermbg=none         cterm=none

"  Search is for search results in text.  IncSearch is for incremental search
"  results which are the results found as you are typing.
hi Search            ctermfg=234          ctermbg=214          cterm=none
hi IncSearch         ctermfg=234          ctermbg=230          cterm=none

"  The popup menu is opened when you are typing a word and you hit either
"  'CTRL-n' or 'CTRL-p'.  Pmenu is all but the currently selected item in the
"  popup list.  PmenuSel is the currently selected item in the popup list.
"  PmenuThumb is the marker in the scroll bar on the right of the popup list
"  showing where in the scrolling you are.  PmenuSbar is the rest of the scroll
"  bar.
hi Pmenu             ctermfg=244          ctermbg=235          cterm=none
hi PmenuSel          ctermfg=234          ctermbg=214          cterm=none
hi PmenuThumb        ctermfg=244          ctermbg=238          cterm=none
hi PmenuSbar         ctermfg=244          ctermbg=235          cterm=none

"  Question is the prompt you get to questions such as yes or no questions.
"  QuickFixLine is the currently chosen line in a quickfix window.
hi Question          ctermfg=080          ctermbg=none         cterm=none
hi QuickFixLine      ctermfg=235          ctermbg=112          cterm=none

"  StatusLine is the title bar of the currently selected window.  It is also all
"  but the selected command line auto-complete (wildmenu) option.  StatusLineNC
"  is the title bar of all but the currently selected window.  A terminal
"  instance can be run directly inside Vim by the command 'term' or 'vert term'.
"  You can end this terminal instance by entering 'CTRL-w CTRL-c' while in its
"  window.  This instance will be displayed as another window.  The
"  StatusLineTerm is the title bar when the terminal window is selected.  The
"  StatusLineTermNC is the title bar when the terminal window is not selected.
"  And, Terminal is the main text area of the terminal window.  WildMenu is the
"  currently selected command line auto-complete (wildmenu) option.
hi StatusLine        ctermfg=230          ctermbg=238          cterm=none
hi StatusLineNC      ctermfg=244          ctermbg=235          cterm=none
hi StatusLineTerm    ctermfg=230          ctermbg=238          cterm=none
hi StatusLineTermNC  ctermfg=244          ctermbg=235          cterm=none
hi Terminal          ctermfg=230          ctermbg=234          cterm=none
hi WildMenu          ctermfg=234          ctermbg=214          cterm=none

"  If you have multiple tab pages open, a row of text will be created to list
"  the tab pages.  TabLine is all but the currently selected tab page.
"  TabLineSel is the currently selected tab page.  TabLineFill is the tab pages
"  line where no labels are.
hi TabLine           ctermfg=244          ctermbg=235          cterm=none
hi TabLineSel        ctermfg=230          ctermbg=238          cterm=none
hi TabLineFill       ctermfg=none         ctermbg=none         cterm=none

"  You can list all the set options by the command 'set all' or 'set termcap'
"  (for the terminal).  You can also list all defined auto-commands by
"  'autocmd'.  These will create a new window listing the results of the query.
"  In this window, sections of the results are titled.  Title is these titles of
"  the sections of the results.  Title is also the buffer counter at the
"  beginning of tab page titles.
hi Title             ctermfg=234          ctermbg=112          cterm=none

"  Directory names and other special names in listings
hi Directory         ctermfg=244          ctermbg=none         cterm=none
