;; disable default plugins and providers
(local default-plugins [:2html_plugin
                        :getscript
                        :getscriptPlugin
                        :gzip
                        :logipat
                        :netrw
                        :netrwPlugin
                        :netrwSettings
                        :netrwFileHandlers
                        :matchit
                        :tar
                        :tarPlugin
                        :rrhelper
                        :spellfile_plugin
                        :vimball
                        :vimballPlugin
                        :zip
                        :zipPlugin
                        :tutor
                        :rplugin
                        :syntax
                        :synmenu
                        :optwin
                        :compiler
                        :bugreport
                        :ftplugin])

(local default-providers [:node :perl :ruby])

(each [_ plugin (pairs default-plugins)] (tset vim.g (.. :loaded_ plugin) 1))
(each [_ provider (ipairs default-providers)]
  (tset vim.g (.. :loaded_ provider :_provider) 0))

(let [lazy-path (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim)]
  (when (not ((. (or vim.uv vim.loop) :fs_stat) lazy-path))
    (vim.fn.system [:git
                    :clone
                    "--filter=blob:none"
                    "https://github.com/folke/lazy.nvim.git"
                    :--branch=stable
                    lazy-path]))
  (vim.opt.runtimepath:prepend lazy-path))

;; load grain
(require :core)
