vim.cmd [[
try
  colorscheme iceberg
    highlight Normal ctermbg=NONE guibg=NONE
    highlight NonText ctermbg=NONE guibg=NONE
    highlight LineNr ctermbg=NONE guibg=NONE
    highlight Folded ctermbg=NONE guibg=NONE
    highlight EndOfBuffer ctermbg=NONE guibg=NONEs
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
