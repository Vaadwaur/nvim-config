local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- window management
keymap.set("n", "<leader>SV", ":vsplit<CR>", opts) -- split vertically
keymap.set("n", "<leader>SH", ":split<CR>", opts) -- split horizontally
keymap.set("n", "<leader>SX", ":close<CR>", opts) -- close current split window
keymap.set("n", "<leader>SM", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- pane and window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate right
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- navigate left
keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- navigate left
keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- navigate left
keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- navigate left
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts) -- Navigate left
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", opts) -- Navigate down
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts) -- Navigate up
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", opts) -- Navidate right

-- buffers
keymap.set("n", "<PageUp>", ":bprev<CR>", opts)
keymap.set("n", "<PageDown>", ":bnext<CR>", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
