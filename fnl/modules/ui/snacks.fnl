{
    :dashboard {
    :enabled true
    :sections [
        {:section :header}
                  {:gap 1 :padding 1 :section :keys}
                  {:icon " "
                   :indent 2
                   :padding 1
                   :pane 2
                   :section :recent_files
                   :title "Recent Files"}
                  {:icon " "
                   :indent 2
                   :padding 1
                   :pane 2
                   :section :projects
                   :title :Projects}
                  {:cmd "git status --short --branch --renames"
                   :enabled (fn [] (not= (. (require :snacks) :git :git_root) nil))
                   :height 5
                   :icon " "
                   :indent 3
                   :padding 1
                   :pane 2
                   :section :terminal
                   :title "Git Status"
                   :ttl (* 5 60)}
                  {:section :startup}
    ]}
    :bigfile {
        :enabled true
    }
    :indent {
        :enabled true
    }
    :quickfile {
        :enabled true
    }
}