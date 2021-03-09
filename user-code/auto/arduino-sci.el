(TeX-add-style-hook "arduino-sci"
 (lambda ()
    (LaTeX-add-environments
     "codemass"
     "code")
    (TeX-add-symbols
     '("fnref" 1)
     '("mypageref" 1)
     '("coderef" 1)
     '("secref" 1)
     '("chapref" 1)
     '("tabref" 1)
     '("figref" 1)
     '("ourname" 1)
     '("ccaption" 1)
     '("redcolor" 1)
     "listofcode"
     "l"
     "codclr"
     "scilab"
     "arduino"
     "ie"
     "tnfig"
     "smfig"
     "smfigp"
     "lgfig"
     "hgfig")
    (TeX-run-style-hooks
     "cite"
     "url"
     "fancybox"
     "makeidx"
     "graphicx"
     "amsmath"
     "fancyhdr"
     "listings"
     "subfig"
     "chngcntr"
     "paralist"
     "morefloats"
     "cclicenses"
     "layouts"
     "ntheorem"
     "color"
     "latex2e"
     "bk11"
     "book"
     "a4paper"
     "11pt"
     "styles"
     "dedicate"
     "texfiles/microcontintro"
     "texfiles/sciaurint"
     "texfiles/led"
     "texfiles/ldr"
     "texfiles/dcmotor"
     "texfiles/potmeter"
     "texfiles/servo"
     "texfiles/pushbutton")))

