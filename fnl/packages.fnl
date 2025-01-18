; import recursively if module has no - in the front of it

; establish global tables for package management 
(tset _G :store {:lazyadd []
                 :plugins []})

(fn kvize [xs t]
  "Convert sequence [:a :b] to table {:a :b}"
  (match xs
    [k v] (kvize
            (doto xs (table.remove 1) (table.remove 1))
            (match k
              :mod (doto t (tset :config #((. (require (.. :mod. v)) :setup))))
              _ (doto t (tset k v))))
    _ t))

(fn lazy-parser []
  "Feed a plugin to the plugin manager"
  (let [{: run} (require :core.lib.helper)]
    (run
      (fn [[plug & args]]
        (match #args
          0 (table.insert _G.store.plugins plug)
          _ (table.insert _G.store.plugins (kvize args {1 plug}))))
      _G.store.lazyadd)))
    
(let [lazy (require :lazy)
    opts {:checker {:enabled false}
               :defaults {:lazy true}
               :install {:colorscheme [:oxocarbon]}
               :performance {:rtp {:reset true :paths ["~/.config/nvim/rtp/treesitter"]} :reset_packpath true}}]
  
(require :modules)
(lazy-parser)
(lazy.setup _G.store.plugins opts))

