; import macros
(import-macros {: use} :macros)

(use nvim-treesitter/nvim-treesitter :event :VeryLazy :build ":TSUpdate"
    :config (require :modules.editor.treesitter)
)