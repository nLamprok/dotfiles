" Author: Nasos Lamprokostopoulos
" Modified: 31/10/2021

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" ### GENERAL CONFIGURATION
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

syntax on
filetype plugin indent on

" Remap leader
let mapleader=','

" Default indentation
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent

" Special Filetypes
autocmd FileType make   setlocal ts=8 sw=8 noexpandtab  " Makefile

" Yaml
autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Encodings
setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf8

" General
set nomodeline
set autoread  " reread changed files automatically
set ffs=unix
set ttyfast
set laststatus=2  " always show statusline
set noshowcmd
set hidden " change buffers without writing
set number relativenumber " enable relative line numbers
set modifiable
set showmatch  " matching brackets
set mouse=a  " mouse support
set nostartofline
set incsearch  " search pattern
set hlsearch  " search highlighting
set clipboard=unnamedplus
set nowrap  " wrap lines
set lazyredraw  " no redraw
set ignorecase  " search ignore case
set scrolljump=8  " minimal nb of lines to scroll when cursor gets off the screen
set autochdir  " auto change working directory
set fillchars=vert:┃
set nocompatible " modern vim
set showmode  " show vim mode (insert, visual, replace)
set wildignorecase
set matchpairs+=<:>
set splitbelow  " for ex preview windows will appear at the bottom
set splitright
set noshowmode " don't show mode (aleady in statusline)
set updatetime=300 " faster completion
set completeopt=menu,menuone,noselect

" Silence msg completion menu
set shortmess+=c

" diff splits
set diffopt+=vertical

" Folding
set foldmethod=indent
set foldlevel=99

" Ignore files and folders
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.cache,*.dll,*.DS_Store,*.rdb,*.db,*.sqlite
set wildignore+=*/__pycache__/*,*/venv/*,*/node_modules/*,*/vendor/*

" Deactivate bells and alerts
set tm=500

" No swp files / backups etc
set noswapfile
set nobackup
set nowritebackup

" Backspace as it should work
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Keep visual selection when reindenting
xnoremap > >gv
xnoremap < <gv

" Save as root
command! WW :w !sudo tee % >/dev/null

" Disable automatic insertion of comment markers
set fo=cjql
autocmd FileType * setl fo-=o fo-=r

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" ### PLUGINS
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

call plug#begin()
	Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'windwp/nvim-autopairs'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'Shatur/neovim-ayu'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'windwp/nvim-autopairs'
  Plug 'tpope/vim-commentary'
call plug#end()

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" ### INCLUDES
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

" Source theme
runtime ./theme.vim

" Source keybindings
runtime ./keybindings.vim