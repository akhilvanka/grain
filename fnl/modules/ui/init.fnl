; all ui related modules
(import-macros {: use} :macros)

; (use folke/snacks.nvim :event :VimEnter :modules :ui.dashboard)
(use folke/snacks.nvim :lazy false :priority 1000 
    :opts (require :modules.ui.snacks) 
)

(use mvllow/modes.nvim :event :VeryLazy :tag "v0.2.1"
    :opts (require :modules.ui.modes)
)

(use stevearc/oil.nvim :event :VeryLazy 
    :opts (require :modules.ui.oil)
    :dependencies [:echasnovski/mini.icons]
)

(use folke/noice.nvim :enabled false :event :VeryLazy
    :opts (require :modules.ui.noice)
    :dependencies [:MunifTanjim/nui.nvim]
)

(use echasnovski/mini.icons :event :VeryLazy :opts {})

; custom statusline in lua
(require :modules.ui.status)
