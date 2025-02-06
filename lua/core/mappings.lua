local utils = require("core.utils")
local map_key = utils.map_key

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

map_key("n", "<leader>ww", "update", "Update")
map_key("n", "<leader>f", "q!", "Close buffer w/o save")
map_key("n", "<leader>qt", "tabclose!", "Close tab w/o save")
map_key("n", "<leader>qq", "qall!", "Close editor w/o save")
