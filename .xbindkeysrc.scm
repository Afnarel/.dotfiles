(xbindkey '("XF86AudioRaiseVolume") "amixer -q set Master 5%+ unmute")
(xbindkey '("XF86AudioLowerVolume") "amixer -q set Master 5%- unmute")
(xbindkey '("XF86AudioMute") "amixer -q set Master toggle; amixer set Headphone 93% unmute; amixer set Speaker 93% unmute")
(xbindkey '("XF86AudioMicMute") "amixer -q set Mic toggle")
(xbindkey '("XF86AudioNext") "mocp -f")
(xbindkey '("XF86AudioPrev") "mocp -r")
(xbindkey '("XF86AudioPlay") "mocp -G")
(xbindkey '("XF86MonBrightnessUp") "xbacklight -inc 10")
(xbindkey '("XF86MonBrightnessDown") "xbacklight -dec 10")
