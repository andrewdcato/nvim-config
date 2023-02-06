-- Map leader to a space
vim.g.mapleader = " "

-- Maps defined w/WhichKey
local installed, wk = pcall(require, "which-key")
if not installed then
	return
end

-- **********************************************************
--  whick-key defaults all keyamps to the following:
--      silent = true
--      noremap = true
--      mode = "n"
--      buffer = nil
--
--  Unless otherwise specified, assume these defaults!
-- **********************************************************

-- General maps
wk.register({
	["<leader>+"] = { "<C-a>", "Increment Number Under Cursor" },
	["<leader>-"] = { "<C-x>", "Decrement Number Under Cursor" },
	["<leader>nh"] = { "<cmd>nohl<cr>", "Hide search highlights", noremap = false },
	["<leader>t"] = { "<cmd>NvimTreeToggle<cr>", "Open File Tree", noremap = false },
	["<leader>j"] = { "<cmd>NvimTreeFindFile<cr>", "Search File Tree", noremap = false },
})

-- Debugger keymaps
wk.register({
	["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", " Debugger: Continue " },
	["<F10>"] = { "<cmd>lua require('dap').step_over()<cr>", " Debugger: Step Over " },
	["<F11>"] = { "<cmd>lua require('dap').step_into()<cr>", " Debugger: Step Into " },
	["<F12>"] = { "<cmd>lua require('dap').step_out()<cr>", " Debugger: Step Out " },
	["b"] = { "<cmd>lua require('dap')toggle_breakpoint()<cr>", " Debugger: Toggle Breakpoint " },
	["<leader>dt"] = { "<cmd>lua require('dapui).toggle()<cr>", " Debugger: Toggle DapUI Window " },
})

-- Telescope keymaps
wk.register({
	["<leader>f"] = {
		name = "Telescope ",
		b = { "<cmd>Telescope buffers<cr>", "﬘ Search Open Buffers" },
		c = { "<cmd>Telescope grep_string<cr>", " Search Current Word" },
		f = { "<cmd>Telescope find_files<cr>", " Search Current Directory" },
		g = { "<cmd>Telescope git_files<cr>", " Search Git Files" },
		h = { "<cmd>Telescope help_tags<cr>", " Search 'Help' Tags" },
		n = { "<cmd>Telescope notify<cr>", " Search Notifications" },
		p = { "<cmd>Telescope packer<cr>", " Search Packer README Files" },
		r = { "<cmd>Telescope oldfiles<cr>", " Open Recent Files" },
		s = { "<cmd>Telescope live_grep<cr>", " Live Grep Search" },
	},
})

-- Git keymaps
wk.register({
	["<leader>g"] = {
		name = "Git Things ",
		g = { "<cmd>LazyGit<cr>", "Open Window" },
		c = { "<cmd>LazyGitConfig<cr>", "Edit Config" },
	},
})

-- Window / Split Management
wk.register({
	["<C-h>"] = { "<C-w>h", "Move to split to the left" },
	["<C-j>"] = { "<C-w>j", "Move to split below" },
	["<C-k>"] = { "<C-w>k", "Move to split above" },
	["<C-l>"] = { "<C-w>l", "Move to split o the right" },
	["<leader>s"] = {
		name = "Window Splits ",
		e = { "<C-w>=", "Make Splits Equal" },
		h = { "<C-w>s", "Split Window Horizontally" },
		v = { "<C-w>v", "Split Window Vertically" },
		x = { "<cmd>close<cr>", "Close Current Split" },
	},
	["<leader>t"] = {
		name = "Tab Management 裡",
		n = { "<cmd>tabn<cr>", "Move to Next Tab" },
		o = { "<cmd>tabnew<cr>", "Open New Tab" },
		p = { "<cmd>tabp<cr>", "Move to Previous Tab" },
		x = { "<cmd>tabclose<cr>", "Close Current Tab" },
	},
})

-- trouble.nvim
wk.register({
	["<leader>x"] = {
		name = "Trouble 飯",
		x = { "<cmd>TroubleToggle<cr>", "Trouble: Toggle Main Window" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble: Toggle Workspace Diagnostics" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble: Toggle Document Diagnostics" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble: Toggle Quickfix List" },
		l = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble: Toggle LSP References" },
		L = { "<cmd>TroubleToggle loclist<cr>", "Trouble: Toggle LocList" },
	},
})

wk.setup({
	window = {
		winblend = 10,
	},
	layout = {
		align = "center",
		spacing = 5,
	},
	disable = {
		filetypes = { "TelescopePrompt" },
	},
})
