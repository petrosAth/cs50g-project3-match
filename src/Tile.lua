--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety, shiny)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.shiny = shiny
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    -- draw shiny
    if self.shiny > 0 then
        love.graphics.setColor(1, 1, 1, 0.25)
        
        -- horizontal rectangles
        if self.shiny ~= 2 then
            for i = 0, 3 do
                love.graphics.rectangle('fill', (self.gridX - 1) * 32 + (VIRTUAL_WIDTH - 272),
                    (self.gridY - 1) * 32 + 23 + i * 5, 32, 3, 3)
            end
        end

        -- vertical rectangles
        if self.shiny ~= 1 then
            for i = 0, 3 do
                love.graphics.rectangle('fill', (self.gridX - 1) * 32 + (VIRTUAL_WIDTH - 272) + 7 + i * 5,
                    (self.gridY - 1) * 32 + 16, 3, 32, 3)
            end
        end
    end
end