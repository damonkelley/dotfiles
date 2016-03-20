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

  if get(g:, 'vs_open', 0)
    let rs .= '%5*'
    let rs .= 'TP:Open'
    let rs .= '%0*'
    let rs .= ' '
  elseif bufname("%") =~ '_spec.rb'
    let rs .= '%4*'
    let rs .= 'TP:Closed'
    let rs .= '%0*'
    let rs .= ' '
  endif

  if exists ("neomake#statusline#LoclistStatus")
    let errors = neomake#statusline#LoclistStatus()
    if errors =~ 'E'
      let rs .= "%2*"
      let rs .= errors
    else
      let rs .= "%4*"
      let rs .= errors
    endif
    let rs .= "%0*"
    let rs .= " "
  endif

  if exists(":T")
      let rs .= " "
      let rs .= "%#NeotermTestRunning#%{neoterm#test#status('running')}%*"
      let rs .= "%#NeotermTestSuccess#%{neoterm#test#status('success')}%*"
      let rs .= "%#NeotermTestFailed#%{neoterm#test#status('failed')}%*"
      let rs .= " "
  endif

  if exists('*fugitive#head')
    let head = fugitive#head()

    if !empty(head)
      let rs .= ' ' . head . ' '
    endif
  endif

  return rs
endfunction

function! StatusLine()
  let statusl = LeftSide()
  let statusl.= '%='
  let statusl.= RightSide()

  return statusl
endfunction

set statusline=%!StatusLine()
