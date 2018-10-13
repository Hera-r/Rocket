local largeur 
local hauteur

function love.load()
  img = love.graphics.newImage("Images/personnage.png")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  print("la largeur est : ", largeur)
  print("la Hauteur est : ", hauteur)
  print(img:getWidth())
  print(img:getHeight())
end
function love.draw()
love.graphics.draw(img,040 , 30)
end