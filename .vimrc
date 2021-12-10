syntax on
set mouse=r
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
highlight ColorColumn ctermbg=7

" active window navigation 
map <F1> <C-W><C-W> 

" open file hierarchy from the left side
map <F2> :NERDTreeToggle<CR>

" shoes functions and macroses from the left side
map <F3> :TlistToggle<CR>

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

" create cscope.out file with F5
map <F5> :!cscope -R -b<Cr>:cscope add cscope.out<Cr>

execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! Cse()
  cscope find e <cword>
  copen
endfunction
command! Cse call Cse()

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

