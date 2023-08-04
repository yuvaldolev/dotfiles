-- Tabs, or should I say spaces?!?!
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.textwidth = 80

vim.api.nvim_create_autocmd("Filetype", {
  pattern = {"c", "cpp", "lua"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Set how many lines of histroy VIM has to remember.
vim.opt.history = 500

-- Set to auto read when a file is changed from the outside.
vim.opt.autoread = true
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  pattern = "*",
  command = "checktime",
})

-- Search-replace preview.
vim.opt.inccommand = "nosplit"

-- Python3.
vim.g.python3_host_prog = "/usr/bin/python3"

-- Turn on the Wild menu.
vim.opt.wildmenu = true

-- Ignore compiled files.
vim.opt.wildignore = "*.o,*~,*.pyc,*/.git,*/.hg,*/.svn,*/.DS_Store"

-- Always show current position.
vim.opt.ruler = true

-- Height of the command bar.
vim.opt.cmdheight = 1

-- A buffer becomes hidden when it is abandoned.
vim.opt.hid = true

-- Configure backspace so it acts as it should act.
vim.opt.backspace = "eol,start,indent"
vim.opt.whichwrap:append("<,>,h,l")

--- Ignore case when searching.
vim.opt.ignorecase = true

-- When searching try to be smart about cases.
vim.opt.smartcase = true

-- Don't highlight search results.
vim.opt.hlsearch = false

-- Makes search act like search in modern browsers.
vim.opt.incsearch = true

-- Don't redraw while executing macros (good performance configuration).
vim.opt.lazyredraw = true

-- For regular expressions turn magic on.
vim.opt.magic = true

-- No annoying sounds on errors.
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.tm = 500

-- Show the tab line only if there's more t han 1 open tab.
vim.opt.showtabline = 1

-- Remove divider between split windows.
vim.opt.fillchars = "vert: "

-- Natural split direction.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set UTF-8 as standard encoding.
vim.opt.encoding = "utf8"

-- Set Unix as the standard file type.
vim.opt.ffs = "unix,dos,mac"

-- Turn backup off, since most stuff is in Git anyway...
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

-- Auto indent.
vim.opt.ai = true

-- Smart indent.
vim.opt.si = true

-- Wrap lines.
vim.opt.wrap = true

-- Specify the behavior when switching between buffers.
vim.opt.stal = 1

-- Return to the last edit position when optining files (YOU WANT THIS!).
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "*",
  command = "if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g'\\\"\" | endif",
})

-- Always show the status line.
vim.opt.laststatus = 2

-- Enable spell checking.
vim.opt.spell = true
vim.opt.spelllang = "en_us"
