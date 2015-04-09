bump = require 'bump'

nadador={ x = 20, y = 500, w = 32, h = 37, speed = 120 }
tubarao={ x = 20, y = 40, w = 55, h = 65, speed = 120 }
paredeE = {x=799, y=0, w=5, h=600} 
paredeD = {x=-4, y=0, w=5, h=600} 

function love.load()
    world = bump.newWorld()
    world:add(nadador, nadador.x, nadador.y, nadador.w, nadador.h)
    world:add(tubarao, tubarao.x, tubarao.y, tubarao.w, tubarao.h)
    world:add(paredeE, paredeE.x, paredeE.y, paredeE.w, paredeE.h)
    world:add(paredeD, paredeD.x, paredeD.y, paredeD.w, paredeD.h)
    filipe = love.graphics.newImage("filipe.png")
    Inimigo = love.graphics.newImage("inimigo.png")
    
end

function love.draw()
    love.graphics.setBackgroundColor(120,255,230)
    love.graphics.draw(filipe, nadador.x, nadador.y)
    love.graphics.draw(Inimigo, tubarao.x, tubarao.y)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", paredeE.x, paredeE.y, paredeE.w, paredeE.h)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", paredeD.x, paredeD.y, paredeD.w, paredeD.h)
end

function love.update(dt)
  local speed = nadador.speed
  
  local dxNadador, dyNadador = 0, 0
  local dxTubarao, dyTubarao = 0, 0
  if love.keyboard.isDown('right') then
    dxNadador = speed * dt
  elseif love.keyboard.isDown('left') then
    dxNadador = -speed * dt
  end
  if love.keyboard.isDown('down') then
    dyNadador = speed * dt
  elseif love.keyboard.isDown('up') then
    dyNadador = -speed * dt
  end
  
  
  if love.keyboard.isDown('d') then
    dxTubarao = speed * dt
  elseif love.keyboard.isDown('a') then
    dxTubarao = -speed * dt
  end
  if love.keyboard.isDown('s') then
    dyTubarao = speed * dt
  elseif love.keyboard.isDown('w') then
    dyTubarao = -speed * dt
  end

  if dxNadador ~= 0 or dyNadador ~= 0 then
    local cols
    nadador.x, nadador.y, cols, cols_len = world:move(nadador, nadador.x + dxNadador, nadador.y + dyNadador)
  end
  if dxTubarao ~= 0 or dyTubarao ~= 0 then
    local cols
    tubarao.x, tubarao.y, cols, cols_len = world:move(tubarao, tubarao.x + dxTubarao, tubarao.y + dyTubarao)
  end
  
end
