Progressbar = {img = nil, timeToLive = 5, percentComplete = 0, bars = 10, gutter = 7,
    x = 0, y = 0, width = 200, height = 40, boxHeight = 10,
    horizontalMargin = 10, verticalMargin = 10}

function Progressbar:new()
   local newObj = {}
   self.__index = self
   setmetatable(newObj, self)
   return newObj
end

function Progressbar:draw()
    --Progressbar.x = love.graphics:getWidth()/2 - Progressbar.img:getWidth()/2
    --Progressbar.y = love.graphics:getHeight()/2 - Progressbar.img:getHeight()/2
    --Progresbar.horizontalMargin = 88
    --Progresbar.verticalMargin = 83

	love.graphics.draw(self.img, self.x, self.y)
	ox = self.x + self.horizontalMargin
	oy = self.y + self.verticalMargin
    --Progressbar.width = Progressbar.img:getWidth()
    --Progressbar.height = Progressbar.img:getHeight()
	--width = Progressbar.img:getWidth() - 2 * 88
	--height = Progressbar.img:getHeight() - 2 * 83
    --Progressbar.boxHeight = 177
    width = self.width - 2 * self.horizontalMargin
    height = self.height - 2 * self.verticalMargin
	boxWidth = (width - (self.bars - 1) * self.gutter) / self.bars
	for i = 0, self.bars - 1 do
		if i / (self.bars - 1) <= self.percentComplete / 100 then
			love.graphics.setColor(117, 231, 0, 255)
		else
			love.graphics.setColor(93, 27, 27, 255)
		end
		love.graphics.rectangle("fill", ox + i * (boxWidth + self.gutter), oy, boxWidth, self.boxHeight)
	end
end

function Progressbar:setX(x)
  self.x = x
end

function Progressbar:setY(y)
  self.y = y
end

function Progressbar:setWidth(width)
  self.width = width
end

function Progressbar:setHeight(height)
  self.height = height
end

function Progressbar:setBars(bars)
  self.bars = bars
end

function Progressbar:setImg(newImage)
  self.img = newImage
end

function Progressbar:getPercentage()
  return self.percentComplete
end

function Progressbar:setPercentage(newValue)
  self.percentComplete = newValue
end

function Progressbar:getTimeToLive()
  return self.timeToLive
end
