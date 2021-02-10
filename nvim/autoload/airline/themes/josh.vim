let s:term_main = 4
let s:term_alt = 6
let s:term_nor = 4
let s:term_ins = 6
let s:term_vis = 1
let s:term_rep = 1
let s:term_white = 7
let s:term_black = 0
let s:term_grey = 235
let s:term_warn = 160

let g:airline#themes#josh#palette = {}

let g:airline#themes#josh#palette.accents = {
      \ 'red': [ '#E06C75', '', s:term_main, 0 ]
      \ }

let s:N1 = [ '#282C34', '#98C379', s:term_black, s:term_nor ]
let s:N2 = [ '#ABB2BF', '#3E4452', s:term_white, s:term_grey ]
let s:N3 = [ '#98C379', '#282C34', s:term_white, s:term_grey ]
let g:airline#themes#josh#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let group = airline#themes#get_highlight('vimCommand')
let g:airline#themes#josh#palette.normal_modified = {
      \ 'airline_c': [ group[0], '', group[2], '', '' ]
      \ }

let s:I1 = [ '#282C34', '#61AFEF', s:term_black, s:term_ins ]
let s:I2 = s:N2
let s:I3 = s:N3
let g:airline#themes#josh#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#josh#palette.insert_modified = g:airline#themes#josh#palette.normal_modified

let s:R1 = [ '#282C34', '#E06C75', s:term_black, s:term_rep ]
let s:R2 = s:N2
let s:R3 = s:N3
let g:airline#themes#josh#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#josh#palette.replace_modified = g:airline#themes#josh#palette.normal_modified

let s:V1 = [ '#282C34', '#C678DD', s:term_black, s:term_vis ]
let s:V2 = s:N2
let s:V3 = s:N3
let g:airline#themes#josh#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#josh#palette.visual_modified = g:airline#themes#josh#palette.normal_modified

let s:IA1 = [ '#282C34', '#ABB2BF', s:term_black, s:term_white ]
let s:IA2 = [ '#ABB2BF', '#3E4452', s:term_white, s:term_black ]
let s:IA3 = s:N2
let g:airline#themes#josh#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#josh#palette.inactive_modified = {
      \ 'airline_c': [ group[0], '', group[2], '', '' ]
      \ }

let g:airline#themes#josh#palette.tabline = {
      \ 'airline_tab':      ['#c8c8c8' , '#2e2e2e' , s:term_white , s:term_grey , '' ],
      \ 'airline_tabsel':   ['#2e2e2e' , '#a4c639' , s:term_black , s:term_main , '' ],
      \ 'airline_tabtype':  ['#c8c8c8' , '#2e2e2e' , 7 , '' , '' ],
      \ 'airline_tabmod':   ['#2e2e2e' , '#a4c639' , s:term_black , s:term_alt , '' ],
      \ 'airline_tabfill':  ['#c8c8c8' , '#2e2e2e' , 7 , s:term_grey , '' ],
      \ }

" Warnings
let s:WI = [ '#282C34', '#E5C07B', s:term_black, s:term_warn ]
let g:airline#themes#josh#palette.normal.airline_warning = [
      \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
      \ ]

let g:airline#themes#josh#palette.normal_modified.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.insert.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.insert_modified.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.visual.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.visual_modified.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.replace.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

let g:airline#themes#josh#palette.replace_modified.airline_warning =
    \ g:airline#themes#josh#palette.normal.airline_warning

" Errors
let s:ER = [ '#282C34', '#E06C75', s:term_black, s:term_main ]
let g:airline#themes#josh#palette.normal.airline_error = [
      \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
      \ ]

let g:airline#themes#josh#palette.normal_modified.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.insert.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.insert_modified.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.visual.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.visual_modified.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.replace.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error

let g:airline#themes#josh#palette.replace_modified.airline_error =
    \ g:airline#themes#josh#palette.normal.airline_error
