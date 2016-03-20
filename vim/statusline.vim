function! NumberSection()
  return ' %n ' " buffer number
endfunction

function! LeftSep()
  return ' » '
endfunction

function! RightSep()
  return ' « '
endfunction

function! FileModes()
  let fm = ''

  if &modified
    let fm.= '  +'
  endif

  if &readonly
    let fm.= '  '
  endif

  if &paste
    let fm.= '  P'
  endif

  if bufname("%") =~ "scp://"
    let fm.= '  '
  endif

  let fm.= '%0*'

  return fm
endfunction

function! ScrollPercentage()
  return " %p%% "
endfunction

function! BufferFileType()
  return " %y "
endfunction

function! NeotermTestStatus()
  let section = ''
  if exists(":T")
    let section .= " "
    let section .= "%#NeotermTestRunning#%{neoterm#test#status('running')}%*"
    let section .= "%#NeotermTestSuccess#%{neoterm#test#status('success')}%*"
    let section .= "%#NeotermTestFailed#%{neoterm#test#status('failed')}%*"
    let section .= " "
  endif
  return section
endfunction

function! FugitiveStatus()
  let section = ''

  if exists('*fugitive#head')
    let head = fugitive#head()

    if !empty(head)
      let section .= ' ' . head . ' '
    endif
  endif

  return section
endfunction

function! LeftSide()
  let ls = ''
  let ls.= NumberSection()
  let ls.= LeftSep()
  let ls.= '%f' " file name
  let ls.= RightSep()
  let ls.= FileModes()

  return ls
endfunction

function! RightSide()
  let rs = ''

  let rs .= BufferFileType()
  let rs .= ScrollPercentage()
  let rs .= NeotermTestStatus()
  let rs .= FugitiveStatus()

  return rs
endfunction

function! StatusLine()
  let statusl = LeftSide()
  let statusl.= '%='
  let statusl.= RightSide()

  return statusl
endfunction

set statusline=%!StatusLine()
