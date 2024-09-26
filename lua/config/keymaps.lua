-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Insert mode: Ctrl+h to delete a word (Ctrl+w behavior)
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true })

-- Command-line mode: Ctrl+h to delete a word (Ctrl+w behavior)
vim.keymap.set("c", "<C-h>", "<C-w>", { noremap = true })

-- Normal mode: Shift+Tab to decrease indentation (<<)
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })

-- Visual mode: Shift+Tab to decrease indentation (<)
vim.keymap.set("v", "<S-Tab>", "<", { noremap = true })

-- Normal mode: Tab to increase indentation (>>)
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })

-- Visual mode: Tab to increase indentation (>)
vim.keymap.set("v", "<Tab>", ">", { noremap = true })

-- Move line up
vim.api.nvim_set_keymap("n", "<M-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move line down
vim.api.nvim_set_keymap("n", "<M-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Open floating terminal (Powershell) at top right
vim.api.nvim_set_keymap(
    "n",
    "<F5>",
    ":FloatermNew --position=topRight --title=TheHandsomeDuke powershell<CR>",
    { noremap = true, silent = true }
)

-- Open FzflLua buffers list
vim.api.nvim_set_keymap("n", "<C-b>", ":FzfLua buffers<CR>", { noremap = true, silent = true })

-- Open Neotree (filesystem) - :Filesystem
vim.api.nvim_create_user_command("Filesystem", function()
    vim.cmd("Neotree filesystem")
end, {})

-- Open Neotree (gitstatus) - :Gitstatus
vim.api.nvim_create_user_command("Gitstatus", function()
    vim.cmd("Neotree git_status")
end, {})

-- Shift + F5 to the next terminal
vim.api.nvim_set_keymap("n", "<S-F5>", ":FloatermNext <CR>", { noremap = true, silent = true })

-- Key mapping for Ctrl + Shift + H to open :FzfLua files
vim.keymap.set("n", "<C-h>", ":FzfLua files<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("Ps", function()
    vim.cmd("terminal powershell")
    vim.cmd("startinsert")
end, {})

-- vim.api.nvim_create_user_command("Fzl", function()
--     vim.cmd("FzfLua files")
-- end, {})
