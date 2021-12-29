require('plugins')
require('ui')
require('options')
require('mappings')


vim.g.material_style = "darker"
vim.cmd[[colorscheme material]]

local autosave = require("autosave")

autosave.setup({
        enabled = true,
        execution_message = "",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

local lspconfig = require "lspconfig"
lspconfig.sumneko_lua.setup {
  cmd = {
      "/home/fon/lsps/bin/lua-language-server",
      "-E",
      "/home/fon/lsps/main.lua"
  };
  settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

local nvim_lsp = require "lspconfig"
nvim_lsp.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsFromCheck = true },
      procMacro = { enable = true },
    },
  },
}
