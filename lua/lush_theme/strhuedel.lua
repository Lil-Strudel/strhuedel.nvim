local lush = require('lush')
local hsl = lush.hsl

local bg_light = '#35332C'
local bg = '#272520'
local bg_dark = '#1B1A18'

local fg = '#FEF6E6'
local fg_dark = '#DED2BA'
local fg_darkest = '#A39C8F'

local ghost = '#5E5B55'
local ghost_dark = '#484743'

local red = '#F46B73'
local orange = '#F2A77D'
local yellow = '#FCD68C'
local green = '#A9DD97'
local blue = '#3E8FB0'
local light_blue = '#9CCFD8' 
local purple = '#C4A7E7'
local pink = '#ED8B9D'
local light_pink = '#FCB9D5'

-- -@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn    { bg = bg_dark }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = bg_light }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    SignColumn     { fg = fg, bg = bg }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr         { fg = ghost_dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = fg_darkest }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg = fg, bg = bg }, -- Normal text
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = ghost, gui = "italic" }, -- Any comment

    Constant       { fg = green}, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg = light_blue }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement      { fg = purple }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = blue }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = fg_dark }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg = red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { sp = red, gui = "underline" } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109
    --
    -- To find all options, go to https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

    -- Identifiers
    -- sym"@variable"                   { }, -- various variable names
    -- sym"@variable.builtin"           { }, -- built-in variable names (e.g. `this`)
    -- sym"@variable.parameter"         { }, -- parameters of a function
    -- sym"@variable.parameter.builtin" { }, -- special parameters (e.g. `_`, `it`)
    -- sym"@variable.member"            { }, -- object and struct fields

    -- sym"@constant"         { }, -- constant identifiers
    -- sym"@constant.builtin" { }, -- built-in constant values
    -- sym"@constant.macro"   { }, -- constants defined by the preprocessor

    -- sym"@module"           { }, -- modules or namespaces
    -- sym"@module.builtin"   { }, -- built-in modules or namespaces
    -- sym"@label"            { }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Literals
    -- sym"@string"                { }, -- string literals
    -- sym"@string.documentation"  { }, -- string documenting code (e.g. Python docstrings)
    -- sym"@string.regexp"         { }, -- regular expressions
    -- sym"@string.escape"         { }, -- escape sequences
    -- sym"@string.special"        { }, -- other special strings (e.g. dates)
    -- sym"@string.special.symbol" { }, -- symbols or atoms
    -- sym"@string.special.url"    { }, -- URIs (e.g. hyperlinks)
    -- sym"@string.special.path"   { }, -- filenames

    -- sym"@character"             { }, -- character literals
    -- sym"@character.special"     { }, -- special characters (e.g. wildcards)

    -- sym"@boolean"               { }, -- boolean literals
    -- sym"@number"                { }, -- numeric literals
    -- sym"@number.float"          { }, -- floating-point number literals
    
    -- Types
    -- sym"@type"            { }, -- type or class definitions and annotations
    -- sym"@type.builtin"    { }, -- built-in types
    -- sym"@type.definition" { }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    -- sym"@attribute"         { }, -- attribute annotations (e.g. Python decorators, Rust lifetimes)
    -- sym"@attribute.builtin" { }, -- builtin annotations (e.g. `@property` in Python)
    -- sym"@property"          { }, -- the key in key/value pairs

    -- Functions
    -- sym"@function"            { }, -- function definitions
    -- sym"@function.builtin"    { }, -- built-in functions
    -- sym"@function.call"       { }, -- function calls
    -- sym"@function.macro"      { }, -- preprocessor macros

    -- sym"@function.method"     { }, -- method definitions
    -- sym"@function.method.call"{ }, -- method calls

    -- sym"@constructor"         { }, -- constructor calls and definitions
    -- sym"@operator"            { }, -- symbolic operators (e.g. `+` / `*`)

    -- Keywords
    -- sym"@keyword"                  { }, -- keywords not fitting into specific categories
    -- sym"@keyword.coroutine"        { }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- sym"@keyword.function"         { }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    -- sym"@keyword.operator"         { }, -- operators that are English words (e.g. `and` / `or`)
    -- sym"@keyword.import"           { }, -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
    -- sym"@keyword.type"             { }, -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
    -- sym"@keyword.modifier"         { }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
    -- sym"@keyword.repeat"           { }, -- keywords related to loops (e.g. `for` / `while`)
    -- sym"@keyword.return"           { }, -- keywords like `return` and `yield`
    -- sym"@keyword.debug"            { }, -- keywords related to debugging
    -- sym"@keyword.exception"        { }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- sym"@keyword.conditional"        { }, -- keywords related to conditionals (e.g. `if` / `else`)
    -- sym"@keyword.conditional.ternary"{ }, -- ternary operator (e.g. `?` / `:`)

    -- sym"@keyword.directive"        { }, -- various preprocessor directives & shebangs
    -- sym"@keyword.directive.define" { }, -- preprocessor definition directives
    
    -- Punctuation
    -- sym"@punctuation.delimiter"{ }, -- delimiters (e.g. `;` / `.` / `,`)
    -- sym"@punctuation.bracket"  { }, -- brackets (e.g. `()` / `{}` / `[]`)
    -- sym"@punctuation.special"  { }, -- special symbols (e.g. `{}` in string interpolation)

    -- Comments
    -- sym"@comment"              { }, -- line and block comments
    -- sym"@comment.documentation"{ }, -- comments documenting code

    -- sym"@comment.error"        { }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
    -- sym"@comment.warning"      { }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
    -- sym"@comment.todo"         { }, -- todo-type comments (e.g. `TODO`, `WIP`)
    -- sym"@comment.note"         { }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    -- Markup
    -- sym"@markup.strong"        { }, -- bold text
    -- sym"@markup.italic"        { }, -- italic text
    -- sym"@markup.strikethrough" { }, -- struck-through text
    -- sym"@markup.underline"     { }, -- underlined text (only for literal underline markup!)

    -- sym"@markup.heading"       { }, -- headings, titles (including markers)
    -- sym"@markup.heading.1"     { }, -- top-level heading
    -- sym"@markup.heading.2"     { }, -- section heading
    -- sym"@markup.heading.3"     { }, -- subsection heading
    -- sym"@markup.heading.4"     { }, -- and so on
    -- sym"@markup.heading.5"     { }, -- and so forth
    -- sym"@markup.heading.6"     { }, -- six levels ought to be enough for anybody

    -- sym"@markup.quote"         { }, -- block quotes
    -- sym"@markup.math"          { }, -- math environments (e.g. `$ ... $` in LaTeX)

    -- sym"@markup.link"          { }, -- text references, footnotes, citations, etc.
    -- sym"@markup.link.label"    { }, -- link, reference descriptions
    -- sym"@markup.link.url"      { }, -- URL-style links

    -- sym"@markup.raw"           { }, -- literal or verbatim text (e.g. inline code)
    -- sym"@markup.raw.block"     { }, -- literal or verbatim text as a stand-alone block
                                       -- (use priority 90 for blocks with injections)

    -- sym"@markup.list"          { }, -- list markers
    -- sym"@markup.list.checked"  { }, -- checked todo-style list markers
    -- sym"@markup.list.unchecked"{ }, -- unchecked todo-style list markers


    -- sym"@diff.plus"      { }, -- added text (for diff files)
    -- sym"@diff.minus"     { }, -- deleted text (for diff files)
    -- sym"@diff.delta"     { }, -- changed text (for diff files)

    sym"@tag"          { fg = red }, -- XML-style tag names (and similar)
    -- sym"@tag.builtin"  { }, -- builtin tag names (e.g. HTML5 tags)
    sym"@tag.attribute"{ fg = fg}, -- XML-style tag attributes
    sym"@tag.delimiter"{ fg = fg_darkest}, -- XML-style tag delimiters


    -- Non-highlighting captures
    -- sym"@none"   { }, -- completely disable the highlight
    -- sym"@conceal"{ }, -- captures that are only meant to be concealed

    -- sym"@spell"  { }, -- for defining regions to be spellchecked
    -- sym"@nospell"{ }, -- for defining regions that should NOT be spellchecked

    -- Locals
    -- sym"@local.definition"           { }, -- various definitions
    -- sym"@local.definition.constant"  { }, -- constants
    -- sym"@local.definition.function"  { }, -- functions
    -- sym"@local.definition.method"    { }, -- methods
    -- sym"@local.definition.var"       { }, -- variables
    -- sym"@local.definition.parameter" { }, -- parameters
    -- sym"@local.definition.macro"     { }, -- preprocessor macros
    -- sym"@local.definition.type"      { }, -- types or classes
    -- sym"@local.definition.field"     { }, -- fields or properties
    -- sym"@local.definition.enum"      { }, -- enumerations
    -- sym"@local.definition.namespace" { }, -- modules or namespaces
    -- sym"@local.definition.import"    { }, -- imported names
    -- sym"@local.definition.associated"{ }, -- the associated type of a variable

    -- sym"@local.scope"                { }, -- scope block
    -- sym"@local.reference"            { }, -- identifier reference

    -- Folds
    -- sym"@fold"{ }, -- fold this node

    -- Injections
    -- sym"@injection.language"{ }, -- dynamic detection of the injection language (i.e. the text of the captured node describes the language)
    -- sym"@injection.content" { }, -- region for the dynamically detected language

    -- Indents
    -- sym"@indent.begin"      { }, -- indent children when matching this node
    -- sym"@indent.end"        { }, -- marks the end of indented block
    -- sym"@indent.align"      { }, -- behaves like python aligned/hanging indent
    -- sym"@indent.dedent"     { }, -- dedent children when matching this node
    -- sym"@indent.branch"     { }, -- dedent itself when matching this node
    -- sym"@indent.ignore"     { }, -- do not indent in this node
    -- sym"@indent.auto"       { }, -- behaves like 'autoindent' buffer option
    -- sym"@indent.zero"       { }, -- sets this node at position 0 (no indent)  
}
end)

return theme
