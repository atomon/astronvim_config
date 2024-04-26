local opt_config = function()
  local opt = {}

  -- set to true or false etc.
  opt["relativenumber"] = false -- sets vim.opt.relativenumber
  opt["number"] = true -- sets vim.opt.number
  opt["spell"] = false -- sets vim.opt.spell
  opt["signcolumn"] = "auto" -- sets vim.opt.signcolumn to auto
  opt["wrap"] = false -- sets vim.opt.wrap
  opt["mousescroll"] = {"ver:9", "hor:6"}
  opt["tabstop"] = 4
  opt["shiftwidth"] = 4

  if vim.fn.executable "pwsh" then
    -- sets Nvim terminal for pwsh (https://www.siddharta.me/configuring-neovim-as-a-python-ide-2023.html)
    opt["shell"] = vim.fn.executable "pwsh" and "pwsh" or "/bin/bash"
    opt["shellcmdflag"] = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    opt["shellredir"] = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    opt["shellpipe"] = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    opt["shellquote"] = ""
    opt["shellxquote"] = ""
  end

  return opt
end

-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = opt_config(),
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
