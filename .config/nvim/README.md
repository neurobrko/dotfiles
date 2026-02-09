# 💤 LazyVim + OpenCode

This config extends the LazyVim starter to ship with the [OpenCode](https://github.com/sst/opencode) Neovim integration so you can chat with the agent directly from the editor.

## OpenCode in LazyVim

We add [`NickvanDyke/opencode.nvim`](https://github.com/NickvanDyke/opencode.nvim) via `lua/plugins/opencode.lua`. Keypieces:

- `folke/snacks.nvim` is pulled in so OpenCode can use its input/picker/terminal UIs.
- The provider auto-detects your environment (tmux ➝ tmux provider, Kitty ➝ kitty provider opening its own tab, otherwise snacks). If Kitty remote control isn’t active yet, we fall back to the snacks terminal provider automatically and warn you.
- Recommended keymaps are installed under `<leader>o` for asking questions, selecting actions, toggling visibility, and scrolling the session.
- `lualine` gains an OpenCode status component when available.

### Getting started

1. Ensure the `opencode` CLI is installed (the config tries `$PATH`, `~/.local/bin`, `~/bin`, `/usr/local/bin`, `/opt/homebrew/bin`, but errors if not found). Kitty users need `allow_remote_control yes` and `listen_on` configured (the provider launches OpenCode in a new Kitty tab and falls back to snacks if the socket isn’t available).
2. Launch Neovim; Lazy will sync the new plugin on first start.
3. Use `<leader>oa` inside any buffer to send the current selection (`@this` context) to OpenCode.
4. Hit `<leader>os` to browse prompts/commands, or `<leader>ot` to toggle the embedded TUI.
5. Use `<leader>op` / `<leader>on` to scroll the session and watch the statusline for activity.

Check `:checkhealth opencode` if the integration fails to detect a running agent.
