require 'gosu'
require_relative 'constants'
require_relative 'box'
require_relative 'gameobject'

class Hiero < GameObject
	def initialize
		test = Random.new.rand(0..1)
		coordX = if test==0 then Random.rand(0..WINDOW_WIDTH) else WINDOW_WIDTH+22 end
		coordY = if test==1 then Random.rand(0..WINDOW_HEIGHT) else -16 end

		super(coordX, coordY, 1, 22, 16, "./Assets/Images/hiero.png", 150, 0.0)
	end
	def is_out_of_bounds
		return (@box.x < -@box.w/2 || @box.y > WINDOW_HEIGHT + @box.h/2)
	end
end