set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

let g:python3_host_prog=$HOME . "/.local/share/nvim/python3/bin/python"

set path+=**
set wildmenu

call plug#begin(stdpath('data') . 'plugged')
    Plug 'preservim/nerdtree'
    Plug 'rust-lang/rust.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'elixir-editors/vim-elixir'
    Plug 'APZelos/blamer.nvim'
    Plug 'mhinz/vim-mix-format'
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-crystal/vim-crystal'
    Plug 'RishabhRD/popfix'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Themes
    Plug 'EdenEast/nightfox.nvim'
    Plug 'seblj/nvim-tabline'
    Plug 'kyazdani42/nvim-web-devicons'

    " Debugging
    Plug 'nvim-lua/plenary.nvim'
    Plug 'mfussenegger/nvim-dap'
call plug#end()

" Theming
set bg=dark
colorscheme nightfox

lua <<EOF
require('tabline').setup{
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 3,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = false,       -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
}
EOF

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'mypy']

" NerdTree
let g:NERDTreeShowHidden=1

" autocmd vimenter * NERDTree
set mouse=a
set number
set fillchars+=vert:\|
hi vertsplit guifg=fg guibg=bg
set linespace=0
let g:rustfmt_autosave = 1

" Remaps
tnoremap <ESC> <C-\><C-n>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-`> :split term://fish<CR><C-w>ri

" Blamer
let g:blamer_enabled = 1

" LSP Configs
lua << EOF
    -- LSP Mappings copied verbatim from: https://github.com/neovim/nvim-lspconfig#suggested-configuration
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = { 'crystalline', 'gopls', 'pyright', 'rust_analyzer', 'tsserver' }
    for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    end
EOF

" Neovide
" let g:neovide_transparency=0.95
let g:neovide_fullscreen=v:true
set guifont=Fira\ Code:h12
