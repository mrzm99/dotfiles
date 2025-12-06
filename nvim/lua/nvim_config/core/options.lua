vim.cmd("let g:netrw_liststyle = 3")

vim.cmd("set t_Co=256")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4		-- 4 spaces for tabs
opt.shiftwidth = 4	-- 4 spaces for indent width
opt.expandtab = true	-- expand tab to spaces
opt.autoindent = true	-- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true   -- ignore case when searching
opt.smartcase = true    -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorsheme to work
opt.termguicolors = true
opt.background = "dark"  -- colorshcemes that can be light or dark will be made dark
opt.signcolumn = "yes"   -- show sign column so that text dones't shift

-- backspace
--opt.backspace = "indent,eol,start"   -- allow backspace on indent, end of line or insert start position

-- clipboard
--opt.clipboard:append("unnamedplus")     -- use system clipboard as default register

-- split windows
opt.splitright = true   -- split vertical window to the right
opt.splitbelow = true   -- split horizontal window to the bottom

-- disable auto input comment
opt.formatoptions:remove('r')

-- character code
opt.encoding = 'utf-8'

--file encoding
opt.fileencodings = { "utf-8", "iso-2022-jp", "euc-jp", "cp932", "latin1" }



