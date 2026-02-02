local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true,
	enable_check_bracket_line = false, -- Don't add pairs if closing bracket already exists on the line
})

local Rule = require("nvim-autopairs.rule")
npairs.add_rule(Rule("<", ">"))
npairs.add_rule(Rule("|", "|"))
npairs.add_rule(Rule("$", "$", "typst"))
