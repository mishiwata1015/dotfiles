-- Hammerspoon configuration

hs.window.animationDuration = 0

require("app_launcher")
require("kana_switcher")


mouseFollowsFocus = hs.loadSpoon("MouseFollowsFocus")
mouseFollowsFocus:start()

hs.alert.show("Config loaded")
