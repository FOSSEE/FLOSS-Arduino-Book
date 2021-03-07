(TeX-add-style-hook "led"
 (lambda ()
    (LaTeX-add-labels
     "sec:led-pril"
     "fig:ledsym"
     "fig:ledblock"
     "fig:uno-shield-connect"
     "sec:light-ard"
     "fig:led-uno"
     "sec:light-sci"
     "sec:light-xcos"
     "fig:led-blue"
     "tab:led-blue"
     "fig:led-blue-delay"
     "tab:led-blue-delay"
     "fig:led-blue-red"
     "tab:led-blue-red"
     "fig:led-green-blink"
     "tab:led-green-blink"
     "sec:led-arduino-code"
     "ard:led-blue"
     "ard:led-blue-delay"
     "ard:led-blue-red"
     "ard:led-blink"
     "sec:led-scilab-code"
     "sci:led-blue"
     "sci:led-blue-delay"
     "sci:led-blue-red"
     "sci:led-green-blink")
    (TeX-add-symbols
     '("LocLEDardbrief" 1)
     '("LocLEDscibrief" 1)
     "LocLEDfig"
     "LocLEDscicode"
     "LocLEDardcode")))

