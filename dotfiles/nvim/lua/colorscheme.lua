vim.cmd [[
try
  colorscheme dracula
  set highlight Normal ctermbg=NONE guibg=NONE
  set highlight NonText ctermbg=NONE guibg=NONE
  set highlight LineNr ctermbg=NONE guibg=NONE
  set highlight Folded ctermbg=NONE guibg=NONE
  set highlight EndOfBuffer ctermbg=NONE guibg=NONE
  set background=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
