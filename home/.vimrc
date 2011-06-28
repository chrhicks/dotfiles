call pathogen#runtime_append_all_bundles()

syntax enable
set background=dark
colorscheme solarized

set nu
set tabstop=2
set shiftwidth=2
set expandtab
set si

" Show invisible characters
nmap <leader>l :set list!<CR>
" Clears trailing whitespace
map <Leader><Space> :%s/\s\+$//<CR>:let @/=''<CR>
" Use the same symbols as TextMate for tabstops and EOLs
if &encoding == 'utf-8'
  set listchars=tab:▸\ ,eol:¬,trail:·
endif

