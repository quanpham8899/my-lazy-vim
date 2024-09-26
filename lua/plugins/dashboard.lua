return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "hyper",
            config = {
                header = {},
                week_header = {
                    enable = true,
                },
                package = {
                    enable = true,
                },
                project = {
                    enable = true,
                    limit = 2,
                },
                mru = {
                    limit = 3,
                },
                shortcut = {
                    { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "FzfLua files",
                        key = "f",
                    },
                    -- {
                    --     desc = " Apps",
                    --     group = "DiagnosticHint",
                    --     action = "Telescope app",
                    --     key = "a",
                    -- },
                    -- {
                    --     desc = " dotfiles",
                    --     group = "Number",
                    --     action = "Telescope dotfiles",
                    --     key = "d",
                    -- },
                },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
