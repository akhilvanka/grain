; macros for settings and package loading

(fn digest-macro-args [list]
  (fn every-two [t]
    (fn iter [t i]
      (local i (+ i 2))
      (local (va vb) (values (. t (- i 1)) (. t i)))
      (if (and va vb)
        (values i [va vb])))
    (values iter t 0))

  (fn decode-sat [sat]
    (local sat (tostring sat))
    (local (key-trans action) (match (string.sub sat 1 1)
                                :- (values (string.sub sat 2) :remove)
                                :+ (values (string.sub sat 2) :append)
                                _ (values sat :set)))

    (local (key transform) (match (string.match key-trans "/raw$")
                             matches (values (string.sub key-trans 1 -5) :raw)
                             nil (values key-trans :tostring)))

    {:name key :action action :transform transform})

  (fn transform-value [sat-table value]
    (fn true-val [any]
      (if (sym? any)
        (tostring any)
        any))

    (local tval (match sat-table.action
                  ;; set on|no -> booleans
                  :set (match (true-val value)
                         :on true
                         :no false
                         tval tval)
                  _ (true-val value)))

    (tset sat-table :value tval)
    sat-table)

  (icollect [_ [sat val] (every-two list)]
            (-> sat
                (decode-sat)
                (transform-value val))))

(fn settings [...]
  (local settings (digest-macro-args (list ...)))
  `(do
     (local settings# ,settings)
     (each [i# setting# (ipairs settings#)]
       (var target# (. vim :opt setting#.name))
       (match setting#.action
         :set (tset vim.opt setting#.name setting#.value)
         :append (target#:append setting#.value)
         :remove (target#:remove setting#.value)))))


; package management
(fn use [plug ...]
  "Add plugin to lazy"
  `(table.insert _G.store.lazyadd [,(tostring plug) ,...]))


(fn colorscheme [name]
  "Sets a vim colorscheme."
  `(vim.cmd.colorscheme ,(tostring name)))

{
  : settings
  : use
  : colorscheme
}
