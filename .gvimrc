if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :FuzzyFinderTextMate<CR>
  " map <D-t> :CommandT<CR>
  macmenu &File.Open\.\.\. key=<nop>
  map <D-o> :NERDTreeToggle RG<cr>
  map <D-r> :RdbTest<cr>
endif
