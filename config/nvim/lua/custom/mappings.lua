local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        require("copilot.suggestion").accept_line()
      end,
      "Copilot Accept"
    }
  }
}

-- telescope function
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

M.telescope = {
  v = {
    ["<leader>fw"] = { function ()
      local text = vim.getVisualSelection()
      require("telescope.builtin").live_grep({
        default_text = text
      })
    end, "Live grep" },
    ["<leader>fz"] = { function ()
      local text = vim.getVisualSelection()
      require("telescope.builtin").current_buffer_fuzzy_find({
        default_text = text
      })
    end, "Find in current buffer" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>de"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
  }
}

M.general = {
  n = {
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>sa"] = { "<cmd> wa <CR>", "Save all file" },
    ["<leader>q"] = { "<cmd> q <CR>", "Quit windows" },
    ["<leader>qa"] = { "<cmd> conf qa <CR>", "Quit all windows" },
    ["<leader>tr"] = {
      function ()
        require("base46").toggle_transparency()
      end, "Toggle transparency"
    },
  }
}

return M
