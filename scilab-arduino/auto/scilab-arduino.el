(TeX-add-style-hook "scilab-arduino"
 (lambda ()
    (LaTeX-add-bibliographies
     "bibliography.bib")
    (TeX-add-symbols
     '("fnrefp" 1)
     '("fnref" 1)
     '("mypageref" 1)
     '("ardref" 1)
     '("sciref" 1)
     '("pyref" 1)
     '("secref" 1)
     '("chapref" 1)
     '("tabrefp" 1)
     '("tabref" 1)
     '("figrefp" 1)
     '("figref" 1)
     '("ourname" 1)
     '("redcolor" 1)
     '("bluecolor" 1)
     "Origin"
     "Home"
     "portcmd"
     "codclr"
     "scilab"
     "arduino"
     "python"
     "ie"
     "tnfig"
     "smfig"
     "smfigp"
     "lgfig"
     "hgfig")
    (TeX-run-style-hooks
     "seqsplit"
     "beramono"
     "fontenc"
     "T1"
     "varioref"
     "listings"
     "subfig"
     "cite"
     "url"
     "fancybox"
     "makeidx"
     "graphicx"
     "amsmath"
     "fancyhdr"
     "chngcntr"
     "paralist"
     "morefloats"
     "cclicenses"
     "layouts"
     "color"
     "latex2e"
     "bk11"
     "book"
     "a4paper"
     "11pt"
     "suppl/acr"
     "suppl/intro"
     "user-code/hw-env/hw-env"
     "user-code/sw-env/sw-env"
     "user-code/led/led"
     "user-code/push/push"
     "user-code/ldr/ldr"
     "user-code/dcmotor/dcmotor"
     "user-code/pot/pot"
     "user-code/thermistor/thermistor"
     "user-code/servo/servo"
     "user-code/modbus/modbus")))

