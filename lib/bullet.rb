require 'gosu'
require_relative 'constants'
require_relative 'box'
require_relative 'gameobject'

class Bullet < GameObject
	def initialize(x, y, z, vel_x, vel_y, angle)
		raise ArgumentError, 'Erro de argumentos' unless (
															(x.is_a? Numeric) &&
															(y.is_a? Numeric) &&
															(z.is_a? Numeric) &&
															(vel_x.is_a? Numeric) &&
															(vel_y.is_a? Numeric) &&
															(angle.is_a? Numeric) &&0
														 )
		super(x, y, z, 4, 11, "./Assets/Images/bullet.png", 999, angle)
		@vel_x, @vel_y = vel_x, vel_y
	end
	def move
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@box.x.is_a? Numeric) &&
			(@box.y.is_a? Numeric)
		)
		@box.x += @vel_x
		@box.y += @vel_y
	end
	def is_out_of_bounds
		raise ArgumentError, 'Erro de argumentos' unless(
			(@box.x.is_a? Numeric) &&
			(@box.y.is_a? Numeric) &&
			(@box.w.is_a? Numeric) &&
			(@box.h.is_a? Numeric)
		)
		return (@box.x > WINDOW_WIDTH + @box.w/2 || @box.y < -@box.h/2)
	end
end
