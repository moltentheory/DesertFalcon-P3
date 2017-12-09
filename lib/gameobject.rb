require 'gosu'
require_relative 'constants'
require_relative 'box'
require_relative 'sprite'

class GameObject
	attr_accessor :box
	
	def initialize(x=0, y=0, z=1, width=31, height=22, file_name="./Assets/Images/falcon.png", animation_speed=100, angle=45.0, has_shadow=true)
		@angle = @draw_angle = angle
		@sprite = Sprite.new(file_name, width, height, animation_speed)
		@box = Box.new(x, y, z, width, height)
		@has_shadow = has_shadow
	end

	def warp(x, y, z)
		@box.x = x
		@box.y = y
		@box.z = z
	end

	def move(x, y, z)
		@box.x += x
		@box.y += y
		@box.z += z
	end
	
	def draw
		
		if @has_shadow
			@sprite.frame.draw_rot( @box.x, @box.y+@box.z*SHADOW_DISTANCE_PER_ZLEVEL, @box.z, @draw_angle, 0.5, 0.5, 0.8*(1-@box.z.to_f/10), 0.5*(1-@box.z.to_f/10), Gosu::Color.new(96,0,0,0))
		end
		@sprite.frame.draw_rot( @box.x, @box.y, @box.z, @draw_angle, 0.5, 0.5, (1+@box.z.to_f/10), (1+@box.z.to_f/10))
	end
end