(TeX-add-style-hook "dcmotor"
 (lambda ()
    (LaTeX-add-index-entries
     "H-Bridge circuit DC motor"
     "H-Bridge"
     "L293D,L298"
     "PCB breakout
  board"
     "pulse width
  modulation, PWM")
    (LaTeX-add-labels
     "fig:motordriverboard"
     "fig:dcm-schematic"
     "fig:dcmotorconn"
     "sec:dcm-ard"
     "sec:dcm-sci"
     "table:convention"
     "tab:dcmotor-init"
     "sec:dc-both"
     "fig:dcmotor-clock"
     "tab:dcmotor-clock"
     "fig:dcmotor-both"
     "tab:dcmotor-both"
     "fig:dcmotor-loop"
     "tab:dcmotor-loop"
     "sec:dcmotor-arduino-code"
     "ard:dcmotor-clock"
     "ard:dcmotor-both"
     "ard:dcmotor-loop"
     "sec:dcmotor-scilab-code"
     "sci:dcmotor-clock"
     "sci:dcmotor-both"
     "sci:dcmotor-loop")
    (TeX-add-symbols
     '("LocDCMardbrief" 1)
     '("LocDCMscibrief" 1)
     "LocDCMfig"
     "LocDCMscicode"
     "LocDCMardcode")))

