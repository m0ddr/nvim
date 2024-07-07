-- none.ls is a community mantained alternative to the
-- now deprecated null.ls but it doesn't rewrite any of the variables...
-- you'll still be calling "null-ls" eventhough it's none-ls"
-- ref: https://github.com/nvimtools/none-ls.nvim
-- extend as needed with every Mason install
return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
          -- lua
					null_ls.builtins.formatting.stylua,
          -- python 
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
				},
			})
		end,
	},
}
