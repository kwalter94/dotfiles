set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

colorscheme industry

set path+=**
set wildmenu

call plug#begin(stdpath('data') . 'plugged')
    Plug 'preservim/nerdtree'
    Plug 'rust-lang/rust.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'elixir-editors/vim-elixir'
    Plug 'APZelos/blamer.nvim'
    Plug 'mhinz/vim-mix-format'
    Plug 'racer-rust/vim-racer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-crystal/vim-crystal'
    Plug 'RishabhRD/popfix'
    Plug 'mhinz/vim-startify'

    " Debugging
    Plug 'nvim-lua/plenary.nvim'
    Plug 'mfussenegger/nvim-dap'
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'zchee/deoplete-clang'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NerdTree
let g:NERDTreeShowHidden=1

" autocmd vimenter * NERDTree
set mouse=a
set number
set fillchars+=vert:\|
hi vertsplit guifg=fg guibg=bg
set linespace=0

" Remaps
tnoremap <ESC> <C-\><C-n>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-`> :split term://fish<CR><C-w>ri

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:deoplete#enable_at_startup = 1

" Blamer
let g:blamer_enabled = 1

lua << EOF
    require'lspconfig'.rust_analyzer.setup{}
EOF

" Neovide
let g:neovide_transparency=0.9
let g:neovide_fullscreen=v:true
set guifont=FiraCode:h8
