return{
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
        vim.lsp.config('lua_ls', {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
              then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                  'lua/?.lua',
                  'lua/?/init.lua',
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths
                  -- here.
                  -- '${3rd}/luv/library'
                  -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
              }
            })
          end,
          settings = {
            Lua = {}
          }
  })        vim.lsp.config('pyright', {
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
               handlers = { "_typescipt.rename" },
               init_options = { hostInfo= "neovim" }
        })
        --]]
        vim.lsp.config('vtsls', {
               capabilities = capabilities,
               cmd = { "vtsls", "--stdio" },
               filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
               init_options = { hostInfo= "neovim" }

        })

    end,
    vim.lsp.enable('lua_ls'),
    vim.lsp.enable('pyright'),
    vim.lsp.enable('vtsls'),
    vim.lsp.enable('vue_ls')

}
