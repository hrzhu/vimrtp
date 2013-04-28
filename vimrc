set rtp+=~/vimrtp/bundle/
set rtp+=~/vimrtp/bundle/vundle/
set nocp
filetype off
"call pathogen#infect()
"call pathogen#helptags()

call vundle#rc("~/vimrtp/bundle")

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'klen/python-mode'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'


"gui
if has("gui_running")
  set guioptions-=r
endif

"basic setting
set autochdir "make working directory the same as the file being edited
filetype indent plugin on
syntax on
"set smartindent
if has('mouse')
  set mouse=a
  set mousehide
endif
set backspace=indent,eol,start
set et ts=2 sw=2

"settings for different filet types
"disable automatic comment
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Ruby stuffs
autocmd FileType ruby setlocal et tabstop=2 shiftwidth=2 omnifunc=rubycomplete#Complete
autocmd FileType ruby compiler ruby
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd FileType rubt let g:rubycomplete_rails=1

"Python stuffs
autocmd FileType python setlocal et tabstop=4 shiftwidth=4 omnifunc=pythoncomplete#Complete
let g:pymode_lint_write = 0 "disable pllint checking when saving
let g:pymode_folding = 0 "disable auto-folding
let g:pymode_rope_guess_project = 0


"visual
set nu
set t_Co=256
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
colorscheme molokai
set laststatus=2
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}\ " ""
set statusline+=%f
"set statusline+=%-3.3n\ "buffer number
"set statusline+=%f\ "filename
set statusline+=%h%m%r%w\ " ""status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= "right align remainder
set statusline+=0x%-8B "character value
set statusline+=%-14(%l,%c%V%) "line, character
set statusline+=%<%P "file position
set colorcolumn=80
hi ColorColumn ctermbg=white guibg=white
set hlsearch
hi Search ctermbg=red guibg=red
set showmatch
"set showfulltag
"show trailing whitespaces
highlight ExtraWhitespaces ctermbg=white guibg=white
match ExtraWhitespaces /\s\+$/
"set list
"set lcs=trail:.
"delete trailing whitespace before writing files
fun! StripTrailingWhitespace()
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1 "Make Taglist appears to the right
set splitright "Make NerdTree open a split to the right

"keybindings
command! -bar -bang Q quit<bang>

"yank/paste from system clipboard
map <S-y> "+y
map <S-p> "+p

map <tab> gt
set <M-1>=1
map <M-1> 1gt
set <M-2>=2
map <M-2> 2gt
set <M-3>=3
map <M-3> 3gt
set <M-4>=4
map <M-4> 4gt
set <M-5>=5
map <M-5> 5gt
set <M-6>=6
map <M-6> 6gt
set <M-7>=7
map <M-7> 7gt
set <M-8>=8
map <M-8> 8gt
map <C-n> :NERDTreeToggle<CR>
