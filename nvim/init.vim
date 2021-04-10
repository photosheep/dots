" Neovim conf
" Set line nums.

" Add dein plugin manager
if &compatible
    set nocompatible
endif

set runtimepath+=/usr/share/vim/vimfiles/autoload/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('/usr/share/vim/vimfiles/autoload/dein/')
  call dein#add('neoclide/coc.nvim', {'branch': 'release'})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set nu
set relativenumber
set nomodeline
set noshowmode
set encoding=utf-8
set equalalways
set eadirection="ver"
set nobackup
set nowritebackup

set pyxversion=3

" Tab related settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Theme-related vars.
colorscheme papaya
let g:airline_theme = "josh"

highlight Pmenu ctermbg=0 ctermfg=4
highlight PmenuSel ctermbg=4 ctermfg=0
highlight PmenuSbar ctermbg=0 ctermfg=6

let mapleader=","

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ '^S'     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ '^V'     : 'V',
    \ }


fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Disable EX
nnoremap Q <nop>

" Leader homing functionality
map <silent> <leader><leader> /<++><Esc>:noh<CR>cf>
ino <silent> <leader><leader> <Esc>/<++><Esc>:noh<CR>cf>

" General purpose leader commands
map <silent> <leader>n :noh<CR>
ino <silent> <leader>n <Esc>:noh<CR>
map <leader>o o<Esc>Vc
ino <leader>o o<Esc>Vc
map <leader>cp "+p
ino <leader>cp <Esc>"+p
map <leader>cy "+y

" Insert date for personal blog and other stuff.
map <F5> "=strftime("%F %R:00 %z")<CR>
ino <F5> <C-R>=strftime("%F %R:00 %z")<CR>
map <F6> "=strftime("%F")<CR>
ino <F6> <C-R>=strftime("%F")<CR>

" Tab functionality.
map <leader>te :tabedit<Space>
map <silent> <leader>tq :tabclose<CR>
map <silent> <C-H> :tabprev<CR>
map <silent> <C-L> :tabnext<CR>
ino <leader>te <Esc>:tabedit<Space>
ino <silent> <leader>tq <Esc>:tabclose<CR>
ino <silent> <C-H> <Esc>:tabprev<CR>
ino <silent> <C-L> <Esc>:tabnext<CR>

map <silent> <leader>pt :NERDTreeToggle<CR>
ino <silent> <leader>pt <Esc>:NERDTreeToggle<CR>

function! GPG_CryptMail()
    let gpgmail = input('Enter local key email : ')
    let gpgtarget = input('Enter recipient email : ')
    let cmd = 'gpg --encrypt --local-user '.gpgmail.' --sign --armor -r '.gpgtarget.' --output - -'
    execute '%!'.cmd
    endfunction

function! GPG_SignMail()
    let gpgmail = input('Enter local key email : ')
    let cmd = 'gpg --no-tty --local-user '.gpgmail.' --output - --clearsign -'
    execute '%!'.cmd
    endfunction

autocmd Filetype mail map <silent> <leader>gcs :call GPG_SignMail()<CR>
autocmd Filetype mail ino <silent> <leader>gcs <Esc>:call GPG_SignMail()<CR>
autocmd Filetype mail map <silent> <leader>gec :call GPG_CryptMail()<CR>
autocmd Filetype mail ino <silent> <leader>gec <Esc>:call GPG_CryptMail()<CR>

" Markup for bashblog
autocmd Filetype markdown let @l="Yp\<C-a>"
autocmd Filetype markdown map <leader>mb i**<Space>**<++><Esc>bXi
autocmd Filetype markdown ino <leader>mb **<Space>**<++><Esc>bXi
autocmd Filetype markdown map <leader>mi i*<Space>*<++><Esc>bXi
autocmd Filetype markdown ino <leader>mi *<Space>*<++><Esc>bXi
autocmd Filetype markdown map <leader>mc i``<Space>``<++><Esc>bXi
autocmd Filetype markdown ino <leader>mc ``<Space>``<++><Esc>bXi
autocmd Filetype markdown map <leader>mh i#<Space>#<++><Esc>bXi
autocmd Filetype markdown ino <leader>mh #<Space>#<++><Esc>bXi
autocmd Filetype markdown map <expr> <leader>mln '<Esc>o1.<Space><++><Esc>ml' . ( v:count - 1 ) . '@l`lciw'
autocmd Filetype markdown map <expr> <leader>mlb '<Esc>o*<Space><++><Esc>dd' . v:count . 'Pwciw'
autocmd Filetype markdown map <expr> <leader>mq '<Esc>o><Space><++><CR><Esc>k2dd' . v:count . 'Pwciw'
autocmd Filetype markdown map <leader>mu i[<Space>](<++>)<++><Esc>bXi
autocmd Filetype markdown ino <leader>mu [<Space>](<++>)<++><Esc>bXi
autocmd Filetype markdown map <leader>me i![<Space>](<++>)<++><Esc>bXi
autocmd Filetype markdown ino <leader>me ![<Space>](<++>)<++><Esc>bXi
autocmd Filetype markdown map <leader>mru i[<Space>][<++>]<++><Esc>bXi
autocmd Filetype markdown ino <leader>mru [<Space>][<++>]<++><Esc>bXi
autocmd Filetype markdown map <leader>mrl i[<Space>]:<Space><++><Space>"<++>"<++><Esc>3bXi
autocmd Filetype markdown ino <leader>mrl [<Space>]:<Space><++><Space>"<++>"<++><Esc>3bri
