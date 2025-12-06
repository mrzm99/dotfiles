return {
    "ntpeters/vim-better-whitespace",
    Priority = 5,
    config = function()
        vim.cmd("highlight ExtraWhitespace ctermbg= darkgreen guibg=#A30042")
    end
}
