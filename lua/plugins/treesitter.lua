return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_installed = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		require("nvim-ts-autotag").setup({
      enable = true,
      filetypes = { "html", "xml", "vue" },
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true
    })
	end,
}
