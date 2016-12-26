local modules = require "Button"

module (..., package.seeall)

local gutter = 20

simpleButton = Button:new {}
simpleButton.text = 'simpleButton'
simpleButton.x = 10
simpleButton.y = 10
simpleButton.width = 150
simpleButton.height = 40
simpleButton.activated = false;
function simpleButton:clicked()
	simpleButton.activated = true;
end


redButton = Button:new {}
redButton.text = 'redButton'
redButton.x = simpleButton.x
redButton.y = simpleButton.y + simpleButton.height + gutter
redButton.width = 150
redButton.height = 40
redButton.backgroundColorRed = 255
redButton.backgroundColorGreen = 0
redButton.backgroundColorBlue = 0
redButton.activated = false;
function redButton:clicked()
	redButton.activated = true;
end


drawBorderButton = Button:new {}
drawBorderButton.text = 'drawBorderButton'
drawBorderButton.x = redButton.x
drawBorderButton.y = redButton.y + redButton.height + gutter
drawBorderButton.width = 150
drawBorderButton.height = 40
drawBorderButton.backgroundColorRed = 0
drawBorderButton.backgroundColorGreen = 0
drawBorderButton.backgroundColorBlue = 0
drawBorderButton.drawBorder = true
drawBorderButton.activated = false;
function drawBorderButton:clicked()
	drawBorderButton.activated = true;
end


backgroundButton = Button:new {}
backgroundButton.text = 'backgroundButton'
backgroundButton.x = drawBorderButton.x
backgroundButton.y = drawBorderButton.y + drawBorderButton.height + gutter
backgroundButton.width = 150
backgroundButton.height = 40
backgroundButton.activated = false;
function backgroundButton:clicked()
	backgroundButton.activated = true;
end


wideButton = Button:new {}
wideButton.text = 'wideButton'
wideButton.x = backgroundButton.x
wideButton.y = backgroundButton.y + backgroundButton.height + gutter
wideButton.width = 250
wideButton.height = 40
wideButton.activated = false;
function wideButton:clicked()
	wideButton.activated = true;
end


tallButton = Button:new {}
tallButton.text = 'tallButton'
tallButton.x = wideButton.x
tallButton.y = wideButton.y + wideButton.height + gutter
tallButton.width = 150
tallButton.height = 80
tallButton.activated = false;
function tallButton:clicked()
	tallButton.activated = true;
end


resetButton = Button:new {}
resetButton.text = 'resetButton'
resetButton.x = tallButton.x
resetButton.y = tallButton.y + tallButton.height + gutter
resetButton.width = 150
resetButton.height = 40
function resetButton:clicked()
	simpleButton.activated = false
	redButton.activated = false
	drawBorderButton.activated = false
	backgroundButton.activated = false
	wideButton.activated = false
	tallButton.activated = false
end


nextButton = Button:new {}
nextButton.text = 'Next Test'
nextButton.x = resetButton.x
nextButton.y = resetButton.y + resetButton.height + gutter
nextButton.width = 150
nextButton.height = 40
function nextButton:clicked()
	showSlider()
end

greentick = { img = nil }


function TestButton.load(arg)
	greentick.img = love.graphics.newImage( 'greentick.png' )
	backgroundButton.backgroundImg = love.graphics.newImage( 'background.png' )
end


function TestButton.draw()
	simpleButton:draw();
	if simpleButton.activated then
		love.graphics.draw( greentick.img, simpleButton.x + simpleButton.width + gutter, simpleButton.y )
	end

	redButton:draw();
	if redButton.activated then
		love.graphics.draw( greentick.img, redButton.x + redButton.width + gutter, redButton.y )
	end

	drawBorderButton:draw();
	if drawBorderButton.activated then
		love.graphics.draw( greentick.img, drawBorderButton.x + drawBorderButton.width + gutter, drawBorderButton.y )
	end

	backgroundButton:draw();
	if backgroundButton.activated then
		love.graphics.draw( greentick.img, backgroundButton.x + backgroundButton.width + gutter, backgroundButton.y )
	end

	wideButton:draw();
	if wideButton.activated then
		love.graphics.draw( greentick.img, wideButton.x + wideButton.width + gutter, wideButton.y )
	end

	tallButton:draw();
	if tallButton.activated then
		love.graphics.draw( greentick.img, tallButton.x + tallButton.width + gutter, tallButton.y )
	end

	resetButton:draw();
	nextButton:draw();
end


function TestButton.update(dt)
	simpleButton:update(dt)
	redButton:update(dt)
	drawBorderButton:update(dt)
	backgroundButton:update(dt)
	wideButton:update(dt)
	tallButton:update(dt)
	resetButton:update(dt)
	nextButton:update(dt)
end


function TestButton.mousereleased(x, y, button, istouch)
	simpleButton:mousereleased(x, y, button, istouch)
	redButton:mousereleased(x, y, button, istouch)
	drawBorderButton:mousereleased(x, y, button, istouch)
	backgroundButton:mousereleased(x, y, button, istouch)
	wideButton:mousereleased(x, y, button, istouch)
	tallButton:mousereleased(x, y, button, istouch)
	resetButton:mousereleased(x, y, button, istouch)
	nextButton:mousereleased(x, y, button, istouch)
end
