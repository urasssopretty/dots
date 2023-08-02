local awful = require("awful")
local mod = require("bindings.mod")
local hotkeys_popup = require("awful.hotkeys_popup")
-- require'awful.hotkeys_popup.keys'

local app = require("app")
local mod = require("bindings.mod")
local widgets = require("widgets")

awful.key.keygroup["mykeygroup"] = "custom"
awful.key.keygroups["custom"] = {
   { "t", 1 },
   { "r", 2 },
   { "e", 3 },
   { "w", 4 },
   { "q", 5 }
}

--  TAGS
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { mod,super },
        keygroup    = awful.key.keygroup.mykeygroup,
        description = "view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { mod.super, mod.ctrl },
        keygroup    = awful.key.keygroup.mykeygroup,
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        keygroup    = awful.key.keygroup.mykeygroup,
        description = "move client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { mod.super, mod.ctrl, mod.shift },
        keygroup    = awful.key.keygroup.mykeygroup,
        description = "toggle client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})

--  FOCUS
awful.keyboard.append_global_keybindings({
    awful.key{
        modifiers   = {mod.super},
        key         = 'j',
        description = 'focus next by index',
        group       = 'client',
        on_press    = function() awful.client.focus.byidx(1) end,
    },
    awful.key{
        modifiers   = {mod.super},
        key         = 'k',
        description = 'focus previous by index',
        group       = 'client',
        on_press    = function() awful.client.focus.byidx(-1) end,
    },
    awful.key{
        modifiers   = {mod.super},
        key         = 'Tab',
        description = 'go back',
        group       = 'client',
        on_press    = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    },
    -- awful.key{
    --    modifiers   = {mod.super, mod.ctrl},
    --    key         = 'j',
    --    description = 'focus the next screen',
    --    group       = 'screen',
    --    on_press    = function() awful.screen.focus_relative(1) end,
    -- },
    -- awful.key{
    --    modifiers   = {mod.super, mod.ctrl},
    --    key         = 'k',
    --    description = 'focus the previous screen',
    --    group       = 'screen',
    --    on_press    = function() awful.screen.focus_relative(-1) end,
    -- },
    awful.key{
        modifiers   = {mod.super, mod.ctrl},
        key         = 'n',
        description = 'umminimize',
        group       = 'client',
        on_press    = function()
            local c = awful.client.restore()
            if c then
                c:active{raise = true, context = 'key.unminimize'}
            end
        end,
    },
})

--  LAYOUT
awful.keyboard.append_global_keybindings{
    awful.key{
       modifiers   = {mod.super, mod.shift},
       key         = 'j',
       description = 'swap client with next',
       group       = 'client',
       on_press    = function() awful.client.swap.byidx(1) end,
    },
    awful.key{
       modifiers   = {mod.super, mod.shift},
       key         = 'k',
       description = 'swap client with prev',
       group       = 'client',
       on_press    = function() awful.client.swap.byidx(-1) end,
    },
    -- awful.key{
    --    modifiers   = {mod.super},
    --    key         = 'u',
    --    description = 'jump to urgent client',
    --    group       = 'client',
    --    on_press    = awful.client.urgent.jumpto,
    -- },
    awful.key{
       modifiers   = {mod.super},
       key         = 'l',
       description = 'increase master width factor',
       group       = 'layout',
       on_press    = function() awful.tag.incmwfact(0.05) end,
    },
    awful.key{
       modifiers   = {mod.super},
       key         = 'h',
       description = 'decrease master width factor',
       group       = 'layout',
       on_press    = function() awful.tag.incmwfact(-0.05) end,
    },
    -- awful.key{
    --    modifiers   = {mod.super, mod.shift},
    --    key         = 'h',
    --    description = 'increase the number of master clients',
    --    group       = 'layout',
    --    on_press    = function() awful.tag.incnmaster(1, nil, true) end,
    -- },
    -- awful.key{
    --    modifiers   = {mod.super, mod.shift},
    --    key         = 'l',
    --    description = 'decrease the number of master clients',
    --    group       = 'layout',
    --    on_press    = function() awful.tag.incnmaster(-1, nil, true) end,
    -- },
    -- awful.key{
    --    modifiers   = {mod.super, mod.ctrl},
    --    key         = 'h',
    --    description = 'increase the number of columns',
    --    group       = 'layout',
    --    on_press    = function() awful.tag.incncol(1, nil, true) end,
    -- },
    -- awful.key{
    --    modifiers   = {mod.super, mod.ctrl},
    --    key         = 'l',
    --    description = 'decrease the number of columns',
    --    group       = 'layout',
    --    on_press    = function() awful.tag.incncol(-1, nil, true) end,
    -- },
    awful.key{
       modifiers   = {mod.super},
       key         = 'space',
       description = 'select next',
       group       = 'layout',
       on_press    = function() awful.layout.inc(1) end,
    },
    awful.key{
       modifiers   = {mod.super, mod.shift},
       key         = 'space',
       description = 'select previous',
       group       = 'layout',
       on_press    = function() awful.layout.inc(-1) end,
    },
 }

--  GENERAL
awful.keyboard.append_global_keybindings({
    awful.key{
        modifiers   = {mod.super},
        key         = 's',
        description = 'show help',
        group       = 'awesome',
        on_press    = hotkeys_popup.show_help,
    },
    -- awful.key{
    --    modifiers   = {mod.super},
    --    key         = 'w',
    --    description = 'show main menu',
    --    group       = 'awesome',
    --    on_press    = function() widgets.mainmenu:show() end,
    -- },
    awful.key{
        modifiers   = {mod.super, mod.ctrl},
        key         = 'r',
        description = 'reload awesome',
        group       = 'awesome',
        on_press    = awesome.restart,
    },
    -- awful.key{
    --    modifiers   = {mod.super, mod.shift},
    --    key         = 'q',
    --    description = 'quit awesome',
    --    group       = 'awesome',
    --    on_press    = awesome.quit,
    -- },
    awful.key{
        modifiers   = {mod.super},
        key         = 'Return',
        description = 'open a terminal',
        group       = 'launcher',
        on_press    = function() awful.spawn(app.terminal) end,
    },
    awful.key{
        modifiers   = {mod.super},
        key         = 'p',
        description = 'search the app',
        group       = 'launcher',
        -- on_press    = function() awful.swawn(app.rofi) end,
        on_press    = function() menubar.show() end,
    },
})

