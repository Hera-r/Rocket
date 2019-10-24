io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0 
Lander.y = 0 
Lander.engineOn = false
Lander.angle = 271
Lander.vx = 0
Lander.vy = 0 
Lander.speed = 1
Lander.img = love.graphics.newImage("images/ship.png")
Lander.imgEngine = love.graphics.newImage("images/engine.png")

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  Lander.x = largeur/2
  Lander.y = hauteur/2  
end

function love.update(dt)
--Lander.vy = Lander.vy + (0.6 * dt)
 Lander.engineOn= false

if love.keyboard.isDown("up") then
  Lander.engineOn = true
   local angle_radian = math.rad(Lander.angle)
   local force_x = math.cos(angle_radian) * (Lander.speed * dt)
    local force_y = math.sin(angle_radian) * (Lander.speed * dt)
    Lander.vx = Lander.vx + force_x
    Lander.vy = Lander.vy + force_y 
    if Lander.vy < -2 then Lander.vy = -2  end
    if Lander.vy > 2 then Lander.vy = 2  end


end

if love.keyboard.isDown("right") then
    Lander.angle = Lander.angle + 90 * dt
    --Lander.vx = Lander.vx + (0.6 * dt)
    if Lander.angle > 360 then Lander.angle = 0 end
end

if love.keyboard.isDown("left") then
  Lander.angle = Lander.angle - 90 * dt 
  --Lander.vx = Lander.vx - (0.6 * dt)
  if Lander.angle < 0 then Lander.angle = 360 end
  
end

Lander.x = Lander.x + Lander.vx
Lander.y = Lander.y + Lander.vy -- incrementatio vertical 
end

function love.draw()
  
  love.graphics.draw(Lander.img,Lander.x, Lander.y,math.rad(Lander.angle), 1, 1, Lander.img:getWidth()/2, Lander.img:getHeight()/2)
  
  if Lander.engineOn == true then
 love.graphics.draw(Lander.imgEngine, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1,     Lander.imgEngine:getWidth()/2, Lander.imgEngine:getHeight()/2) 
end

local debuG = "anlge"
affiche = debuG.."="..tostring(Lander.angle).."vy="..tostring(Lander.vy)
love.graphics.print(affiche,0,0)

end