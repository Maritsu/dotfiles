"================================================================================"
"General settings and commands
"================================================================================"

set clipboard=unnamedplus
set mouse=

set noshowmode termguicolors cursorline
set number
set shiftwidth=0
set tabstop=4

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

"Color highlighter
Plug 'ap/vim-css-color'

"LSP, linter
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Lightline
Plug 'itchyny/lightline.vim'
Plug 'spywhere/lightline-lsp'

"Icons and navigation
Plug 'kyazdani42/nvim-web-devicons'
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

"File-specific extensions
Plug 'windwp/nvim-ts-autotag'	" HTML/XML
Plug 'lervag/vimtex'			" LaTeX

"Misc
Plug 'tpope/vim-fugitive'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'andweeb/presence.nvim'
call plug#end()

"================================================================================"
"Lightline
"================================================================================"

set completeopt=menu,menuone,noselect
let g:lightline = {
	\ 'colorscheme': 'catppuccin',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\			  [ 'readonly', 'filename', 'modified' ],
	\			  [ 'linter_warnings', 'linter_errors' ] ],
	\ 	'right':[ [ 'percent', 'lineinfo' ],
	\			  [ 'filetype' ] ]
	\ },
\ }

let g:lightline.component_expand = {
	\  'linter_hints': 'lightline#lsp#hints',
	\  'linter_infos': 'lightline#lsp#infos',
	\  'linter_warnings': 'lightline#lsp#warnings',
	\  'linter_errors': 'lightline#lsp#errors',
	\  'linter_ok': 'lightline#lsp#ok',
\ }
let g:lightline.component_type = {
      \     'linter_hints': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

"================================================================================"
"VimTeX
"================================================================================"

filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'
let maplocalleader = " "

"================================================================================"
"Syntax highlighting fixes
"================================================================================"

hi! def LineNr guifg=deusGreen
hi! def LineNrAbove guifg=#7b7c7e
hi! def link LineNrBelow LineNrAbove
hi! EndOfBuffer guifg=bg

" hi Normal guibg=none ctermbg=none
" hi LineNr guibg=none ctermbg=none
" hi Folded guibg=none ctermbg=none
" hi NonText guibg=none ctermbg=none
" hi SpecialKey guibg=none ctermbg=none
" hi VertSplit guibg=none ctermbg=none
" hi SignColumn guibg=none ctermbg=none
" hi EndOfBuffer guibg=none ctermbg=none

"================================================================================"
"Extra files
"================================================================================"

luafile $HOME/.config/nvim/nvim.lua
