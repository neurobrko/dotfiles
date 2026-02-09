return {
  {
    "NickvanDyke/opencode.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = {
          input = { enabled = true },
          picker = { enabled = true },
          terminal = { enabled = true },
        },
      },
    },
    config = function()
      local function detect_provider()
        if vim.env.TMUX and vim.env.TMUX ~= "" then
          return "tmux"
        end
        if vim.env.KITTY_LISTEN_ON or vim.env.KITTY_MULTIPLEXER then
          return "kitty"
        end
        return "snacks"
      end

      local function resolve_opencode_cmd()
        local path = vim.fn.exepath("opencode")
        if path ~= "" then
          return string.format("%s --port", path)
        end

        local fallback_candidates = {
          vim.fn.expand("~/.local/bin/opencode"),
          vim.fn.expand("~/bin/opencode"),
          "/usr/local/bin/opencode",
          "/opt/homebrew/bin/opencode",
        }

        for _, candidate in ipairs(fallback_candidates) do
          if candidate ~= nil and candidate ~= "" and vim.fn.executable(candidate) == 1 then
            return string.format("%s --port", candidate)
          end
        end

        return nil
      end

      local provider_name = detect_provider()
      local provider_opts = vim.tbl_deep_extend(
        "force",
        {},
        vim.g.opencode_opts and vim.g.opencode_opts.provider or {},
        {
          enabled = provider_name,
        }
      )

      if provider_name == "kitty" then
        provider_opts.kitty = vim.tbl_deep_extend("force", {
          location = "os-window",
        }, provider_opts.kitty or {})
      end

      provider_opts.cmd = provider_opts.cmd or resolve_opencode_cmd()
      if not provider_opts.cmd then
        vim.notify(
          "Could not locate the `opencode` executable; ensure it is installed or set `provider.cmd`.",
          vim.log.levels.ERROR,
          { title = "opencode.nvim" }
        )
      end

      vim.g.opencode_opts = vim.tbl_deep_extend("force", {
        provider = provider_opts,
        ask = {
          submit = true,
        },
      }, vim.g.opencode_opts or {})

      vim.o.autoread = true

      local ok, opencode = pcall(require, "opencode")
      if not ok then
        return
      end

      local function map(mode, lhs, rhs, desc, opts)
        local key_opts = { desc = desc }
        if opts then
          key_opts = vim.tbl_extend("force", key_opts, opts)
        end
        vim.keymap.set(mode, lhs, rhs, key_opts)
      end

      local wk_ok, which_key = pcall(require, "which-key")
      if wk_ok then
        if type(which_key.add) == "function" then
          which_key.add({ { "<leader>o", group = "OpenCode" } })
        elseif type(which_key.register) == "function" then
          which_key.register({
            ["<leader>o"] = { name = "+OpenCode" },
          })
        end
      end

      map({ "n", "x" }, "<leader>oa", function()
        opencode.ask("@this: ")
      end, "OpenCode ask")

      map({ "n", "x" }, "<leader>os", function()
        opencode.select()
      end, "OpenCode select")

      map({ "n", "t" }, "<leader>ot", function()
        opencode.toggle()
      end, "OpenCode toggle")

      map({ "n", "x" }, "<leader>oo", function()
        return opencode.operator("@this ")
      end, "OpenCode operator", { expr = true })

      map("n", "<leader>oO", function()
        return opencode.operator("@this ") .. "_"
      end, "OpenCode line operator", { expr = true })

      map("n", "<leader>op", function()
        opencode.command("session.half.page.up")
      end, "OpenCode scroll up")

      map("n", "<leader>on", function()
        opencode.command("session.half.page.down")
      end, "OpenCode scroll down")

      local statusline_ok, lualine = pcall(require, "lualine")
      if statusline_ok then
        local cfg = lualine.get_config()
        cfg.sections = cfg.sections or {}
        cfg.sections.lualine_z = cfg.sections.lualine_z or {}
        table.insert(cfg.sections.lualine_z, { opencode.statusline })
        lualine.setup(cfg)
      end
    end,
  },
}
