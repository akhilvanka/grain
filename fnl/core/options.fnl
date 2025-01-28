(import-macros {: settings} :macros)

(settings

    ; basic
    scrolloff 3
    mouse a
    title on
    titlestring "%f"
    clipboard unnamedplus
    swapfile no
    undofile on
    termguicolors on
    showmode no
    cul on
    
    ; timeout
    updatetime 300
    timeout on
    timeoutlen 1000
    ttimeoutlen 10

    ; status, tab, number, sign line  
    ruler no
    laststatus 3
    showtabline 0
    number on
    numberwidth 1
    relativenumber no
    signcolumn "number"

    ; window, buffer, tabs    
    switchbuf "newtab"
    splitbelow on
    splitright on
    hidden on
    fillchars {:eob " " :diff " " :msgsep " "}  

    ; text formatting
    expandtab on
    shiftwidth 2
    tabstop 2
    smartindent on
    showmatch on
    smartcase on
    +whichwrap "<>[]hl"

    ; colorscheme
    background "dark"

    ; completeopt
    completeopt "menuone,noselect"

    ; remove intro
    +shortmess "sI")

(set vim.g.mapleader " ")