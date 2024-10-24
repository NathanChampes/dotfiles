return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

 __  __                  _                 
|  \/  | __ _ _ __   ___| |__   ___  _   _ 
| |\/| |/ _` | '_ \ / __| '_ \ / _ \| | | |
| |  | | (_| | | | | (__| | | | (_) | |_| |
|_|  |_|\__,_|_| |_|\___|_| |_|\___/ \__, |
                                     |___/ 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
