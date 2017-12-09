require 'gosu'
require 'constants'
require 'box'
require 'gameobject'
require 'bullet'

class Falcon < GameObject
	attr_accessor :score

	def initialize
		super(0,0,1,31,22,"./Assets/Images/falcon.png", 150, 45.0)
		@vel_x = @vel_y = 0.0
		@score = 0
	end

	def got_hiero
		@score += 5
	end

	def got_enemy
		@score += 1
	end

	def accelerate_forward
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
	end

	def accelerate_backward
		@vel_x += Gosu.offset_x(@angle, -0.5)
		@vel_y += Gosu.offset_y(@angle, -0.5)
	end

	def accelerate_right
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, -0.5)
		@draw_angle = @draw_angle*0.90 + 120.0*0.10
	end

	def accelerate_left
		@vel_x += Gosu.offset_x(@angle, -0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
		@draw_angle = @draw_angle*0.90 - 30.0*0.10
	end

	def move_up
		if @box.z < 3
			@box.y -= SHADOW_DISTANCE_PER_ZLEVEL
			@box.z += 1;
		end
	end	
	def move_down
		if @box.z > 1
			@box.y += SHADOW_DISTANCE_PER_ZLEVEL
			@box.z -= 1;
		end
	end

	def create_bullet

		return Bullet.new(@box.x, @box.y, @box.z, @vel_x+Gosu.offset_x(45.0, BULLET_SPEED), @vel_y+Gosu.offset_x(45.0, -BULLET_SPEED), @draw_angle);
		#return Bullet.new(@box.x, @box.y, @box.z, BULLET_SPEED+( @vel_x>0 ? @vel_x : @vel_x/2 ), ( @vel_y<0 ? @vel_y : @vel_y/2 )-BULLET_SPEED, @draw_angle);
	end

	def move
		@box.x += @vel_x
		@box.y += @vel_y

		if @box.x < @box.w/2
			@box.x = @box.w/2
			@vel_x = 0
		elsif(@box.x > WINDOW_WIDTH-@box.w/2)
			@box.x = WINDOW_WIDTH-@box.w/2
			@vel_x = 0
		end

		if @box.y < @box.h/2
			@box.y = @box.h/2
			@vel_y = 0
		elsif(@box.y > WINDOW_HEIGHT-@box.h/2)
			@box.y = WINDOW_HEIGHT-@box.h/2
			@vel_y = 0
		end

		@vel_x *= 0.90
		@vel_y *= 0.90
		@draw_angle = @draw_angle*0.90 + 45.0*0.10
	end
end

class Menu_Falcon < GameObject

	def initialize
		super(0,0,1,31,22,"./Assets/Images/menu_falcon.png", 200, 45.0)
	end

end
