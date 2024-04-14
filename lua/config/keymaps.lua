local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- window management
keymap.set("n", "<leader>SV", ":vsplit<CR>", opts)          -- split vertically
keymap.set("n", "<leader>S|", ":vsplit<CR>", opts)          -- split vertically
keymap.set("n", "<leader>S-", ":hsplit<CR>", opts)          -- split horizontally
keymap.set("n", "<leader>SH", ":split<CR>", opts)           -- split horizontally
keymap.set("n", "<leader>SX", ":close<CR>", opts)           -- close current split window
keymap.set("n", "<leader>SM", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- pane and window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)                 -- Navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts)                 -- Navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts)                 -- Navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts)                 -- Navigate right
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)    -- navigate left
keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)    -- navigate left
keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)    -- navigate left
keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)    -- navigate left
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)  -- Navigate left
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)  -- Navigate down
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)    -- Navigate up
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", opts) -- Navidate right

-- center buffer while navgitating
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "#", "#zz")
keymap.set("n", "*", "*zz")

-- buffers
keymap.set("n", "<PageUp>", ":bprev<CR>", opts)
keymap.set("n", "<PageDown>", ":bnext<CR>", opts)
keymap.set("n", "<C-x>", ":bd<CR>", opts)

-- move selected lines down/up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without losing contents of the register
vim.keymap.set("x", "<leader>p", '"_dP')

-- directory navigation
--keymap.set("n", "<C-m>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", { desc = "neotree" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false }) -- Ctrl + / for commenting
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false }) -- Ctrl + / for commenting

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)
keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [List [D]iagnostics" })
keymap.set("n", "<leader>cn", ":cnext<cr>zz")
keymap.set("n", "<leader>cp", ":cprevious<cr>zz")
keymap.set("n", "<leader>co", ":copen<cr>zz")
keymap.set("n", "<leader>cc", ":cclose<cr>zz")
