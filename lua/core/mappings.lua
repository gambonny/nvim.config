local utils = require("core.utils")
local map_key = utils.map_key

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

map_key("n", "<leader>ww", "update", "Update")
map_key("n", "<leader>qt", "tabclose!", "Close tab w/o save")
map_key("n", "<leader>qw", "bwipeout!", "Wipeout split")
map_key("n", "<leader>qq", "qall!", "Close editor w/o save")
map_key("n", "<leader>_", "b#", "Go to last visited buffer")
map_key("n", "<C-d>", "<C-d>zz")
map_key("n", "<C-u>", "<C-u>zz")
