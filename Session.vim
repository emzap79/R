let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Unimaterialien/Sommer2014/R
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +839 ~/.mutt/muttScoring.priv
badd +1 Klausur_PetongJonas_0031_korrigiert.r
badd +98 Klausur_KiwittMarian_0063.r
badd +162 ~/.vim/after/ftplugin/r.vim
badd +1 ~/.vim/emzapsnips/r.snippets
badd +847 mitschrift.r
badd +0 R_doc
argglobal
silent! argdel *
argadd Klausur_PetongJonas_0031_korrigiert.r
argadd Klausur_KiwittMarian_0063.r
edit R_doc
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit R_doc
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=2
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Unimaterialien/Sommer2014/R
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=30 winwidth=55 shortmess=filnxToOatI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
let g:this_obsession = v:this_session
unlet SessionLoad
" vim: set ft=vim :
