return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,
		message_template = " <summary> • <date> • <author>",
		date_format = "%d/%m/%Y %H:%M",
		virtual_text_column = 1,
	},
}
