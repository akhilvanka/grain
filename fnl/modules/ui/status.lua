local modes = {
  ['n']   = '󰋜',
  ['no']  = '󰋜',
  ['nov'] = '󰋜',
  ['noV'] = '󰋜',
  ['niI'] = '󰋜',
  ['niR'] = '󰋜',
  ['niV'] = '󰋜',

  ['i']   = '',
  ['ic']  = '',
  ['ix']  = '',
  ['s']   = '',
  ['S']   = '',

  ['v']   = '󰈈',
  ['V']   = '󰉸',
  ['']    = '󰈈',
  ['r']   = '﯒',
  ['r?']  = '',
  ['c']   = '',
  ['t']   = '',
  ['!']   = '',
  ['R']   = '',
}

local icons = {
  ['typescript']      = ' ',
  ['python']          = ' ',
  ['java']            = ' ',
  ['html']            = ' ',
  ['css']             = ' ',
  ['scss']            = ' ',
  ['javascript']      = ' ',
  ['javascriptreact'] = ' ',
  ['markdown']        = ' ',
  ['sh']              = ' ',
  ['zsh']             = ' ',
  ['vim']             = ' ',
  ['rust']            = ' ',
  ['cpp']             = ' ',
  ['c']               = ' ',
  ['go']              = ' ',
  ['lua']             = ' ',
  ['conf']            = ' ',
  ['haskel']          = ' ',
  ['ruby']            = ' ',
  ['term']            = ' ',
  ['txt']             = ' '
}

local function branch()
  local cmd = io.popen('git branch --show-current 2>/dev/null')
  local branch = cmd:read("*l") or cmd:read("*a")
  cmd:close()
  if branch ~= "" then
    return string.format("   " .. branch)
  else
    return ""
  end
end

-- StatusLine Modes
Status = function()
  return table.concat { 
    string.format("  %s  ", modes[vim.api.nvim_get_mode().mode]):upper(),
    branch(),
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
