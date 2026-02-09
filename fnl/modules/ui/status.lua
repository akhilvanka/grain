local modes = {
  ['n']   = '󰋜',
  ['no']  = '󰋜',
  ['nov'] = '󰋜',
  ['noV'] = '󰋜',
  ['niI'] = '󰋜',
  ['niR'] = '󰋜',
  ['niV'] = '󰋜',

  ['i']   = '',
  ['ic']  = '',
  ['ix']  = '',
  ['s']   = '',
  ['S']   = '',

  ['v']   = '󰈈',
  ['V']   = '󰉸',
  ['']    = '󰈈',
  ['r']   = '﯒',
  ['r?']  = '',
  ['c']   = '',
  ['t']   = '',
  ['!']   = '',
  ['R']   = '',
}

local icons = {
  ['typescript']      = ' ',
  ['python']          = ' ',
  ['java']            = ' ',
  ['html']            = ' ',
  ['css']             = ' ',
  ['scss']            = ' ',
  ['javascript']      = ' ',
  ['javascriptreact'] = ' ',
  ['markdown']        = ' ',
  ['sh']              = ' ',
  ['zsh']             = ' ',
  ['vim']             = ' ',
  ['rust']            = ' ',
  ['cpp']             = ' ',
  ['c']               = ' ',
  ['go']              = ' ',
  ['lua']             = ' ',
  ['conf']            = ' ',
  ['haskel']          = ' ',
  ['ruby']            = ' ',
  ['term']            = ' ',
  ['txt']             = ' '
}

-- Cache git branch to avoid expensive subprocess calls on every statusline render
-- This is the main cause of slow startup on macOS (process spawning is slower than Linux)
local cached_branch = nil
local cached_cwd = nil

local function get_branch()
  local cwd = vim.fn.getcwd()

  -- Return cached value if cwd hasn't changed
  if cached_cwd == cwd and cached_branch ~= nil then
    return cached_branch
  end

  cached_cwd = cwd

  -- Use vim.fn.system which integrates better with nvim's event loop
  local branch = vim.fn.system('git branch --show-current 2>/dev/null'):gsub('\n', '')
  if branch ~= "" and vim.v.shell_error == 0 then
    cached_branch = string.format("   " .. branch)
  else
    cached_branch = ""
  end

  return cached_branch
end

-- Invalidate cache on directory change
vim.api.nvim_create_autocmd({ "DirChanged" }, {
  pattern = "*",
  callback = function()
    cached_branch = nil
    cached_cwd = nil
  end,
})

-- StatusLine Modes
Status = function()
  return table.concat {
    string.format("  %s  ", modes[vim.api.nvim_get_mode().mode]):upper(),
    get_branch(),
    "%=",
    string.format("%s", (icons[vim.bo.filetype] or "")),
    " %f ",
    " %l:%c  ",
  }
end

-- Execute statusline
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  pattern = "*",
  command = "setlocal statusline=%!v:lua.Status()",
})
