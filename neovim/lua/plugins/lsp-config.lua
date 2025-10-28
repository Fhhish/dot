return{

	{
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
	{
	    "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls"
                }
            })
        end
	},
	{
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config['luals'] = {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' }
            }
            vim.lsp.enable('luals')

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader> ca', vim.lsp.buf.code_action, {})
        end
	}
}
