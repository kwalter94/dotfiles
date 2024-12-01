return {
    {
        "dense-analysis/ale",
        priority = 1000,
        lazy = false,
        init = function()
            vim.g.ale_fix_on_save = 1
            vim.g.ale_fixers = {
                elm = {'elm_ls'},
                go = {'gofmt'},
                python = {'black'},
                ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
            }
            vim.g.ale_floating_preview = 1
            vim.g.ale_hover_to_preview = 1
            vim.g.ale_hover_to_floating_preview = 1
            vim.g.ale_detail_to_floating_preview = 1
            vim.g.ale_close_preview_on_insert = 0
            vim.g.ale_cursor_detail = 0
            vim.g.ale_floating_cursor = 0
            vim.g.airline_extensions_ale_enabled = 0
        end,
        config = function()
            vim.cmd([[set omnifunc=ale#completion#omniFunc]])
        end
    }
}
