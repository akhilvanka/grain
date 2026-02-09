(local mason (require :mason))
(var capabilities (vim.lsp.protocol.make_client_capabilities))

(set capabilities
     ((. (require :cmp_nvim_lsp) :default_capabilities) capabilities))

(mason.setup {:ui {:icons {:server_installed "✓"
                           :server_pending "➜"
                           :server_uninstalled "✗"}}})

(local servers [:jdtls])

((. (require :mason-lspconfig) :setup)
 {:automatic_installation true
  :ensure_installed servers})

;; Use vim.lsp.config (Neovim 0.11+) instead of deprecated lspconfig
(each [_ server (ipairs servers)]
  (vim.lsp.config server {:capabilities capabilities})
  (vim.lsp.enable server))
