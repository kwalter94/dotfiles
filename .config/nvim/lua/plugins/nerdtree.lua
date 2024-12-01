return {
    {
        "Xuyuanp/nerdtree-git-plugin",
    },
    {
        "preservim/nerdtree",
        init = function()
            vim.g.NERDTreeShowHidden = 1
        end,
        config = function()
            vim.cmd([[nnoremap <C-f> :NERDTreeFind<CR>]])
        end
    },
}
