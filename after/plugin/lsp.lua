local lsp_installed, lsp = pcall(require, "lsp-zero")
if not lsp_installed then
	return
end

lsp.preset("recommended")

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

lsp.ensure_installed(servers)

-- Fix Undefined global "vim"
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

local cmp_installed, cmp = pcall(require, "cmp")
if not cmp_installed then
	return
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "", -- \uF686
		warn = "",  -- \uF685
    hint = "",  -- \uF64E
    info = ""   -- \uF67D
  }
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
    vim.cmd.LspStop("eslint")
    return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

