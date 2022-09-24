-- Theming
vim.g.catppuccin_flavour = "mocha";
require('catppuccin').setup()
vim.cmd[[Catppuccin mocha]]

-- Treesitter
require'nvim-treesitter.configs'.setup{
	ensure_installed = {'bash', 'c', 'cpp', 'lua', 'vim', 'markdown', 'python'},
	auto_install = true,

	highlight = {
		enable = true,
	}
}

-- Telescope
require('telescope').setup{}
vim.keymap.set('n', "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set('n', "<leader>g", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set('n', "<leader>l", ":Telescope live_grep<CR>")

-- Toggle comments 
require('Comment').setup()

-- File browser
require('nvim-tree').setup({
	view = {
		width = 45
	}
})
vim.keymap.set('n', "tt", ":NvimTreeToggle<CR>")
vim.keymap.set('n', "tr", ":NvimTreeFocus<CR>")

-- Completion
local cmp = require('cmp')
cmp.setup({
	-- mapping = cmp.mapping.preset.insert({
	-- 	['<M-j>'] = cmp.mapping.scroll_docs(-4),
	-- 	['<M-k>'] = cmp.mapping.scroll_docs(4),
	-- 	['<M-Space>'] = cmp.mapping.complete(),
	-- 	['<Esc>'] = cmp.mapping.abort(),
	-- 	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	-- }),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
	}, {
		{name = 'buffer'},
	})
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Autopairs
require('nvim-autopairs').setup()
local cmp_ap = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_ap.on_confirm_done()
)

-- Debugging
vim.keymap.set('n', "<M-1>", ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', "<M-8>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', "<M-9>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', "<M-0>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', "<M-k>", ":lua require'dap'.terminate()<CR>")
vim.keymap.set('n', "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', "<leader>l", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log point message: '))<CR>")

vim.keymap.set('n', "<leader>do", ":lua require'dapui'.open()<CR>", {silent = true})
vim.keymap.set('n', "<leader>dc", ":lua require'dapui'.close()<CR>", {silent = true})

local dap, dapui = require('dap'), require('dapui')

require("nvim-dap-virtual-text").setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- C++ configuraion
dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/home/bit/.config/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
	{
		name = 'Launch file',
		type = 'cppdbg',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopAtEntry = true,
	}
}

-- Language Server Protocol
local bufopts = {noremap=true, silent=true, buffer=bufnr}
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<Leader>sr', ":LspRestart<CR>")
vim.keymap.set('n', '<Leader>si', ":LspInfo<CR>")
local servers = {'clangd'}
require'lspconfig'.clangd.setup{}

-- Linting
vim.keymap.set('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>')
require('lint').linters_by_ft = {
	cpp = {"cpplint"}
}
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- Markdown preview
-- use({
--     "iamcco/markdown-preview.nvim",
--     run = function() vim.fn["mkdp#util#install"]() end,
-- })
--
-- vim: ft=lua
