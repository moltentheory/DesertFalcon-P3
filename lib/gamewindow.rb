require 'gosu'

require_relative 'constants'
require_relative 'sprite'
require_relative 'box'
require_relative 'gameobject'
require_relative 'hiero'
require_relative 'falcon'
require_relative 'menu'
require_relative 'scoreboard'
require_relative 'enemy'
require_relative 'obstacle'
require_relative 'bullet'

class DesertFalconGame < Gosu::Window
	def initialize
		raise ArgumentError, 'Erro de argumentos' unless (Gosu::milliseconds.is_a? Numeric)

		super WINDOW_WIDTH, WINDOW_HEIGHT
		self.caption = "Desert Falcon 2.0"

		@elapsed_time = Gosu::milliseconds
		@pressed_up = false
		@pressed_down = false
		@pressed_space = false

		@background_image = Gosu::Image.new("./Assets/Images/desert_bg.png", :tileable => true)

		@hiero_scoreboard = Sprite.new("./Assets/Images/hiero_scoreboard.png", 44, 32, 150)
		@font_scoreboard = Gosu::Font.new(24, {name:"./Assets/Fonts/8bitlim.ttf"})

		@player = Falcon.new
		@player.warp(100, 380, 1)

		@hieros = []
		@enemies = []
		@obstacles = []
		@bullets = []

		@last_bullet_fired = Gosu::milliseconds
	end

	def button_up(id)
		raise ArgumentError, 'Erro de argumentos' unless (id.is_a? Numeric)

		case id
			when Gosu::KB_UP
				@pressed_up = true
				@pressed_down = false
			when Gosu::KB_DOWN
				@pressed_up = false
				@pressed_down = true
			#when Gosu::KB_SPACE
				#@pressed_space = true
		end
	end

	def update
		raise ArgumentError, 'Erro de argumentos' unless (
															(Gosu::milliseconds.is_a? Numeric) &&
															(@elapsed_time.is_a? Numeric) &&
															(@player.is_a? Falcon) &&
															(!!@pressed_up == @pressed_up) &&
															(!!@pressed_down == @pressed_down)
														)

		coord_update_nonplayer_object = Gosu::milliseconds/GAME_SPEED - @elapsed_time/GAME_SPEED
		coord_update_enemy_object = coord_update_nonplayer_object + Gosu::milliseconds/ENEMY_SPEED - @elapsed_time/ENEMY_SPEED

		@elapsed_time = Gosu::milliseconds

		if Gosu.button_down? Gosu::KB_A
			@player.accelerate_left
		end
		if Gosu.button_down? Gosu::KB_D
			@player.accelerate_right
		end
		if Gosu.button_down? Gosu::KB_W
			@player.accelerate_forward
		end
		if Gosu.button_down? Gosu::KB_S
			@player.accelerate_backward
		end
		if @pressed_up
			@player.move_up
			@pressed_up = false
		end
		if @pressed_down
			@player.move_down
			@pressed_down = false
		end
		#if @pressed_space
		if Gosu.button_down? Gosu::KB_SPACE
			if Gosu::milliseconds > @last_bullet_fired + BULLET_FIRE_INTERVAL
				@bullets.push @player.create_bullet
				@last_bullet_fired = Gosu::milliseconds
			end
			#@pressed_space = false
		end

		@player.move

		@bullets.each {|bullet| bullet.move }
		@bullets.delete_if do |bullet|
			bullet_killed_enemy = false
			@enemies.delete_if do |enemy|
				if bullet.box.intersects( enemy.box )
					bullet_killed_enemy = true
					@player.got_enemy
					true
				else
					false
				end
			end
			if bullet_killed_enemy || bullet.is_out_of_bounds
				true
			else
				false
			end
		end

		@hieros.each {|hiero| hiero.move(-coord_update_nonplayer_object, coord_update_nonplayer_object, 0) }
		@hieros.delete_if do |hiero|
			if hiero.box.intersects( @player.box )
				@player.got_hiero
				true
			elsif hiero.is_out_of_bounds
				true
			else
				false
			end
		end
		if @hieros.length < 3
			new_obj = Hiero.new
			while (
				@hieros.any?{|hiero| new_obj.box.intersects(hiero.box)} ||
				@enemies.any?{|enemy| new_obj.box.intersects(enemy.box)} ||
				@obstacles.any?{|obstacle| new_obj.box.intersects(obstacle.box)} 
				) do
				new_obj = Hiero.new
			end
			@hieros.push new_obj
		end


		@obstacles.each{|obstacle| obstacle.move(-coord_update_nonplayer_object, coord_update_nonplayer_object, 0)}
		@obstacles.delete_if do |obstacle|
			if obstacle.is_out_of_bounds
				true
			else
				false
			end
		end
		if @obstacles.length < 2
			new_obj = Obstacle.new
			while (
				@hieros.any?{|hiero| new_obj.box.intersects(hiero.box)} ||
				@enemies.any?{|enemy| new_obj.box.intersects(enemy.box)} ||
				@obstacles.any?{|obstacle| new_obj.box.intersects(obstacle.box)} 
				) do
				new_obj = Obstacle.new
			end
			@obstacles.push new_obj
		end


		@enemies.each{|enemy| enemy.move(-coord_update_enemy_object, coord_update_enemy_object, 0) }
		@enemies.delete_if do |enemy|
			if enemy.is_out_of_bounds
				true
			else
				false
			end
		end
		if @enemies.length < 3
			new_obj = Enemy.new
			while (
				@hieros.any?{|hiero| new_obj.box.intersects(hiero.box)} ||
				@enemies.any?{|enemy| new_obj.box.intersects(enemy.box)} ||
				@obstacles.any?{|obstacle| new_obj.box.intersects(obstacle.box)} 
				) do
				new_obj = Enemy.new
			end
			@enemies.push new_obj
		end

		(@enemies + @obstacles).delete_if do |obj|
			if obj.box.intersects( @player.box )
				on_death
				true
			end
		end
		

	end

	def draw
		raise ArgumentError, 'Erro de argumentos' unless (
															(Gosu::milliseconds.is_a? Numeric) &&
															(@elapsed_time.is_a? Numeric) &&
															(@player.is_a? Falcon) &&
															(@background_image.is_a? Gosu::Image) &&
															(@hiero_scoreboard .is_a? Sprite) &&
															(@font_scoreboard.is_a? Gosu::Font)
														)

		(WINDOW_WIDTH / @background_image.width + 2).times do |x|
			(WINDOW_HEIGHT / @background_image.height + 2).times do |y|
				@background_image.draw( x * @background_image.width - ((@elapsed_time/GAME_SPEED).round) % @background_image.width, (y-1) * @background_image.height + ((@elapsed_time/GAME_SPEED).round) % @background_image.height, 0)
			end
		end

		@player.draw

		(@bullets+@hieros+@enemies+@obstacles).each {|obj| obj.draw }

		#@hieros.each {|hiero| hiero.draw }

		#@enemies.each{|enemy| enemy.draw }

		#@obstacles.each{|obstacle| obstacle.draw }

		@hiero_scoreboard.frame.draw_rot( WINDOW_WIDTH - 32, 26, 2, 0.0)
		@font_scoreboard.draw_rel("#{@player.score} X", WINDOW_WIDTH - 70, 28, 2, 1, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@font_scoreboard.draw_rel("#{@player.score} X", WINDOW_WIDTH - 70, 24, 2, 1, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@font_scoreboard.draw_rel("#{@player.score} X", WINDOW_WIDTH - 72, 26, 2, 1, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@font_scoreboard.draw_rel("#{@player.score} X", WINDOW_WIDTH - 68, 26, 2, 1, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))

		@font_scoreboard.draw_rel("#{@player.score} X", WINDOW_WIDTH - 70, 26, 2, 1, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))
	end

	def on_death
		raise ArgumentError, 'Erro de argumentos' unless (@player.score.is_a? Numeric)
		close
		HighScore.new(@player.score).show
	end

	def button_down(id)
		raise ArgumentError, 'Erro de argumentos' unless (id.is_a? Numeric)

		if id == Gosu::KB_ESCAPE
			on_death
		else
			super
		end
	end

end