require 'gosu'
require_relative 'constants'
require_relative 'box'
require_relative 'gameobject'

class Bullet < GameObject
	def initialize(x, y, z, vel_x, vel_y, angle) 
		super(x, y, z, 4, 11, "./Assets/Images/bullet.png", 999, angle)
		@vel_x, @vel_y = vel_x, vel_y
	end
	def move
		@box.x += @vel_x
		@box.y += @vel_y
	end
	def is_out_of_bounds
		return (@box.x > WINDOW_WIDTH + @box.w/2 || @box.y < -@box.h/2)
	end
end