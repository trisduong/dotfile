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
        require("copilot.suggestion").accept()
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
    ["<leader>k"] = {
      function ()
        require("hover").hover()
      end, "Hover"
    },
    ["<leader>gk"] = {
      function ()
        require("hover").hover_select()
      end, "Hover select"
    }
  }
}

M.general = {
  n = {
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>sa"] = { "<cmd> wa <CR>", "Save all file" },
    ["<leader>q"] = { "<cmd> q <CR>", "Quit windows" },
    ["<leader>qa"] = { "<cmd> conf qa <CR>", "Quit all windows" },
    ["<leader>bg"] = {
      function ()
        require("base46").toggle_transparency()
      end, "Toggle transparency"
    },
    -- ["<leader>f"] = { "<cmd> silent Format <CR>", "Format file"},
    ["<leader>mc"] = { "<cmd> MCstart <CR>", "Multi cursor" },
    ["J"] = {"5j"},
    ["K"] = {"5k"},
    ["<leader>gg"] = {
      function()
        local term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(term.job_id, "lazygit\n")
      end,
      "open Lazygit",
    },
    ["<leader>gd"] = {
      function()
        local term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(term.job_id, "lazydocker\n")
      end,
      "open LazyDocker",
    },
    ["<leader>lrn"] = {
    function()
      return "<cmd> IncRename "
    end,
    "Incremental rename"
    },
  },
  v = {
    ["<leader>mc"] = { "<cmd> MCstart <CR>", "Multi cursor" },
    ["J"] = {"5j"},
    ["K"] = {"5k"},
  }
}

M.fold = {
  n = {
    ["zR"] = {
      function ()
        require('ufo').openAllFolds()
      end
    },
    ["zM"] = {
      function ()
        require('ufo').closeAllFolds()
      end
    },
    ["zr"] = {
      function ()
        require('ufo').openFoldsExceptKinds()
      end
    },
    ["zm"] = {
      function ()
        require('ufo').closeFoldsWith()
      end
    },
    ["zK"] = {
      function ()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
      end
    },
  }
}

M.http = {
  n = {
    ["<leader>hc"] = { "<Plug>RestNvim", "Rest Nvim" },
    ["<leader>hcp"] = { "<Plug>RestNvimPreview", "Rest Nvim Preview" },
    ["<leader>hcl"] = { "<Plug>RestNvimLast", "Rest Nvim Last" },
  }
}

return M
