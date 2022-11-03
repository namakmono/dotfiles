" vi互換モードではなく、Vimとして使用
set nocompatible
" シンタックスハイライト機能on
syntax enable
" ファイルタイプ検出、ファイルタイププラグイン、インデントプラグインをon
filetype plugin indent on

"colortheme
let g:seoul256_background = 235
colo seoul256

set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" キーマップ の際のLeaderをセットする
let mapleader = "\<Space>"

" autcmdのplugin
augroup autcmd_main
  autocmd!
  autocmd Filetype * call s:my_ftplugin(expand('<amatch>'))
augroup END


" javascript用plugin
function! s:my_javascript_ftplugin() abort
  " Leader + ; で末尾に;つける
  nnoremap <buffer> <Leader>; $a;<ESC>
  " 閉じカッコの自動入力
  call s:map_auto_kakko('""')
  call s:map_auto_kakko("''")
  call s:map_auto_kakko('``')
  call s:map_auto_kakko('()')
  call s:map_auto_kakko('[]')
  call s:map_auto_kakko('{}')
  call s:map_auto_kakko('<>')
endfunction


" HTML用plugin
function! s:my_html_ftplugin() abort
  " </したら自動入力
  " (本当は<div>と入力したら、</div>入力させて、<の前に戻りたい)
  inoremap <buffer> </ </<C-x><C-o><ESC>F<i
  " 閉じカッコの自動入力
  call s:map_auto_kakko('""')
  call s:map_auto_kakko("''")
  call s:map_auto_kakko('()')
  call s:map_auto_kakko('[]')
  call s:map_auto_kakko('{}')
  call s:map_auto_kakko('<>')
endfunction


" functions "

" 特定のftypeのプラグインを呼ぶ
function! s:my_ftplugin(ftype) abort
  let l:function_name = 's:my_' .. a:ftype .. '_ftplugin'
  if !empty(a:ftype) && exists('*' .. l:function_name)
    execute 'call ' .. l:function_name .. '()'
  endif
endfunction


" 閉じカッコの自動入力をマッピングする
" 引数例: '()' "''"
function s:map_auto_kakko(kakko) abort
  if (strcharlen(a:kakko) != 2)
    throw "引数には2文字のカッコを渡してください"
  endif
  let l:open_kakko = strcharpart(a:kakko, 0, 1)
  let l:close_kakko = strcharpart(a:kakko, 1, 1)
  execute join(["inoremap <buffer> ", l:open_kakko, " ", l:open_kakko, l:close_kakko, "<ESC>i"], "")
endfunction
