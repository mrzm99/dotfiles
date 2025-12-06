vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap   -- for conciseness

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk", noremap = true })

keymap.set("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear search highlights", noremap = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number", noremap = true })    -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", noremap = true })    -- decrement

-- windos management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", noremap = true })  -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", noremap = true }) -- split window horizintal
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size", noremap = true })    -- make split windows equally
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split", noremap = true })  -- close current split windows

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab", noremap = true })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab", noremap = true })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc  ="Go to next tab", noremap = true })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab", noremap = true })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in tab", noremap = true })

keymap.set("n", "<leader>vh", "<C-w>h", { desc = "move to left window", noremap = true })
keymap.set("n", "<leader>vl", "<C-w>l", { desc = "move to right window", noremap = true })
keymap.set("n", "<leader>vj", "<C-w>j", { desc = "move to down window",  noremap = true })
keymap.set("n", "<leader>vk", "<C-w>k", { desc = "move to up window", noremap = true })

-- registers
keymap.set("n", "<leader>rg", "<cmd>registers<CR>", { desc = "show registers", noremap = true })

--quickfix list 
keymap.set("n", "<leader>co", "<cmd>copen<CR>", { desc = "open quickfix list", noremap = true })
keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "close quickfix list", noremap = true })

-- wrap toggle
keymap.set("n", "<leader>lb", "<cmd>set wrap!<CR>", { desc = "toggle wrap", noremap = true })

-- buffer setting
keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = " ", noremap = true })
keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = " ", noremap = true })

-- marks
keymap.set("n", "<leader>dm", "<cmd>delmarks a-zA-Z<CR>", { desc = "", noremap = true })
