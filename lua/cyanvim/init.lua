require("cyanvim.plugins")
require("cyanvim.core")
require("configs.keymaps")

vim.cmd("colorscheme nightfox")

vim.filetype.add({
    extension = {
        gml = "gml",
    },
})
