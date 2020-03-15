
PowerUp = Class{}


powerUpTypes = {
    ['NA1'] = 1,
    ['NA2'] = 2,
    ['NA3'] = 3,
    ['NA4'] = 4,
    ['NA5'] = 5,
    ['NA6'] = 6,
    ['doubleBall'] = 7,
    ['NA8'] = 8,
    ['NA9'] = 9,
    ['unlock'] = 10
}

function PowerUp:init(typeNum, x, y)
    self.x = x
    self.y = y

    self.width = POWERUP_WIDTH
    self.height = POWERUP_HEIGHT

    self.dx = 0
    self.dy = 20
    
    self.type = typeNum

    -- used to determine whether this brick should be rendered
    self.inPlay = true
end


function PowerUp:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if(self.y > VIRTUAL_HEIGHT) then
        self.inPlay = false
    end
    if(self.x > VIRTUAL_WIDTH) then
        self.inPlay = false
    end
    if(self.x < 0) then
        self.inPlay = false
    end

end


function PowerUp:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end


function PowerUp:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], 
            gFrames['powerup'][self.type],
            self.x, self.y)
    end
end