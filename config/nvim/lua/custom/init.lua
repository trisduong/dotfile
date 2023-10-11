local opt = vim.opt
opt.colorcolumn = "119"
vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_buf_get_option(bufnr, "modified")
    end, vim.t.bufs)
  end,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("base46").toggle_transparency()
  end,
})


