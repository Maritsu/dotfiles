-- Helper function to retrieve selected file using Telescope
-- Courtesy of u/hphesto at https://www.reddit.com/r/neovim/comments/nwk7wi/comment/h1j4fum/?context=3
function get_snippet()
	local fileext = string.format(".%s", vim.fn.expand('%:e'))
	local opts = {
		prompt_title= "Paste snippet",
		shorten_path = false,
		cwd = "$XDG_CONFIG_HOME/nvim/snippets",
		vimgrep_arguments = {'rg', '--files', '--color', fileext},
		attach_mappings = function(_, map)
		map("i", "<CR>", function(prompt_bufnr)
			local entry = require("telescope.actions.state").get_selected_entry()
			require("telescope.actions").close(prompt_bufnr)
			-- Insert filename in current cursor position
			-- vim.cmd('normal i' .. filename)
			-- filename is available at entry[1]
			return entry[1]
			end
		)
		return true
		end,
	}
	require('telescope.builtin').find_files(opts)
end

function paste_snippet()
	-- local snippath = get_snippet()
	local snippath
	local fileext = string.format(".%s", vim.fn.expand('%:e'))
	local opts = {
		prompt_title= "Paste snippet",
		shorten_path = false,
		cwd = "$XDG_CONFIG_HOME/nvim/snippets",
		vimgrep_arguments = {'rg', '--files', '--color', fileext},
		attach_mappings = function(_, map)
		map("i", "<CR>", function(prompt_bufnr)
			local entry = require("telescope.actions.state").get_selected_entry()
			require("telescope.actions").close(prompt_bufnr)
			-- Insert filename in current cursor position
			-- vim.cmd('normal i' .. filename)
			-- filename is available at entry[1]
			snippath = entry[1]
			end
		)
		return true
		end,
	}
	require('telescope.builtin').find_files(opts)
	
	-- tail -n +2 snippath -> remove first line
	vim.cmd("r! tail -n +2 $XDG_CONFIG_HOME/nvim/snippets/" .. snippath)

	-- Execute macro at snippath line 1
end
