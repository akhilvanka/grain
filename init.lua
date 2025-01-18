local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    path = vim.fn.stdpath("data") .. "/lazy/" .. name
    vim.opt.rtp:prepend(path)

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

vim.loader.enable()

-- tangerine.nvim
bootstrap("https://github.com/udayvir-singh/tangerine.nvim")

require("tangerine").setup {
    target = vim.fn.stdpath("data") .. "/tangerine",
    compiler = {
        verbose = false,
        clean = true,
        hooks = {
            "onsave",
            "oninit"
        }
    },
}


