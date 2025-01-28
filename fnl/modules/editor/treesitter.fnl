(fn [] 
        ((. (require :nvim-treesitter.configs) :setup) 
        {
            :ensure_installed [ :c :java :latex ]
            :parser_install_dir "~/.config/nvim/rtp/treesitter"
            :highlight {:enable true}
            :indent {:enable true}
            :matchup {:enable true}
            :incremental_selection {:enable true
                                    :keymaps {:init_selection :<CR>
                                            :node_incremental :<CR>
                                            :node_decremental :<C-CR>}}
        }))