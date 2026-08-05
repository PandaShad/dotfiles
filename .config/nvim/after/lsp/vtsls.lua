local inlay = {
	parameterNames = { enabled = "literals" },
	parameterTypes = { enabled = true },
	variableTypes = { enabled = false },
	propertyDeclarationTypes = { enabled = true },
	functionLikeReturnTypes = { enabled = true },
	enumMemberValues = { enabled = true },
}

return {
	settings = {
		typescript = { inlayHints = inlay, updateImportsOnFileMove = { enabled = "always" } },
		javascript = { inlayHints = inlay },
		vtsls = { experimental = { completion = { enableServerSideFuzzyMatch = true } } },
	},
}
