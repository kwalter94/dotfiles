return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme nightfox]])
            vim.cmd([[set bg=dark]])
            vim.cmd([[set guifont=Fira\ Code:h12]])

            vim.g.neovide_transparency = 0.95
            vim.g.neovide_fullscreen = false

            if vim.g.neovide then
                vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
                vim.keymap.set({ "n", "v" }, "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
                vim.keymap.set({ "n", "v" }, "<C-)>", ":lua vim.g.neovide_scale_factor = 1<CR>")
            end
        end
    }
}
