--[[
    GD50
    Match-3 Remake

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    - GameOverState Class-

    State that simply shows us our score when we finally lose.
]]

GameOverState = Class{__includes = BaseState}

function GameOverState:init()

end

function GameOverState:enter(params)
    self.score = params.score
    self.message = params.message
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])

    love.graphics.setColor(56/255, 56/255, 56/255, 234/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 64, 36, 128, 144, 4)

    love.graphics.setColor(99/255, 155/255, 255/255, 255/255)
    love.graphics.printf('GAME OVER', VIRTUAL_WIDTH / 2 - 64, 40, 128, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Your Score: ' .. tostring(self.score), VIRTUAL_WIDTH / 2 - 64, 120, 128, 'center')
    love.graphics.printf('Press Enter', VIRTUAL_WIDTH / 2 - 64, 160, 128, 'center')

    love.graphics.setColor(56/255, 56/255, 56/255, 234/255)
    if self.message == 'Time is over!' then
        love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 64, 216, 128, 36, 4)

        love.graphics.setColor(99/255, 155/255, 255/255, 255/255)
        love.graphics.printf(self.message, VIRTUAL_WIDTH / 2 - 64, 227, 128, 'center')
    elseif self.message == 'No more matches possible!' then
        love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 128, 216, 256, 36, 4)

        love.graphics.setColor(99/255, 155/255, 255/255, 255/255)
        love.graphics.printf(self.message, VIRTUAL_WIDTH / 2 - 128, 227, 256, 'center')
    end
end