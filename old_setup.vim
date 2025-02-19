" Nvim plugins

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set guicursor=n-v-c-i:block
set clipboard=unnamedplus
let mapleader = " "

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
" Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter' " Tree sitter
Plug 'https://github.com/akinsho/bufferline.nvim' " Folders
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc.nvim para autocompletado
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' " recommended if need floating window support
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'mg979/vim-visual-multi'
Plug 'mfussenegger/nvim-jdtls'


call plug#end()

" nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-b> :NERDTreeToggle<CR>
" nnoremap <leader>rr :NERDTreeRefreshRoot<CR>
nnoremap <C-b> :Ex<CR>
nnoremap <C-ñ> :terminal<CR>

nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+1<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

lua require('go').setup()
nnoremap <leader>go :GoRun<CR>
nnoremap <leader>js :!node %<CR>
nnoremap <leader>py :!python %<CR>

" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"
" let NERDTreeShowHidden=1

nmap <C-p> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

colorscheme slate
highlight Normal guibg=#303030 guifg=#ffffff  " Main background
highlight NormalNC guibg=#252525 guifg=#bbbbbb  " Inactive windows
highlight CursorLine guibg=#3a3a3a  " Current line
highlight CursorColumn guibg=#3a3a3a  " Current column
highlight LineNr guifg=#5eacd3 guibg=#303030  " Line numbers
highlight CursorLineNr guifg=#b8bb26 gui=bold guibg=#303030  " Current line number (green)
highlight StatusLine guibg=#1f1f1f guifg=#ffffff  " Status bar (active)
highlight StatusLineNC guibg=#1f1f1f guifg=#666666  " Status bar (inactive)
highlight VertSplit guifg=#444444 guibg=#303030  " Vertical split lines
highlight Pmenu guibg=#222222 guifg=#ffffff  " Popup menu (autocompletion)
highlight PmenuSel guibg=#444444 guifg=#ffffff  " Selected item in popup menu
highlight Structure guifg=#ffcc00  " Change to your desired color


" Colors for telescope
lua << EOF
require('telescope').setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    winblend = 10,  -- Makes the background slightly transparent
    color_devicons = true,
  }
})

vim.cmd [[
  highlight TelescopeNormal guibg=#252525 guifg=#ffffff
  highlight TelescopeBorder guibg=#252525 guifg=#444444
  highlight TelescopePromptBorder guibg=#252525 guifg=#444444
  highlight TelescopeResultsBorder guibg=#252525 guifg=#444444
  highlight TelescopePreviewBorder guibg=#252525 guifg=#444444
  highlight TelescopeSelection guibg=#3a3a3a guifg=#ffffff
  highlight TelescopeMatching guifg=#ffcc00
  highlight TelescopePromptTitle guibg=#303030 guifg=#ffcc00
  highlight TelescopeResultsTitle guibg=#303030 guifg=#ffcc00
  highlight TelescopePreviewTitle guibg=#303030 guifg=#ffcc00
]]
EOF

" Configuración básica para coc.nvim
" Usa K para mostrar la documentación en la ventana de vista previa.
nmap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Mapear teclas para navegar por las sugerencias
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Usa enter para confirmar la selección de coc.nvim
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


let g:coc_global_extensions = ['coc-go', 'coc-python', 'coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-styled-components', 'coc-html', 'coc-tailwindcss']

inoremap <silent><expr> <C-Space> coc#refresh()

autocmd BufRead,BufNewFile *.astro set filetype=html

nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <C-S-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>j :Telescope lsp_definitions<CR>
nnoremap <leader>d :Telescope lsp_references<CR>
nnoremap <leader>i :Telescope lsp_implementations<CR>
nnoremap <leader>s :Telescope lsp_document_symbols<CR>

lua << EOF
require'lspconfig'.ts_ls.setup {
  settings = {
    documentFormatting = false,
    javascript = {
      format = {
        enable = false
      }
    },
    typescript = {
      format = {
        enable = false
      }
    }
  }
}
EOF

autocmd FileType typescript,typescriptreact,json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

lua << EOF
local config = {
  cmd = { 'jdtls' },
  root_dir = require('lspconfig').util.root_pattern('pom.xml', 'build.gradle', '.git'),
}

require('lspconfig').jdtls.setup(config)
require'lspconfig'.astro.setup{}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "astro" },
  highlight = {
    enable = true,
  },
}
EOF

