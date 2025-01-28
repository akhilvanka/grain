(local kind-icons {:Class "󰠱"
                   :Color ""
                   :Constant ""
                   :Constructor ""
                   :Enum ""
                   :EnumMember ""
                   :Event ""
                   :Field "󰇽"
                   :File ""
                   :Folder ""
                   :Function "󰊕"
                   :Interface ""
                   :Keyword ""
                   :Method ""
                   :Module ""
                   :Operator "󰆕"
                   :Property ""
                   :Reference ""
                   :Snippet ""
                   :Struct ""
                   :Text ""
                   :TypeParameter "󰅲"
                   :Unit ""
                   :Value ""
                   :Variable "󰂡"})

(local cmp (require :cmp))

(cmp.setup
  {:window {:completion {:border :solid}
            :documentation {:border :solid}}   
   :formatting {:fields [:abbr :menu :kind]
                :format (fn [entry vim-item]
                          (set vim-item.kind
                               (. kind-icons vim-item.kind))
                          (set vim-item.menu
                               (. {:buffer "[Buf]"
                                   :cmdline "[Cmd]"
                                   :luasnip "[Snip]"
                                   :nvim_lsp "[Lsp]"
                                   :nvim_lua "[Lua]"
                                   :path "[Path]"}
                                  entry.source.name))
                          vim-item)}
   :sources ((. cmp.config :sources)
             [{:name :path}
              {:name :buffer}
              {:name :nvim_lsp}])
   :mapping ((. cmp.mapping.preset :insert)
             {:<C-Space> (cmp.mapping.complete)
              :<CR> (cmp.mapping.confirm {:select true})
              :<Esc> (cmp.mapping.abort)
              :<S-Tab> (cmp.mapping (fn [fallback]
                                      (if (cmp.visible)
                                          (cmp.select_prev_item)
                                          (fallback)))
                                    [:i :s])
              :<Tab> (cmp.mapping (fn [fallback]
                                    (if (cmp.visible)
                                        (cmp.select_next_item)
                                        (fallback)))
                                  [:i :s])})})

(cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :buffer}]})
(cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources (cmp.config.sources [{:name :path}]
                                                 [{:name :cmdline}])})	


