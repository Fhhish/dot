return{

    "nvim-treesitter/nvim-treesitter",

    config = function()
        require("nvim-treesitter").setup{
            ensure_installed = {
                "javascript",
                "html",
                "css",
                "vue",
                "lua"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            fold = {
                enable = true,
            },
        }
        vim.o.foldmethod = 'expr'
        vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.o.foldlevel = 99 -- open all folds by default
    end

}
