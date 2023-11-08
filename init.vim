if has ('nvim')
	set t_8f=[38;2;%lu;%lu;%lum]
	set t_8b=[48;2;%lu;%lu;%lum]
	set termguicolors
endif
colorscheme cwcolors
syntax enable


if $REPOBASE != ""
	set tags=$REPOBASE-objdir/tags
endif

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\	"> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
\"> lo" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"Makes tab autocomplete 
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col-1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()
nnoremap <C-s> :w<CR>
nnoremap f :RnvimrToggle<CR>


let c_space_errors = 1
set noincsearch
set number
set linebreak

call plug#begin()

Plug 'numirias/semshi', {'do' : ':UpdateRemotePlugins'}
Plug 'kelly-lin/ranger.nvim'
Plug 'kevinhwang91/rnvimr'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Autocomplete and other headaches
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()
