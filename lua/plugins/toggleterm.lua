return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
  
      -- Configure toggleterm
      toggleterm.setup({
        shell = "pwsh", -- Use PowerShell Core as the default shell
        direction = "horizontal", -- Set the terminal to open horizontally
        size = 15, -- Height of the horizontal terminal (in lines)
        open_mapping = [[<c-\>]], -- Default keybinding to toggle the terminal
        shade_filetypes = {}, -- Disable shading for specific filetypes
        shade_terminals = true, -- Enable shading for terminals
        start_in_insert = true, -- Start the terminal in insert mode
        persist_size = true, -- Remember the terminal size
        close_on_exit = true, -- Close the terminal window when the shell exits
      })
  
      -- Custom keybindings for terminal operations
      local opts = { noremap = true, silent = true }
  
      -- Toggle the terminal
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", opts)
  
      -- Open a new terminal in the current directory
      vim.keymap.set("n", "<leader>tn", "<cmd>ToggleTerm direction=horizontal<cr>", opts)
  
      -- Send a command to the terminal (e.g., run a script)
      vim.keymap.set("n", "<leader>tr", function()
        local cmd = vim.fn.input("Enter command: ")
        if cmd ~= "" then
          vim.cmd("ToggleTermSend " .. cmd)
        end
      end, opts)
  
      -- Close the terminal
      vim.keymap.set("t", "<esc>", "<cmd>ToggleTerm<cr>", opts) -- Use Esc to close the terminal in terminal mode
    end,
  }
  