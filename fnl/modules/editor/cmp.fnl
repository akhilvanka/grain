(local cmp (require :cmp))
(local mini (require :mini.icons))

(cmp.setup
  {:window {:documentation {:border :solid}
                      :completion {:col_offset (- 3)
                                   :side_padding 0
                                   :winhighlight "Normal:NormalFloat,NormalFloat:Pmenu,Pmenu:NormalFloat"}}
             :view {:entries {:name :custom :selection_order :near_cursor}}
   :experimental {:ghost_text true}   
   :formatting {:fields {1 :kind 2 :abbr 3 :menu}
                          :format (fn [_ vim-item]
                                    (set vim-item.menu vim-item.kind)
                                    (var (icon hl is-default) ((. (require :mini.icons) :get) :lsp vim-item.kind))
                                    (set vim-item.kind icon)
                                    (set vim-item.kind_hl_group hl)	
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


