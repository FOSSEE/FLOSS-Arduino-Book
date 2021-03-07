(TeX-add-style-hook "servo"
 (lambda ()
    (LaTeX-add-labels
     "sec:servo"
     "tab:servo-connect"
     "sec:servo-ard"
     "sec:servo-sci"
     "sec:servo-xcos"
     "fig:servo-init"
     "tab:servo-init"
     "fig:servo-reverse"
     "tab:servo-reverse"
     "fig:servo-loop"
     "tab:servo-loop"
     "fig:servo-pot"
     "tab:servo-pot"
     "sec:servo-arduino-code"
     "ard:servo-init"
     "ard:servo-reverse"
     "ard:servo-loop"
     "ard:servo-pot"
     "sec:servo-scilab-code"
     "sci:servo-init"
     "sci:servo-reverse"
     "sci:servo-loop"
     "sci:servo-pot")
    (TeX-add-symbols
     '("LocSERardbrief" 1)
     '("LocSERscibrief" 1)
     "LocSERfig"
     "LocSERscicode"
     "LocSERardcode")))

