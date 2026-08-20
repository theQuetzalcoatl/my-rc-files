
vim.g.mapleader = " "

local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true, remap = false})
end

-- ----------------------------------------------------------------------
map("i", "hh", "<Esc>")
map("i", "HH", "<Esc>")
-- map("i", "<Esc>a", "<Esc><cmd>tabp<cr>i")
-- map("i", "<Esc>d", "<Esc><cmd>tabn<cr>i")
map("i", "/*", "/*  */<left><left><left>")
map("i", "#def", "#define ")
map("i", "#inC", "#include <.h><left><left><left>")
map("i", "#Inc", '#include ".h"<left><left><left>')

-- ----------------------------------------------------------------------
map("n", "<Esc>h", "<C-O>")
map("n", "<Esc>l", "<C-I>")
map("n", "yw", "yiw")
map("n", "cw", "ciw")
map("n", "vw", "viw")
map("n", "de", "d$")
map("n", "ce", "c$")
map("n", "S", ":%s///g<left><left><left>")
map("n", "<leader>n", "<cmd>nohlsearch<cr>")
map("n", "n", "nzz")
map("n", "N", "Nzz")
-- window resizing
map("n", "<leader>k", "<cmd>resize -4<cr>")
map("n", "<leader>j", "<cmd>resize +4<cr>")
map("n", "<leader>h", "<cmd>vertical resize -4<cr>")
map("n", "<leader>l", "<cmd>vertical resize +4<cr>")
map("n", "<leader>f", ":find ")
-- move line up/down
map("n", "<Esc>k", ":m .-2<cr>==")
map("n", "<Esc>j", ":m .+1<cr>==")
map("n", "<leader>r", "/* NOTE: refactor */<Esc>")
map("n", "<leader>e", "<cmd>Explore<cr>")
map("n", "<leader>v", "<cmd>Vexplore<cr>")
map("n", "<leader>t", "<cmd>Texplore<cr>")
map("n", "<A-Down>", "<cmd>cnext<cr>")
map("n", "<A-Up>", "<cmd>cprev<cr>")
map("n", "é", "$")
-- find corresponding header
map("n", "<leader>h", "<cmd>find %:t:r.h<cr>")
-- map("n", "<Esc>a", "<cmd>tabp<cr>", { silent = true })
-- map("n", "<Esc>d", "<cmd>tabn<cr>", { silent = true })
-- map("n", "<leader>L", "<cmd>Lexplore<cr><cmd>vertical resize 30<cr>")
-- map( "n", "<leader>c", ':s/^/\\/\\//<cr><cmd>nohlsearch<cr>')
-- map("n", "<leader>u", ':s/^\\/\\///<cr>')
-- map("n", "<Tab>", ">>")
-- map("n", "<S-Tab>", "<<")

-- ----------------------------------------------------------------------
map("v", "S", ":s///g<left><left><left>")
map("v", "é", "$")
-- map( "v", "<leader>c", ':s/^/\\/\\//<cr><cmd>nohlsearch<cr>')
-- move selected blocks
-- map("v", "<Esc>j", ":m '>+1<cr>gv=gv")
-- map("v", "<Esc>k", ":m '<-2<cr>gv=gv")
-- map( "v", "<leader>u", ':s/^\\/\\///<cr>')
-- map("v", "<Tab>", ">")
-- map("v", "<S-Tab>", "<")


-- map("i", "{<CR>", "{<CR><CR>}<Up>")
-- map("i", "{", "{}<Left>")
-- map("i", "(", "()<Left>")
-- map("i", "[", "[]<Left>")
-- map("i", '"', '""<Left>')


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 4
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wildmode = { "list", "full" }
-- vim.opt.showmatch = false
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "»·", trail = "·" }
-- hide tabs/spaces by default
-- vim.opt.list = false
-- vim.opt.grepprg = "git grep -n"
-- vim.opt.mouse = "a"
-- vim.opt.redrawtime = 10000

-- ======================================================================
-- STATUS LINE
-- ======================================================================

vim.opt.laststatus = 2
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "StatusLineModeNormal", { bg = "#ffa800", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeInsert", { bg = "#0760a9", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeReplace", { bg = "#dff708", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeVisual", { bg = "#2a7a53", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeCommand", { bg = "#6c01ff", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeTerminal", { bg = "#bb002d", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineModeUnknown", { bg = "#000000", fg = "#151B1E", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileNormal", { bg = "#000000", fg = "#ffa800", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileInsert", { bg = "#000000", fg = "#0760a9", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileReplace", { bg = "#000000", fg = "#dff708", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileVisual", { bg = "#000000", fg = "#2a7a53", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileCommand", { bg = "#000000", fg = "#6c01ff", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileTerminal", { bg = "#000000", fg = "#bb002d", bold = true, })
vim.api.nvim_set_hl(0, "StatusLineFileUnknown", { bg = "#000000", bold = true, })

function _G.Mode_File()
    local mode = vim.fn.mode()

    if mode == "n" then
        return "%#StatusLineModeNormal# NORMAL %#StatusLineFileNormal# %t"
    elseif mode == "i" then
        return "%#StatusLineModeInsert# INSERT %#StatusLineFileInsert# %t"
    elseif mode == "R" then
        return "%#StatusLineModeReplace# REPLACE %#StatusLineFileReplace# %t"
    elseif mode == "v" then
        return "%#StatusLineModeVisual# VISUAL %#StatusLineFileVisual# %t"
    elseif mode == "V" then
        return "%#StatusLineModeVisual# V-LINE %#StatusLineFileVisual# %t"
    elseif mode == "\022" then -- Ctrl-V
        return "%#StatusLineModeVisual# V-BLOCK %#StatusLineFileVisual# %t"
    elseif mode == "c" then
        return "%#StatusLineModeCommand# COMMAND %#StatusLineFileCommand# %t"
    elseif mode == "t" then
        return "%#StatusLineModeTerminal# TERMINAL %#StatusLineFileTerminal# %t"
    else
        return "%#StatusLineModeUnknown# UNKNOWN %#StatusLine#"
    end
end

vim.opt.statusline = "%{%v:lua.Mode_File()%} %m%r%=(%v,%l/%L)  %p%% "





