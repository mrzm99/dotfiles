return {
    "haya14busa/vim-asterisk",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "*", "<Plug>(asterisk-z*)", { noremap = true })     -- search forward for the word under the cursor
        vim.keymap.set("n", "#", "<Plug>(asterisk-z#)", { noremap = true })     -- search backword for the word under the cursor
        vim.keymap.set("n", "g*", "<Plug>(asterisk-gz*)", { noremap = true })   -- search forward with partial match for the word under the cursor
        vim.keymap.set("n", "g#", "<Plug>(astersik-gz#)", { noremap = true })   -- search backword with partal match for the word under the cursor
    end
}
