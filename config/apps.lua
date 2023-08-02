local _M = {
   terminal = os.getenv('TERMINAL') or 'alacritty',
   editor   = os.getenv('EDITOR')   or 'micro',
   browser   = "google-chrome-stable",
   explorer   = "pcmanfm",
   rofi   = "rofi -show drun",
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
