"
" Version: 0.0.1
" Author: anekos
" License: BSD

if exists('g:loaded_guruguru')
  finish
endif
let g:loaded_guruguru = 1

let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8



let s:PI = 3.1415926535
let s:t = 0
let s:dt = 0.01

function! s:guru(...)
  let s:t += s:dt
  let l:pos = {'x': s:base.x + float2nr(s:t * sin(s:t) * 10), 'y': s:base.y + float2nr(s:t * cos(s:t) * 10)}

  execute 'winpos' string(l:pos.x) string(l:pos.y)
endfunction

function! s:guruguru(...)
  let s:t = 0
  let s:dt = get(a:, 1, 1) / 100
  let s:base = {'x': getwinposx(), 'y': getwinposy()}
  let s:timer = timer_start(10, funcref('s:guru'), {'repeat': -1})
endfunction

function! s:stop_guru()
  echo '(ﾟДﾟ)ﾊｧ?'
endfunction

command! -nargs=? -bar Guruguru call s:guruguru(<args>)
command! -bar GuruguruYamete call s:stop_guruguru()



let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
