local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
    ["<leader>h"] = { name = "+Harpoon" },
    ["<leader>ha"] = { mark.add_file, "Add File"},
    ["<leader>he"] = { ui.toggle_quick_menu, "Toggle UI Menu"},
    ["<m-h>"] = { function() ui.nav_file(1) end, "Move to first file"},
    ["<m-t>"] = { function() ui.nav_file(2) end, "Move to second file"},
    ["<m-n>"] = { function() ui.nav_file(3) end, "Move to third file"},
    ["<m-s>"] = { function() ui.nav_file(4) end, "Move to fourth file"},
})
