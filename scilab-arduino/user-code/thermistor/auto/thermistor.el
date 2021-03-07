(TeX-add-style-hook "thermistor"
 (lambda ()
    (LaTeX-add-labels
     "fig:therm"
     "fig:thermsym"
     "fig:therm-conn"
     "fig:buzzer-conn"
     "therm-abc"
     "therm-beta"
     "fig:therm-read"
     "tab:therm-read"
     "fig:therm-read-output"
     "fig:therm-buzzer"
     "tab:ldr-led"
     "fig:therm-buzzer-output"
     "sec:therm-arduino-code"
     "ard:therm-read"
     "ard:therm-buzzer"
     "sec:therm-scilab-code"
     "sci:therm-read"
     "sci:therm-buzzer")
    (TeX-add-symbols
     '("LocTHERMardbrief" 1)
     '("LocTHERMscibrief" 1)
     "LocTHERMfig"
     "LocTHERMscicode"
     "LocTHERMardcode")))

