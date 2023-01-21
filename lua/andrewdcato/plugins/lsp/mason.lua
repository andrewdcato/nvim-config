local mason_installed, mason = pcall(require, "mason")
if not mason_installed then
  return
end

local mason_lspconfig_installed, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_installed then
  return
end

local servers = {
	"ansiblels",
	"cssls",
	"cssmodules_ls",
	"dockerls",
	"eslint",
	"html",
	"jsonls",
  "sumneko_lua",
	"tailwindcss",
	"terraformls",
	"tsserver",
	"yamlls"
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_installed, lspconfig = pcall(require, "lspconfig")
if not lspconfig_installed then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("andrewdcato.plugins.lsp.handlers").on_attach,
		capabilities = require("andrewdcato.plugins.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "andrewdcato.plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end