require 'gosu'
require_relative 'constants'
require_relative 'box'
require_relative 'gameobject'
require_relative 'bullet'

class Falcon < GameObject
	attr_accessor :score

	def initialize
		super(0,0,1,31,22,"./Assets/Images/falcon.png", 150, 45.0)
		@vel_x = @vel_y = 0.0
		@score = 0
	end

	def got_hiero
		raise ArgumentError, 'Erro de argumentos' unless (
			(@score.is_a? Numeric)
		)
		@score += 5
	end

	def got_enemy
		raise ArgumentError, 'Erro de argumentos' unless (
			(@score.is_a? Numeric)
		)
		@score += 1
	end

	def accelerate_forward
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@angle.is_a? Numeric)
		)
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
	end

	def accelerate_backward
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@angle.is_a? Numeric)
		)
		@vel_x += Gosu.offset_x(@angle, -0.5)
		@vel_y += Gosu.offset_y(@angle, -0.5)
	end

	def accelerate_right
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@angle.is_a? Numeric) &&
			(@draw_angle.is_a? Numeric)
		)
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, -0.5)
		@draw_angle = @draw_angle*0.90 + 120.0*0.10
	end

	def accelerate_left
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@angle.is_a? Numeric) &&
			(@draw_angle.is_a? Numeric)
		)
		@vel_x += Gosu.offset_x(@angle, -0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
		@draw_angle = @draw_angle*0.90 - 30.0*0.10
	end

	def move_up
		raise ArgumentError, 'Erro de argumentos' unless (
			(@box.y.is_a? Numeric) &&
			(@box.z.is_a? Numeric) &&
			@box.z <= 3 &&
			@box.z >= 1

		)
		if @box.z < 3
			@box.y -= SHADOW_DISTANCE_PER_ZLEVEL
			@box.z += 1;
		end
	end
	def move_down
		raise ArgumentError, 'Erro de argumentos' unless (
			(@box.y.is_a? Numeric) &&
			(@box.z.is_a? Numeric) &&
			@box.z <= 3 &&
			@box.z >= 1
		)
		if @box.z > 1
			@box.y += SHADOW_DISTANCE_PER_ZLEVEL
			@box.z -= 1;
		end
	end

	def create_bullet
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@draw_angle.is_a? Numeric) &&
			(@box.x.is_a? Numeric) &&
			(@box.y.is_a? Numeric) &&
			(@box.z.is_a? Numeric)
		)
		return Bullet.new(@box.x, @box.y, @box.z, @vel_x+Gosu.offset_x(45.0, BULLET_SPEED), @vel_y+Gosu.offset_x(45.0, -BULLET_SPEED), @draw_angle);
		#return Bullet.new(@box.x, @box.y, @box.z, BULLET_SPEED+( @vel_x>0 ? @vel_x : @vel_x/2 ), ( @vel_y<0 ? @vel_y : @vel_y/2 )-BULLET_SPEED, @draw_angle);
	end

	def move
		raise ArgumentError, 'Erro de argumentos' unless (
			(@vel_x.is_a? Numeric) &&
			(@vel_y.is_a? Numeric) &&
			(@draw_angle.is_a? Numeric) &&
			(@box.x.is_a? Numeric) &&
			(@box.y.is_a? Numeric) &&
			(@box.w.is_a? Numeric) &&
			(@box.h.is_a? Numeric)
		)

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
