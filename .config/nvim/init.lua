require("config.lazy")

vim.cmd([[source ~/.vimrc]])

vim.cmd([[set path+=**]])
vim.cmd([[set wildmenu]])
vim.cmd([[set hlsearch]])
vim.cmd([[command KeepCurrentBuffer :%bd|e#]])

vim.cmd([[set mouse=a]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[set fillchars+=vert:\|]])
vim.cmd([[hi vertsplit guifg=fg guibg=bg]])
vim.cmd([[set linespace=0]])
vim.cmd([[set nofoldenable]])

vim.cmd([[tnoremap <ESC> <C-\><C-n>]])
vim.cmd([[nnoremap <C-`> :split term://fish<CR><C-w>ri]])
vim.cmd([[nnoremap <C-h> :ALEHover<CR>]])
