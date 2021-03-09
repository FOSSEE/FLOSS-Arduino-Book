(TeX-add-style-hook "styles"
 (lambda ()
    (LaTeX-add-environments
     "codemass"
     "scicode"
     "ardmass"
     "ardcode"
     "pycode"
     "pymass"
     "indented"
     "thmenumerate"
     "egmass"
     "exercise")
    (TeX-add-symbols
     '("acaption" 1)
     '("ccaption" 1)
     "listofcode"
     "l"
     "listofard"
     "item"
     "eop"
     "qed")
    (TeX-run-style-hooks
     "theorem"
     "ntheorem")))

