(local map (fn [mode keys command]
  (vim.api.nvim_set_keymap mode keys command {:noremap true :silent true})))

;; Normal Map
(map "n" "<TAB>" ":bnext<CR>")
(map "n" "<S-TAB>" ":bprev<CR>")
(map "n" "hs" ":split<CR>")
(map "n" "vs" ":vs<CR>")

;; Terminal
(map "n" "<leader>v" ":vs +terminal | startinsert<CR>")
(map "n" "<leader>h" ":split +terminal | startinsert<CR>")

;; Save
(map "i" "<C-S>" "<ESC>:w<CR><Insert>")
(map "n" "<C-S>" ":w<CR>")

;; Buffer
(map "n" "<leader>x" ":bd<CR>")
(map "n" "<leader>s" ":w<CR>")
(map "n" "<leader>t" ":enew<CR>")
(map "n" "<ESC>" ":nohlsearch<CR>")

;; Minimal toggle
(map "n" "<leader>m" ":lua Minimal()<CR>")
(map "n" "<leader>n" ":set relativenumber!<CR>")

;; Telescope
(map "n" "<leader><space>" ":Telescope<CR>")
(map "n" "ff" ":Telescope find_files<CR>")

;; NvimTree
(map "n" "<C-N>" ":NvimTreeToggle<CR>")
(map "n" "<C-B>" ":NvimTreeFocus<CR>")

;; Comment
(map "n" "<leader>/" "<Plug>(comment_toggle_linewise_current)")
(map "v" "<leader>/" "<Plug>(comment_toggle_linewise_visual)")

;; Insert Map
(map "i" "<C-E>" "<End>")
(map "i" "<C-A>" "<Home>")

;; Shift tab
(map "i" "<S-TAB>" "<ESC><<<Ins>")