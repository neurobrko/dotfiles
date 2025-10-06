return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local opts =
        -- Toggle breakpoint
        vim.keymap.set("n", "<leader>db", function()
          dap.toggle_breakpoint()
        end, { noremap = true, silent = true, desc = "Toggle breakpoint" })

      -- Continue / Start
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, { noremap = true, silent = true, desc = "Start / Continue" })

      -- Step Over
      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, { noremap = true, silent = true, desc = "Step Over" })

      -- Step Into
      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, { noremap = true, silent = true, desc = "Step Into" })

      -- Step Out
      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, { noremap = true, silent = true, desc = "Step Out" })

      -- Keymap to terminate debugging
      vim.keymap.set("n", "<leader>dq", function()
        require("dap").terminate()
      end, { noremap = true, silent = true, desc = "Terminate debugging" })

      -- Toggle DAP UI
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, { noremap = true, silent = true, desc = "Toggle DAP UI" })

      -- Reset UI
      vim.keymap.set(
        "n",
        "<leader>dr",
        ":lua require('dapui').open({reset = true})<cr>",
        { noremap = true, silent = true, desc = "Reset DAP UI" }
      )

      -- Optional: Key mappings for common DAP actions
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end)
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end)
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end)
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end)
      vim.keymap.set("n", "<F9>", function()
        dap.toggle_breakpoint()
      end)
    end,
  },
}
