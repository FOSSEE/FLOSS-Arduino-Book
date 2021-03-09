(TeX-add-style-hook "ldr"
 (lambda ()
    (LaTeX-add-labels
     "fig:ldr"
     "fig:ldrsym"
     "fig:ldrconn"
     "fig:ldr-read"
     "tab:ldr-read"
     "fig:ldr-led"
     "tab:ldr-led"
     "sec:ldr-arduino-code"
     "ard:ldr-read"
     "ard:ldr-led"
     "sec:ldr-scilab-code"
     "sci:ldr-read"
     "sci:ldr-led")
    (TeX-add-symbols
     '("LocLDRardbrief" 1)
     '("LocLDRscibrief" 1)
     "LocLDRfig"
     "LocLDRscicode"
     "LocLDRardcode")))

