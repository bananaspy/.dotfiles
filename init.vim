" Install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()


if (has("termguicolors"))
 set termguicolors
endif

" Leader
let mapleader = ' '

" Theme
syntax enable
colorscheme OceanicNext

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Autocompletion
let g:deoplete#enable_at_startup = 1

" Lines
set number

:set relativenumber
:set rnu

function! ToggleRelativeNumber()
  if &relativenumber
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nmap <Leader>n :call ToggleRelativeNumber()<CR>

" Encoding
set encoding=utf-8

" Hotkeys
nnoremap <Leader>s :w<CR>

inoremap jh <Esc>
cnoremap jh <C-C>

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

map <Leader><Leader> <Plug>(easymotion-bd-w)

nnoremap <Leader>gob :GoBuild<CR>
nnoremap <Leader>gol :GoInstall<CR>
nnoremap <Leader>got :GoTest<CR>
nnoremap <Leader>gor :GoRun<CR>
nnoremap <Leader>goi :GoImport<space>
nnoremap <Leader>. :GoDef<CR>

nnoremap <Leader>H :vertical resize -10<CR>
nnoremap <Leader>J :resize +10<CR>
nnoremap <Leader>K :resize -10<CR>
nnoremap <Leader>L :vertical resize +10<CR>

nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>q! :q!<CR>

