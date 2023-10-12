local plugins = {
  {
    {
      'akinsho/toggleterm.nvim',
      lazy = false,
      version = "*",
      config = true
    },
  },
  {
    "lewis6991/hover.nvim",
    lazy = false,
    config = function()
      require("hover").setup({
        init = function ()
          require("hover.providers.lsp")
        end,
        preview_opts = {
            border = nil
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true
      })
    end,
  },
  {
    "mhartington/formatter.nvim",
    lazy = false,
    config = function()
      require("formatter").setup({
        filetype = {
          python = {
            require("formatter.filetypes.python").black,
          },

          lua = {
            require("formatter.filetypes.lua").stylua,
          },

          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
  {
    "ur4ltz/surround.nvim",
    lazy = false,
    config = function()
      require("surround").setup({mappings_style = "surround"})
    end
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function ()
      require('notify').setup()
    end
  },
  {
    "smoka7/multicursors.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
        'smoka7/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {}
  },
  {
    "sakhnik/nvim-gdb",
    lazy = false,
  },
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "bronson/vim-visual-star-search",
    lazy = false,
  },
  { "lukas-reineke/virt-column.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("virt-column").setup()
    end
  },
  {
    'https://codeberg.org/esensar/nvim-dev-container',
    lazy = false,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('devcontainer').setup{}
    end
  },
  {
    "amitds1997/remote-nvim.nvim",
    lazy = false,
    version = "*", -- This keeps it pinned to semantic releases
    dependencies = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
         -- This would be an optional dependency eventually
         "nvim-telescope/telescope.nvim",
     },
    config = true,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      -- disable rtp plugin, as we only need its queries for mini.ai
      -- In case other textobject modules are enabled, we will load them
      -- once nvim-treesitter is loaded
      require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      load_textobjects = true
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- disable rtp plugin, as we only need its queries for mini.ai
          -- In case other textobject modules are enabled, we will load them
          -- once nvim-treesitter is loaded
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          load_textobjects = true
        end,
      },
    },
    opts = function ()
      return require "custom.configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function ()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    config = function()
      require("pretty-fold").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        -- "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- overrides plugins
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "custom.configs.overrides"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts.nvimtree)
    end,
  },
}
return plugins
