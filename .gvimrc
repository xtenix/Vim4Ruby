if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
  macmenu &File.Open\.\.\. key=<nop>
  map <D-o> :NERDTreeToggle RG<cr>
  map <D-r> :RdbTest<cr>
endif
