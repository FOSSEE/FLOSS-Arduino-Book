(TeX-add-style-hook "modbus"
 (lambda ()
    (LaTeX-add-labels
     "fig:mod-block"
     "fig:mod-master-slave"
     "fig:rs-485"
     "tab:request-packet"
     "tab:response-packet"
     "tab:ieee-decimal"
     "tab:single-precision"
     "fig:full-set-up"
     "fig:block-diagram"
     "fig:modbus-firmware"
     "fig:flow-chart"
     "fig:current-console"
     "fig:current-meter"
     "fig:voltage-console"
     "fig:voltage-meter"
     "fig:power-console"
     "fig:power-meter"
     "fig:mod-read"
     "tab:mod-xcos-read"
     "sec:firmware-modbus"
     "ard:firmware-modbus"
     "sec:modbus-scilab-code"
     "sci:current-modbus"
     "sci:voltage-modbus"
     "sci:modbus-power")
    (TeX-add-symbols
     '("LocMODardbrief" 1)
     '("LocMODscibrief" 1)
     "LocMODfig"
     "LocMODscicode"
     "LocMODardcode")))

