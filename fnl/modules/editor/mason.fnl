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

(each [_ a (ipairs servers)]
  ((. (require :lspconfig) a :setup) {:capabilities capabilities}))
