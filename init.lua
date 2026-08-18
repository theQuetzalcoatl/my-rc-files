-- TODO: what is silent here?

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(m, k , v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true} )
end

map("i", "hh", "<Esc>")
map("i", "HH", "<Esc>")
map("i", "#def", "#define<space>")
map("i", "#inC", "#include <.h><left><left><left>")
map("i", "#Inc", "#include \".h\"<left><left><left>")

-- -----------------------------------------------------------------

map("n", "<Esc>h", "<C-O>")
map("n", "<Esc>l", "<C-I>")
map("n", "cw", "ciw")
map("n", "vw", "viw")
map("n", "yw", "yiw")
map("n", "de", "d$")
map("n", "ce", "c$")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<leader>e", "<cmd>Explore<cr>")
map("n", "<leader>v", "<cmd>Vexplore<cr>")
map("n", "<leader>t", "<cmd>Texplore<cr>")
-- map("n",  "<silent> <leader>L", ":Explore<cr>")
map("n", "<A-Down>", "<cmd>cnext<cr>")
map("n", "<A-Up>", "<cmd>cprev<cr>")
map("n", "é", "$")
-- map("n", "/", "/\v") -- not working
map("n", "<leader>n", "<cmd>nohlsearch<cr>")
map("n", "de", "d$")
map("n", "ce", "c$")
-- if im in main.c it issues: :find main. --> so i can just type 'h' and go to the header 
map("n", "<leader>h", "<cmd>find %:t:r.h<cr>")
map("n", "<A-Down>", "<cmd>cnext<cr>")
map("n", "<A-Up>", "<cmd>cprev<cr>")
map("n", "<leader>f", "<cmd>find<space>")
map("n", "S", ":%s///g<left><left><left>")

-- -----------------------------------------------------------------

map("v", "é", "$")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 2 -- tabs in space
-- vim.opt.expandtabs = true -- tabs in space, NOT WORKING
-- vim.opt.incsearc = true -- jump to the current search when typing
vim.opt.scrolloff = 4
