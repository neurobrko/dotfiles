-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- DAP and DAP-Python setup
local dap = require("dap")
local dap_python = require("dap-python")

-- Path to your Python interpreter with debugpy installed
dap_python.setup("/home/marpauli/.cache/pypoetry/virtualenvs/virl2-XVn_ZgrG-py3.12/bin/python")

-- Configure the Python DAP adapter for remote debugging
dap.adapters.python = {
  type = "server",
  host = "127.0.0.1", -- or the remote host IP if connecting over network
  port = 5678,
}

dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Remote Attach to CML",
    connect = {
      host = "127.0.0.1", -- or remote host IP
      port = 5678,
    },
    mode = "remote",
    pathMappings = {
      {
        localRoot = "/home/marpauli/code/cisco/_SIMPLE/webserver/simple_webserver",
        remoteRoot = "/var/local/virl2/.local/lib/python3.12/site-packages/simple_webserver",
      },
      {
        localRoot = "/home/marpauli/code/cisco/_SIMPLE/core/simple_core",
        remoteRoot = "/var/local/virl2/.local/lib/python3.12/site-packages/simple_core",
      },
      {
        localRoot = "/home/marpauli/code/cisco/_SIMPLE/drivers/simple_drivers",
        remoteRoot = "/var/local/virl2/.local/lib/python3.12/site-packages/simple_drivers",
      },
    },
    justMyCode = false,
  },
}

-- Optional: Key mappings for common DAP actions
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)

-- LuaSnip
vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])
-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/LuaSnip/" } })
