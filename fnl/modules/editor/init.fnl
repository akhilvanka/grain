; import macros
(import-macros {: use} :macros)

; setup LSP 
(use nvim-treesitter/nvim-treesitter :event :VeryLazy :build ":TSUpdate"
    :config (require :modules.editor.treesitter)
)

(use hrsh7th/nvim-cmp :event :VeryLazy 
    :dependencies [:hrsh7th/cmp-buffer :hrsh7th/cmp-path :hrsh7th/cmp-buffer]
    :config (fn [] (require :modules.editor.cmp))
)

(use williamboman/mason.nvim :event :VeryLazy
    :dependencies [:hrsh7th/cmp-nvim-lsp :neovim/nvim-lspconfig :williamboman/mason-lspconfig.nvim]
    :config (fn [] (require :modules.editor.mason))
)

; setup latex 
(use lervag/vimtex :lazy false 
    :init (require :modules.editor.latex)
)

; (use )

