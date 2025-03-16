local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")
opt.wildignore:append({ "*/node_modules/*" })
opt.formatoptions:append({ "r" })

opt.splitright = true
opt.splitbelow = true

opt.wrap = false
opt.title = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 0
opt.autoread = true
opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "split"
opt.backspace = "indent,eol,start"
opt.mouse = ""

vim.o.updatetime = 150
vim.o.timeoutlen = 200
