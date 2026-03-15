local simpleCmd = false

local keyActions = {
    [hs.keycodes.map['cmd']]      = function() hs.keycodes.setLayout('ABC') end,
    [hs.keycodes.map['rightcmd']] = function() hs.keycodes.setMethod('Hiragana') end,
}

local function kanaSwitchEvent(event)
    local eventType = event:getType()
    if eventType == hs.eventtap.event.types.keyDown then
        if event:getFlags()['cmd'] then
            simpleCmd = true
        end
    elseif eventType == hs.eventtap.event.types.flagsChanged then
        if not event:getFlags()['cmd'] then
            if not simpleCmd then
                local action = keyActions[event:getKeyCode()]
                if action then action() end
            end
            simpleCmd = false
        end
    end
end

kanaSwitcher = hs.eventtap.new(
    {hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged},
    kanaSwitchEvent
)
kanaSwitcher:start()
