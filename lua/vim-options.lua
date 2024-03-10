vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set nosmarttab")
vim.cmd("set smartcase")
vim.g.mapleader = " "

---@diagnostic disable-next-line: lowercase-global
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'kj', '<ESC>', {})
map('n', '<leader>ff', ':Telescope find_files<CR>', {})
map('i', '"' , '""<left>', {})
map('i', "'" , "''<left>", {})
map('i', '(', '()<left>', {})
map('i', '()', '()<left>', {})
map('i', '[', '[]<left>', {})
map('i', '{', '{}<left>', {})
map('i', '{<CR>', '{<CR>}<ESC>O', {})
map('i', '{;<CR>', '{<CR>};<ESC>O', {})


-- vim.cmd("noremap ö l")
-- vim.cmd("noremap l k")
-- vim.cmd("noremap k j")
-- vim.cmd("noremap j h")
-- vim.cmd("inoremap jh <ESC>")
