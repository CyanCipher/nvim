require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "gleam",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "javascript",
        "lua",
        "python",
        "query",
        "rust",
        "typescript",
        "vim",
        "yaml"
    },

    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}


-- C3 TreeSitter Support
vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
    },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
    install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
    },
}
