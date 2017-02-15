function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        !./install.py --clang-completer --system-libclang --gocode-completer
    endif
endfunction

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'on': ['YcmGenerateConfig', 'CCGenerateConfig'], 'branch': 'stable' }

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Initialize plugin system
call plug#end()

" ale {
  nmap <Leader>en <Plug>(ale_next)
  nmap <Leader>ep <Plug>(ale_previous)
" }

" tagbar {
  let g:tagbar_left = 1
  let g:tagbar_autofocus = 1
  nnoremap <F9> :TagbarToggle<CR>
  inoremap <F9> <ESC>:TagbarToggle<CR>
  nnoremap <Leader>tt :TagbarToggle<CR>
  let g:tagbar_sort = 0
" }

" vim-fugitive {
  nnoremap <silent> <Leader>gs :Gstatus<CR>
  nnoremap <silent> <Leader>gd :Gdiff<CR>
  nnoremap <silent> <Leader>gc :Gcommit<CR>
  nnoremap <silent> <Leader>gb :Gblame<CR>
  nnoremap <silent> <Leader>gl :Glog<CR>
  nnoremap <silent> <Leader>gp :Git push<CR>
  nnoremap <silent> <Leader>gr :Gread<CR>
  nnoremap <silent> <Leader>gw :Gwrite<CR>
  nnoremap <silent> <Leader>ge :Gedit<CR>
  nnoremap <silent> <Leader>gi :Git add -p %<CR>
" }

" vim-gitgutter {
  " consistent with airline
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '~'
  let g:gitgutter_sign_removed = '-'

  let g:gitgutter_sign_removed_first_line = '^^'
  let g:gitgutter_sign_modified_removed = 'ww'
  let g:gitgutter_override_sign_column_highlight = 0

  nnoremap <silent> <Leader>tg :GitGutterToggle<CR>
" }

" YouCompleteMe {
  let g:ycm_error_symbol='✖'
  let g:ycm_warning_symbol='⚠ '
  let g:ycm_min_num_of_chars_for_completion=2
  let g:ycm_cache_omnifunc=0
  let g:ycm_seed_identifiers_with_syntax=1
  let g:ycm_complete_in_comments=1
  let g:ycm_complete_in_strings=1
  let g:ycm_collect_identifiers_from_comments_and_strings=0
  let g:ycm_semantic_triggers =  {
              \   'c' : ['->', '.'],
              \   'objc' : ['->', '.'],
              \   'ocaml' : ['.', '#'],
              \   'cpp,objcpp' : ['->', '.', '::'],
              \   'perl' : ['->'],
              \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
              \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
              \   'html': ['<', '"', '</', ' '],
              \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
              \   'ruby' : ['.', '::'],
              \   'lua' : ['.', ':'],
              \   'erlang' : [':'],
              \   'haskell' : ['.', 're!.'],
              \   'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
              \ }
  let g:ycm_filetype_blacklist={
            \   'tagbar' : 1,
            \   'nerdtree' : 1,
            \   'markdown' : 1,
            \   'unite' : 1,
            \   'text' : 1,
            \   'csv' : 1,
            \ }
  augroup YCM
    autocmd!

    " Key bindings
    autocmd FileType c,cpp,python,go,javascript,rust
                \   nnoremap <LocalLeader>gd :YcmCompleter GoTo<CR>
    autocmd FileType c,cpp,python,rust,javascript,typescript
                \   nnoremap <LocalLeader>gD :YcmCompleter GetDoc<CR>
    autocmd FileType c,cpp
                \   nnoremap <LocalLeader>gi :YcmCompleter GoToInclude<CR>
    autocmd FileType javascript,python,typescript
                \   nnoremap <LocalLeader>gr :YcmCompleter GoToReferences<CR>
    autocmd FileType c,cpp,javascript,typescript
                \   nnoremap <LocalLeader>gt :YcmCompleter GetType<CR>
    autocmd FileType c,cpp
                \   nnoremap <LocalLeader>gp :YcmCompleter GetParent<CR>
  augroup END
" }

" vim-go {
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_build_constraints = 1
" }
