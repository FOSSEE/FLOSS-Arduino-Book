(TeX-add-style-hook "push"
 (lambda ()
    (LaTeX-add-labels
     "pushbutton"
     "fig:pushbuttonconn"
     "sec:push-xcos"
     "fig:push-button-status"
     "tab:push-button-status"
     "fig:led-push-button"
     "tab:led-push-button"
     "sec:push-arduino-code"
     "ard:push-100"
     "ard:push-200"
     "sec:push-scilab-code"
     "sci:push-100"
     "sci:push-200")
    (TeX-add-symbols
     '("LocPushardbrief" 1)
     '("LocPushscibrief" 1)
     "LocPushfig"
     "LocPushscicode"
     "LocPushardcode")))

