" Funcionalidad completa, incompatibilidad con vi
set nocompatible

" Usar la carpeta .vim para guardar los archivos específicos al programa,
" incluso en Windows
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" La reglita
set ruler

" Esquema de colores
colorscheme murphy

" Activa la indentación según el tipo de archivo
filetype plugin on
filetype indent on

" Activa el resaltado de sintaxis
syntax on

" Longitud del tabulador = 4 espacios
set shiftwidth=4
set tabstop=4

" Indentación automática e inteligente
set ai
set si

" Desactiva la campanita molesta
set noerrorbells

" Mouse, donde se pueda
if has('mouse')
	set mouse=a
endif

" UTF-8 por defecto
set encoding=utf8

" Formatos de archivo, se prefiere UNIX
set ffs=unix,dos,mac

" No diferencia entre mayúsculas y minúsculas para buscar
set ignorecase

" Trata de ser inteligente respecto de la capitalización cuando busca
set smartcase

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
