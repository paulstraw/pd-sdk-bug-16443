import "CoreLibs/graphics"

local playdate <const> = playdate
local graphics <const> = playdate.graphics

local lastSerialMessageReceived = 'No message received yet…'
local lastSerialMessageReceivedLength = 0

-- No NUL, CR, or LF. 125 characters
local mostAsciiChars = '	 !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'

playdate.display.setRefreshRate(50)

playdate.update = function()
	graphics.clear()

	graphics.drawText(lastSerialMessageReceivedLength, 10, 10)
	graphics.drawTextInRect(lastSerialMessageReceived, 10, 30, 380, 48)

	graphics.drawText('Most ASCII chars (' .. #mostAsciiChars .. '):', 10, 100)
	graphics.drawTextInRect(mostAsciiChars, 10, 120, 380, 60)
end

playdate.serialMessageReceived = function(msg)
	lastSerialMessageReceived = msg
	lastSerialMessageReceivedLength = #msg

	-- Echo whatever we receive back to the host
	print(msg)
end
