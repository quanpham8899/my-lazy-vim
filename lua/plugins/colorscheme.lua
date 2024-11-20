-- return {
--     { "navarasu/onedark.nvim" },
--     {
--         "LazyVim/LazyVim",
--         opts = {
--             colorscheme = "onedark",
--         },
--     },
-- }
--     "ellisonleao/gruvbox.nvim",

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}
-- return {
--     { "rebelot/kanagawa.nvim" },
--     {
--         "LazyVim/LazyVim",
--         opts = ...,
--     },
-- }

-- return {
--     {
--         "neanias/everforest-nvim",
--         lazy = false,
--         priority = 1000, -- make sure to load this before all the other start plugins
--     },
-- }
