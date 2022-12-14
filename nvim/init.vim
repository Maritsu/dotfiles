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
nnoremap <Leader><Leader>e :e $MYVIMRC<CR>
nnoremap <Leader><Leader>l :e ~/.config/nvim/nvim.lua<CR>
nnoremap <Leader>ds :!rm -r ~/.local/share/nvim/swap &<CR><CR>

nnoremap tn :tabnew<CR>
nnoremap tv :vs<CR>
nnoremap th :split<CR>

"================================================================================"
"Plugins
"================================================================================"

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pU :PlugUpgrade<CR>

call plug#begin()
"Color scheme
" Plug 'ajmwagar/vim-deus', {'as': 'deus'}
Plug 'catppuccin/nvim', {'as': 'cap'}
Plug 'xiyaowong/nvim-transparent'

"Header
" Plug 'glepnir/dashboard-nvim'

" Multiplayer mode
Plug 'jbyuki/instant.nvim'

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

" Uncomment this block if you want transparency
" Also look at extra files (GWgf)
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.right = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.right = s:palette.normal.right
let s:palette.tabline.right = s:palette.normal.right

"================================================================================"
"VimTeX
"================================================================================"

filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'general'
let maplocalleader = " "
noremap sle <plug>(vimtex-env-surround-line)
noremap sve <plug>(vimtex-env-surround-visual)
noremap soe <plug>(vimtex-env-surround-operator)
noremap nc <plug>(vimtex-cmd-create)

"================================================================================"
"Extra files
"================================================================================"

luafile $HOME/.config/nvim/nvim.lua

"================================================================================"
"Syntax highlighting fixes
"================================================================================"

hi! def NvimTreeNormal guibg=none
hi! def Todo guifg=Yellow

" hi! def LineNr guifg=#b4befe
" hi def link LineNrBelow LineNrAbove
" hi EndOfBuffer guifg=bg
