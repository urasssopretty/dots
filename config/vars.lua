local _M = {}

local awful = require'awful'
local bling = require("modules.bling")

_M.layouts = {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   -- awful.layout.suit.tile.left,
   -- awful.layout.suit.tile.bottom,
   -- awful.layout.suit.tile.top,
   -- awful.layout.suit.fair,
   -- awful.layout.suit.fair.horizontal,
   -- awful.layout.suit.spiral,
   -- awful.layout.suit.spiral.dwindle,
   -- awful.layout.suit.max,
   awful.layout.suit.max.fullscreen,
   -- awful.layout.suit.magnifier,
   -- awful.layout.suit.corner.nw,
   -- bling.layout.mstab,
   bling.layout.centered,
   -- bling.layout.vertical,
   -- bling.layout.horizontal,
   bling.layout.equalarea,
   -- bling.layout.deck,
}

_M.tags = {'1', '2', '3', '4', '5'}
-- _M.tags = {'1', '2', '3', '4', '5', '6', '7', '8', '9'}

return _M
