" Remove search highlight
nmap <leader><space> :nohlsearch<cr>

" Navigate Splits easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Moving through buffers
" TAB in normal mode will move to text buffer
nnoremap <silent> <TAB> :BufferNext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :BufferPrevious<CR>

" Close Buffer
nmap <leader>d :BufferClose<cr>

" Show line diagnostics
nnoremap <silent>K :Lspsaga show_line_diagnostics<CR>

" Telescope stuff
nnoremap <leader>p <cmd>Telescope git_files<cr>
nnoremap <leader>F <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>r <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

