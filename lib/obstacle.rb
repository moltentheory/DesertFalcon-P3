require 'gosu'

require_relative 'constants'
require_relative 'box'
require_relative 'gameobject'

class Obstacle < GameObject
	def initialize
		test = Random.new.rand(0..1)
		coordX = if test==0 then Random.rand(0..WINDOW_WIDTH) else WINDOW_WIDTH+33 end
		coordY = if test==1 then Random.rand(0..WINDOW_HEIGHT) else -39 end
		test = Random.rand(0..1)

		if test == 0 #obstacle is a pyramid
			super(coordX, coordY, 1, 45, 96, "./Assets/Images/obelisk.png", 999, 0.0, false)
		elsif test == 1
			super(coordX, coordY, 1, 120, 90, "./Assets/Images/pyramid.png", 999, 0.0, false)
		end

	end
	def is_out_of_bounds
		return (@box.x < -@box.w/2 || @box.y > WINDOW_HEIGHT + @box.h/2)
	end
end