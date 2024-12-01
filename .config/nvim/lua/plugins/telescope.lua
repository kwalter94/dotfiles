return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "0.1.x",
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffer" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help tags" })
        end
    }
}
