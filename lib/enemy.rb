require 'gosu'
require 'constants'
require 'box'
require 'gameobject'

class Enemy < GameObject
	def initialize
		test = Random.new.rand(0..1)
		coordX = if test==0 then Random.rand(0..WINDOW_WIDTH) else WINDOW_WIDTH+33 end
		coordY = if test==1 then Random.rand(0..WINDOW_HEIGHT) else -39 end
		coordZ = Random.rand(1..3)

		super(coordX, coordY, coordZ, 33, 39, "./Assets/Images/enemy_1_speed.png", 999, -135.0)
	end
	def is_out_of_bounds
		return (@box.x < -@box.w/2 || @box.y > WINDOW_HEIGHT + @box.h/2)
	end
end