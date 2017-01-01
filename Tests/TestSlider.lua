local buttonModule = require "Button"
local sliderModule = require "Slider"
local progressModule = require "Progressbar"

module (..., package.seeall)

local gutter = 20

simpleSlider = Slider:new()
simpleSlider.x = 10
simpleSlider.y = 10
function simpleSlider:updated(newPosition)
	simpleProgressBar:setPercentage(newPosition * 100)
end

simpleProgressBar = Progressbar:new()
simpleProgressBar:setX(simpleSlider.x + simpleSlider.width + gutter + 100)
simpleProgressBar:setY(simpleSlider.y + gutter)


coloredSlider = Slider:new()
coloredSlider.x = simpleSlider.x
coloredSlider.y = simpleSlider.y + simpleSlider.height + gutter
coloredSlider.activeColorRed = 233
coloredSlider.activeColorGreen = 188
coloredSlider.activeColorBlue = 13
coloredSlider.inactiveColorRed = 225
coloredSlider.inactiveColorGreen = 139
coloredSlider.inactiveColorBlue = 49
coloredSlider.markerColorRed = 223
coloredSlider.markerColorGreen = 14
coloredSlider.markerColorBlue = 33

function coloredSlider:updated(newPosition)
	coloredProgressBar:setPercentage(newPosition * 100)
end

coloredProgressBar = Progressbar:new()
coloredProgressBar:setX(coloredSlider.x + coloredSlider.width + gutter + 100)
coloredProgressBar:setY(coloredSlider.y + gutter)
coloredProgressBar:setBars(5)


backButton = Button:new()
backButton.text = 'backButton'
backButton.x = 10
backButton.y = 250
backButton.width = 150
backButton.height = 40
function backButton:clicked()
	showButtons()
end

nextButton = Button:new()
nextButton.text = 'nextButton = Quit'
nextButton.x = backButton.x
nextButton.y = backButton.y +  backButton.height + gutter
nextButton.width = backButton.width
nextButton.height = backButton.height
function nextButton:clicked()
	love.event.quit( )
end


function TestSlider.load(arg)
	simpleProgressBar:setImg(love.graphics.newImage('progressbar.png'))
	coloredProgressBar:setImg(love.graphics.newImage('progressbar.png'))
end


function TestSlider.draw()
	simpleSlider:draw()
	love.graphics.print(string.format('%1.4f', simpleSlider.position), simpleSlider.x + simpleSlider.width + gutter, simpleSlider.y + simpleSlider.height / 2)
	simpleProgressBar:draw()

	coloredSlider:draw()
	love.graphics.print(string.format('%1.4f', coloredSlider.position), coloredSlider.x + coloredSlider.width + gutter, coloredSlider.y + coloredSlider.height / 2)
	coloredProgressBar:draw()

	backButton:draw()
	nextButton:draw()
end


function TestSlider.update(dt)
	simpleSlider:update(dt)
	coloredSlider:update(dt)
	backButton:update(dt)
	nextButton:update(dt)
end

function TestSlider.mousepressed(x, y, button)
	simpleSlider:mousepressed(x, y, button)
	coloredSlider:mousepressed(x, y, button)
end

function TestSlider.mousereleased(x, y, button, istouch)
	simpleSlider:mousereleased(x, y, button, istouch)
	coloredSlider:mousereleased(x, y, button, istouch)
	backButton:mousereleased(x, y, button, istouch)
	nextButton:mousereleased(x, y, button, istouch)
end
