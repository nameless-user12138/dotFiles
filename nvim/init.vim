inoremap jk <ESC>l
noremap J 7j
noremap K 7k

set encoding=UTF-8
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set noshowmode

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cdelledonne/vim-cmake'
Plug 'preservim/nerdtree'

Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords'

Plug 'arcticicestudio/nord-vim'

Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme nord

let g:airline_powerline_fonts = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

