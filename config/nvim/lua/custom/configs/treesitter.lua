local options = {
  ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        -- "vue", "svelte",

       -- low level
        "rust",
        "go",
        "python",

        -- others
        "jsonc",
      },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
