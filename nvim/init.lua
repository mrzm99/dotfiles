vim.hl = vim.highlight
vim.opt.updatetime = 250
require("nvim_config.core")
require("nvim_config.lazy")

-- C言語ファイルを開いたときに自動コメント挿入を無効にする
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("C_Cpp_Settings", { clear = true }),
    pattern = { "c", "cpp", "cs" },
    callback = function()
    vim.opt_local.formatoptions:remove({'r', 'o'})
  end,
})
