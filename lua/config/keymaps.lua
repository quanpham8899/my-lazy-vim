local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- PERSONAL KEY MAPPING

-- Insert mode: Ctrl+h to delete a word (Ctrl+w behavior)
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true })

-- Command-line mode: Ctrl+h to delete a word (Ctrl+w behavior)
vim.keymap.set("c", "<C-h>", "<C-w>", { noremap = true })

-- Toggle wrap and un-wrap
vim.api.nvim_set_keymap("n", "<A-S-z>", ":set wrap!<CR>", { noremap = true, silent = true })

-- Move line up
vim.api.nvim_set_keymap("n", "<M-Up>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move line down
vim.api.nvim_set_keymap("n", "<M-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Go to the last character in a line
keymap.set("n", "gl", "g_")

-- Go to the first characte in a line (non blank character)
keymap.set("n", "gh", "^")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Enter new line
keymap.set("n", "<CR>", "i<CR><Esc><C-s>")

-- Quick key map from Insert Mode to Normal Mode
vim.keymap.set("i", "<C-q>", "<Esc>", opts)

-- While in Visual mode i to remove the current context and enter Insert mode
vim.keymap.set("v", "i", "xi")

-- KEY MAP FOR PLUGINs

-- Open floating terminal (Powershell) at top right
vim.api.nvim_set_keymap(
    "n",
    "<F5>",
    ":FloatermNew --position=topRight --title=TheHandsomeDuke powershell<CR>",
    { noremap = true, silent = true }
)

-- Open FzflLua buffers list
vim.api.nvim_set_keymap("n", "<C-b>", ":FzfLua buffers<CR>", { noremap = true, silent = true })

-- Open Log Window
vim.api.nvim_create_user_command("Log", function()
    vim.cmd("lua vim.diagnostic.setloclist()")
end, {})

-- Open Neotree (filesystem) - :Filesystem
vim.api.nvim_create_user_command("Filesystem", function()
    vim.cmd("Neotree filesystem position=left")
end, {})

-- Open Neotree (gitstatus) - :Gitstatus
vim.api.nvim_create_user_command("Gitstatus", function()
    vim.cmd("Neotree git_status position=left")
end, {})

-- Open Neotree (filesystem) - :Filesystem
vim.api.nvim_create_user_command("FileFloat", function()
    vim.cmd("Neotree filesystem position=float")
end, {})

-- Open Neotree (gitstatus) - :Gitstatus
vim.api.nvim_create_user_command("GitFloat", function()
    vim.cmd("Neotree git_status position=float")
end, {})

-- Shift + F5 to the next terminal
vim.api.nvim_set_keymap("n", "<S-F5>", ":FloatermNext <CR>", { noremap = true, silent = true })

-- Key mapping for Ctrl + Shift + H to open :FzfLua files
vim.keymap.set("n", "<C-h>", ":FzfLua files<CR>", { noremap = true, silent = true })

-- Open powershell in new buffer
vim.api.nvim_create_user_command("Ps", function()
    vim.cmd("terminal powershell")
    vim.cmd("startinsert")
end, {})

-- Function to add semicolon at the end of the line in C# files
local function map_semicolon_in_csharp()
    if vim.bo.filetype == "cs" then
        vim.api.nvim_set_keymap(
            "i", -- insert mode
            ";", -- the key we want to remap
            [[<C-o>A;]], -- go to end of line and add `;`
            { noremap = true, silent = true }
        )
    end
end

-- Run the function each time a C# file is opened
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = map_semicolon_in_csharp,
})
