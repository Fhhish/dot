return{
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
        vim.lsp.config('luals', {
               capabilities = capabilities,
               cmd = { 'lua-language-server' },
               filetypes = { 'lua' },
               root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
               settings = {
                 Lua = {
                   runtime = {
                     version = 'LuaJIT',
                   }
                 }
               }
         })
        vim.lsp.config('pyright', {
               capabilities = capabilities,
               cmd = {  "basedpyright" },
               filetypes = { 'python', '--stdio' },
               root_markers = { { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }},
               settings = {
                 basedpyright = {
                     analysis = {
                         autoSearchPaths = true,
                         diagnosticMode = "openFilesOnly",
                         useLibraryCodeForTypes = true
                     }
                 }
             }
       })
        vim.lsp.config('vue_ls', {
               capabilities = capabilities,
               cmd = { "vue-language-server" },
               filetypes = { 'vue' },
               root_markers = { "package.json" }       
        })
        --[[
        vim.lsp.config('ts_ls', {
               capabilities = capabilities,
               cmd = { "typescript-language-server", "--stdio" },
               filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },

               init_options = { hostInfo= "neovim" }
        })--]]
    end,
    vim.lsp.enable('luals'),
    vim.lsp.enable('pyright'),
    vim.lsp.enable('vue_ls')

}
