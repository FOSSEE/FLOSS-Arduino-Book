(TeX-add-style-hook "pot"
 (lambda ()
    (LaTeX-add-labels
     "potmeter"
     "fig:pot"
     "fig:potsch"
     "fig:potmeterconn"
     "fig:pot-threshold"
     "tab:pot-threshold"
     "sec:pot-arduino-code"
     "ard:pot-100"
     "sec:pot-scilab-code"
     "sci:pot-100")
    (TeX-add-symbols
     '("LocPotardbrief" 1)
     '("LocPotscibrief" 1)
     "LocPotfig"
     "LocPotscicode"
     "LocPotardcode")))

