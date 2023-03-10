local M = {}

M.icons = {
	separators = {
		hard = { left = " ", right = " " },
		sort = { left = "", right = "" },
	},
	diagnostics = {
		error = "",
		warn = "",
		info = "",
		hint = "",
	},
	git = {
		added = "",
		modified = "",
		removed = "",
		branch = "",
	},
	kinds = {
		Array = "",
		Boolean = "",
		Class = "",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Key = "",
		Keyword = "",
		Method = "m",
		Module = "",
		Namespace = "",
		Null = "ﳠ",
		Number = "",
		Object = "",
		Operator = "",
		Package = "",
		Property = "",
		Reference = "",
		Snippet = "",
		String = "",
		Struct = "",
		Text = "",
		TypeParameter = "",
		Unit = "",
		Value = "",
		Variable = "",
	},
}

return M
