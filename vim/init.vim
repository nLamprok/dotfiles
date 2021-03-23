" File  : init.vim
" Author: Nasos Lamprokostopoulos <nlamprok@gmail.com>
"
" neovim config file

"
" PLUGIN MANAGER (vim-plug)
" --------------------------------------------------------------------
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'noahfrederick/vim-laravel'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

"
" PLUGINS CONFIG
" --------------------------------------------------------------------

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''
le

" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'

" Always show tabs

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

let g:python3_host_prog = '/Users/nlamprok/.pyenv/shims/python3'

"
" GENERAL CONFIG
" --------------------------------------------------------------------
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
set cursorline
set laststatus=2  " always show statusline
set noshowcmd
set ruler
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
set pumheight=10 " makes popup menu smaller

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
autocmd FileType *         setl fo-=o fo-=r

"
" THEME
" --------------------------------------------------------------------
set background=dark
set t_Co=256
colorscheme gruvbox

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Cursor mode
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Enable TRUE COLOR for nvim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show git info in statusline
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return "  \uE725 ".fugitive#head()
  else
    return ''
endfunction

set showtabline=2 " always show tabline

"
" KEYBINDINGS
" --------------------------------------------------------------------
" Navigate window panels
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Go start or end of line
nmap B ^
nmap E $

" Remove search highlight
nmap <leader><space> :nohlsearch<cr>

" Editing and reloading of config
map <leader>e :e! ~/dotfiles/vim/init.vim<cr>
autocmd! bufwritepost ~/dotfiles/vim/init.vim source ~/dotfiles/vim/init.vim

" Moving through buffers
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Navigate files, buffers etc. (fzf)
nmap <leader>b :Buffers<CR>
nmap <leader>p :Files<CR>
nmap <leader>l :BLines<CR>
nmap <leader>; :Rg<CR>

" Case insensitive replace word (aka multiple cursors)
nmap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nmap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" save current file
nmap <silent>;; :w<CR>

" delete current buffer, keep window layout
nmap <silent>;d :bp\|bd #<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" format the whole file
nmap <leader>F :CocCommand prettier.formatFile<CR>

" FUNCTIONS
" --------------------------------------------------------------------

" Remove trailing whitespaces
function! TrimTrailingWS ()
    if exists('b:noStripWhitespace')
        return
    endif
    if search('\s\+$', 'cnw')
        :%s/\s\+$//g
    endif
endfunction

autocmd BufWritePre * :call TrimTrailingWS()
autocmd FileType markdown let b:noStripWhitespace=1

