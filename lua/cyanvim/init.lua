require("cyanvim.mappings")
require("cyanvim.packer")
require("cyanvim.core")

vim.cmd("colorscheme carbonfox")
vim.g.indentLine_char = '|'
vim.g.indentLine_enabled = 0

if vim.g.loaded_dashboard == 0 then
    vim.cmd("IndenLinesEnable")
end

