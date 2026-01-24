return {
    {
      "AlphaTechnolog/pywal.nvim",
      lazy = false,
	  config = function()
        require("pywal").setup()
	  end,
    },
}
