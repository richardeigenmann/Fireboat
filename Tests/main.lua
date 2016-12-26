local modules = require "TestButton"
local modules2 = require "TestSlider"

testButtons = false
testSlider = false

function showButtons()
	testButtons = true
	testSlider = false
end

function showSlider()
	testButtons = false
	testSlider = true
end

function love.load(arg)
	TestButton.load(arg)
	showButtons()
end

function love.draw()
	if testButtons then
		TestButton.draw()
	elseif testSlider then
		TestSlider.draw()
	end
end

function love.update(dt)
	if testButtons then
		TestButton.update(dt)
	elseif testSlider then
		TestSlider.update(dt)
	end
end

function love.mousereleased(x, y, button, istouch)
	if testButtons then
		TestButton.mousereleased(x, y, button, istouch)
	elseif testSlider then
		TestSlider.mousereleased(x, y, button, istouch)
	end
end
