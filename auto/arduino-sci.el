(TeX-add-style-hook "arduino-sci"
 (lambda ()
    (TeX-add-symbols
     '("fnref" 1)
     '("mypageref" 1)
     '("coderef" 1)
     '("secref" 1)
     '("chapref" 1)
     '("tabref" 1)
     '("figref" 1)
     '("ourname" 1)
     '("redcolor" 1)
     "Home"
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
     "suppl/dedicate"
     "user-code/dcmotor/dcmotor")))

