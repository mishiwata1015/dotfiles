local app_map = {}

local mash = {"cmd", "ctrl"}

local function registerAppLauncher(modifier, app)
  table.insert(app_map, string.lower(modifier) .. " - " .. app)
  hs.hotkey.bind(mash, modifier, function ()
    hs.application.launchOrFocus(app)
  end)
end

registerAppLauncher("C", "Google Chrome")
registerAppLauncher("D", "zoom.us")
registerAppLauncher("H", "Skitch")
registerAppLauncher("I", "iterm")
registerAppLauncher("M", "Mail")
registerAppLauncher("S", "Slack")
registerAppLauncher("T", "Sequel Ace")
registerAppLauncher("V", "Visual Studio Code")
registerAppLauncher("X", "Firefox")

-- Show help message for application launcher
hs.hotkey.bind(mash, "/", function ()
  local function join(delimiter, list)
    local result = list[1]
    for i = 2, #list do
      result = result .. delimiter .. list[i]
    end
    return result
  end
  hs.alert.show(join("\n", app_map), 2)
end)
