local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.add({
    { "<leader>h", group = "Harpoon", icon = ""},
    { "<leader>ha", mark.add_file, desc = "Add File"},
    { "<leader>he", ui.toggle_quick_menu, desc = "Toggle UI Menu"},
    { "<m-h>", function() ui.nav_file(1) end, desc = "Move to first file"},
    { "<m-t>", function() ui.nav_file(2) end, desc = "Move to second file"},
    { "<m-n>", function() ui.nav_file(3) end, desc = "Move to third file"},
    { "<m-s>", function() ui.nav_file(4) end, desc = "Move to fourth file"},
})
