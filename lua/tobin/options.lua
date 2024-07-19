lvim.transparent_window = true
vim.opt.clipboard = "unnamedplus"

-- Enable hybrid line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Vimscript for coloring line numbers
vim.cmd [[
let &stc='%#NonText#%{&nu?v:lnum:""}' . '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' . '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
]]

vim.opt.foldmethod = "indent"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = require("modules.foldtext")
vim.opt.foldlevelstart = 99
-- require("notify").setup({
--   background_colour = "#000000",
-- })
