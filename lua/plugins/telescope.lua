return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        -- Use `fd` as the find command with `--hidden` and `--follow`
        find_command = { "fd", "--type", "f", "--hidden", "--follow" },
        -- Alternatively, use `rg` (ripgrep) with the required arguments
        -- find_command = { "rg", "--files", "--hidden", "--follow" },
        file_ignore_patterns = { ".git/", "node_modules/" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--follow",
        },
      },
    })
  end,
}
