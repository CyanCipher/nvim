require("cyanvim.plugins")
require("cyanvim.core")
require("configs.keymaps")

vim.cmd("colorscheme carbonfox")
vim.api.nvim_set_hl(0, "Visual", { bg = "#8a8c8c", fg = "#232627" })

vim.filetype.add({
    extension = {
        gml = "gml",
    },
})
