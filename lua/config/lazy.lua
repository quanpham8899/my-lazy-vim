local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
vim.opt.encoding = "utf-8"

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- require("onedark").setup({
--     colors = {
--         bright_orange = "#ff8800", -- define a new color
--         green = "#00ffaa", -- redefine an existing color
--     },
--     highlights = {
--         ["@keyword"] = { fg = "$green" },
--         ["@string"] = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
--         ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
--         ["@function.builtin"] = { fg = "#0059ff" },
--     },
-- })

-- require("dashboard").setup({
--
-- })

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
--
-- require("kanagawa").setup({
--     compile = false, -- enable compiling the colorscheme
--     undercurl = true, -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true },
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = false, -- do not set background color
--     dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true, -- define vim.g.terminal_color_{0,17}
--     colors = { -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave", -- Load "wave" theme when 'background' option is not set
--     background = { -- map the value of 'background' option to a theme
--         dark = "wave", -- try "dragon" !
--         light = "lotus",
--     },
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa-dragon")

-- local everforest = require("everforest")
-- everforest.setup({
--     background = "medium",
--     transparent_background_level = 0,
--     italics = true,
--     disable_italic_comments = false,
--     on_highlights = function(hl, _)
--         hl["@string.special.symbol.ruby"] = { link = "@field" }
--     end,
-- })
-- everforest.load()

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            -- visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
                ".git",
                ".DS_Store",
                "thumbs.db",
                "*.meta",
            },
            hide_by_pattern = {
                "*.meta",
                "*.asset",
                "*.fbx",
            },
            never_show = {},
        },
    },
})

require("lspconfig").gopls.setup({
    settings = {
        gopls = {
            completeUnimported = true,
        },
    },
})

require("swagger-preview").setup({
    port = 1234,
    host = "localhost",
})

-- require("gopls").setup({})
