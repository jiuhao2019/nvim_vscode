-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()

			require("which-key").add({
				{ "<leader>h", "<cmd>HopChar1MW<cr>", desc = "Easymotion" },

				{ "<leader>k", "<cmd>Interestingwords --toggle<cr>", desc = "Highlight" },
				{ "<leader>K", "<cmd>Interestingwords --remove_all<cr>", desc = "Unhighlignt" },
				{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
