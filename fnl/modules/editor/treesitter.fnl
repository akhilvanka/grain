;; nvim-treesitter config using new API (nvim-treesitter v1.0+)
;; The old nvim-treesitter.configs module is deprecated
{
  :ensure_installed [:c :java :latex]
  :sync_install false
  :auto_install true
  :highlight {:enable true}
  :indent {:enable true}
  :incremental_selection {:enable true
                          :keymaps {:init_selection :<CR>
                                    :node_incremental :<CR>
                                    :node_decremental :<C-CR>}}
}
