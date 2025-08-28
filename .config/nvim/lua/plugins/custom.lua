return {
  vim.api.nvim_create_user_command("CurRelPath", function()
    local path = vim.fn.expand("%:p")
    local cur_wd = vim.fn.getcwd()
    local rel_path = string.gsub(path, cur_wd .. "/", "")
    vim.fn.setreg("+", rel_path)
    vim.notify('Copied "' .. rel_path .. '" to the clipboard!')
  end, {})
}
