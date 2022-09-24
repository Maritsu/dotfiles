"================================================================================"
"General settings and commands
"================================================================================"

set clipboard=unnamedplus

set noshowmode termguicolors cursorline
set number
set shiftwidth=0
set tabstop=4
set cursorline

command W w
command RVRC so $MYVIMRC

"================================================================================"
"Keymaps
"================================================================================"

"Remap <Leader> to <Space>
let mapleader = " "

noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <nop>
noremap <Right> <nop>

vnoremap <C-z> <nop>
onoremap <C-z> <nop>
cnoremap <C-z> <nop>
inoremap <C-z> <nop>
tnoremap <C-z> <nop>

vnoremap '' <Esc>
onoremap '' <Esc>
cnoremap '' <C-C><Esc>
inoremap '' <Esc>`^
tnoremap '' <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <Leader><Leader>c :RVRC<CR>

"================================================================================"
"Plugins
"================================================================================"

call plug#begin()
"Color scheme is kept locally in colors/ dir
" Plug 'ajmwagar/vim-deus', {'as': 'deus'}
Plug 'catppuccin/nvim', {'as': 'cap'}

"LSP, linter
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Icons and navigation
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-tree.lua'

"Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

"Misc
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'andweeb/presence.nvim'
call plug#end()

"================================================================================"
"Lightline, color scheme
"================================================================================"

colorscheme catppuccin

set completeopt=menu,menuone,noselect
let g:lightline = {
	\ 'colorscheme': 'catppuccin',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\			  [ 'readonly', 'filename', 'modified' ] ],
	\ 	'right':[ [ 'lineinfo' ],
	\			  [ 'percent' ],
	\			  [ 'filetype' ] ]
	\ },
\ }

"================================================================================"
"Syntax highlighting fixes
"================================================================================"

hi! def LineNr guifg=deusGreen
hi! def LineNrAbove guifg=#7b7c7e
hi! def link LineNrBelow LineNrAbove
hi! EndOfBuffer guifg=bg

"================================================================================"
"Extra files
"================================================================================"

luafile $HOME/.config/nvim/nvim.lua
