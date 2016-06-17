" Funcionalidad completa, incompatibilidad con vi
set nocompatible

" Requerido para Vundle
filetype off

" Usar la carpeta .vim para guardar los archivos específicos al programa,
" incluso en Windows
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

" La reglita
set ruler

" Esquema de colores
colorscheme evening

" Activa el resaltado de sintaxis
syntax on

" Delete funciona como debería
set backspace=2

" Longitud del tabulador = 4 espacios
set shiftwidth=4
set tabstop=4

" Indentación automática e inteligente
set ai
set si

" Mouse, donde se pueda
if has('mouse')
	set mouse=a
endif

" Soporte para mouse dentro de tmux
if &term =~ '^screen'
	set ttymouse=xterm2
endif

" Divide las líneas por palabras (no corta palabras a la mitad)
set lbr

" UTF-8 por defecto
set encoding=utf8

" Formatos de archivo, se prefiere UNIX
set ffs=unix,dos,mac

" No diferencia entre mayúsculas y minúsculas para buscar
set ignorecase

" Trata de ser inteligente respecto de la capitalización cuando busca
set smartcase

" Activa el "folding" para navegar por clases y métodos fácilmente
set foldmethod=syntax

" Todos los backups, swaps y undo a su correspondiente directorio. Chequea si
" el directorio existe, y lo crea si es necesario.
if !isdirectory(expand("$HOME/.vim/swap"))
        call mkdir($HOME.'/.vim/swap', "p")
endif
set directory=~/.vim/swap// "El / al final crea los backup con la ruta completa en el nombre

if !isdirectory(expand("$HOME/.vim/backup"))
        call mkdir($HOME.'/.vim/backup', "p")
endif
set backupdir=~/.vim/backup// "Idem anterior

if !isdirectory(expand("$HOME/.vim/undo"))
        call mkdir($HOME.'/.vim/undo', "p")
endif
set undodir=~/.vim/undo// "Idem anterior

" Panel de navegación a la izquierda, se activa con CTRL-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Mostrar el árbol completo en el panel de navegación
let g:netrw_liststyle=3

" Configuración de TheSilverSearcher y CtrlP
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Desactiva campanas al, por ejemplo, presionar ESC en modo normal
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
