local _M = {
	terminal = os.getenv('TERMINAL') or 'alacritty',
	editor = os.getenv('EDITOR')   or 'micro',
	rofi = 'rofi -show drun', -- TODO: add theme
	files = 'pcmanfm',
	browser = 'google-chrome-stable',
 }
 
 _M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
 _M.manual_cmd = _M.terminal .. ' -e man awesome'
 
 return _M