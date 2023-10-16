local opt = vim.opt
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
-- opt.colorcolumn = "119"
-- opt.cursorcolumn = true
opt.relativenumber = true
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("base46").toggle_transparency()
  end,
})


