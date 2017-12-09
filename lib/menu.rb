require './constants'

require './sprite'
require './box'
require './gameobject'
require './falcon'
require './scoreboard'




# Tela de Menu principal
#----
class MainMenu < Gosu::Window


	def initialize
		super WINDOW_WIDTH, WINDOW_HEIGHT
		self.caption = "Desert Falcon 2.0 - MENU"

		@elapsed_time = Gosu::milliseconds/2

		@menu_bg = Gosu::Image.new("./Assets/Images/menu_bg.png", :tileable => true)
		@menu_shader = Gosu::Image.new("./Assets/Images/menu_shader.png", :tileable=> false)
		@menu_player  = Menu_Falcon.new
		@menu_player.warp(100, 380, 1)

		@menu_font = Gosu::Font.new(50, {name:"./Assets/Fonts/8bitlim.ttf"})

	end


	def mouse_check
		#jogar
		if (mouse_x>=158 and mouse_x<=322) and (mouse_y>=135 and mouse_y <=207)
			play
		end

		#placar
		if (mouse_x>=168 and mouse_x<=310) and (mouse_y>=216 and mouse_y <=259)
      close
      Scoreboard.new.show
		end

		#sair
		if (mouse_x>=198 and mouse_x<=281) and (mouse_y>=274 and mouse_y <=317)
			close
		end

	end


	def button_down(id)
		if id == Gosu::MsLeft
			mouse_check
    else
      super
		end
	end


	#showing cursor
	def needs_cursor?
		true
	end


	def update
		@elapsed_time = Gosu::milliseconds/2
	end


	def draw

		@menu_player.draw

		@menu_shader.draw(0, 0, 2)

		#background draw
		(WINDOW_WIDTH / @menu_bg.width + 2).times do |x|
			(WINDOW_HEIGHT / @menu_bg.height + 2).times do |y|
				@menu_bg.draw( x * @menu_bg.width - ((@elapsed_time/GAME_SPEED).round) % @menu_bg.width, (y-1) * @menu_bg.height + ((@elapsed_time/GAME_SPEED).round) % @menu_bg.height, 0)
			end
		end

		#menu draw
		#jogar
		#----
		@menu_font.draw_rel("JOGAR", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("JOGAR", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("JOGAR", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("JOGAR", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("JOGAR", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
		#----
		#placar
		#----
		@menu_font.draw_rel("PLACAR", 240, 242, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("PLACAR", 240, 238, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("PLACAR", 238, 240, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("PLACAR", 242, 240, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("PLACAR", 240, 240, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))
		#----
		#sair
		#----
		@menu_font.draw_rel("SAIR", 240, 300, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("SAIR", 240, 296, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("SAIR", 238, 298, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("SAIR", 242, 298, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
		@menu_font.draw_rel("SAIR", 240, 298, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))
		#----


	end


	def play
		close
		DesertFalconGame.new.show
	end

end
#----

#Tela de entrada das iniciais
#----
class HighScore < Gosu::Window

	def initialize (player_score=0)
		super WINDOW_WIDTH, WINDOW_HEIGHT
		self.caption = "Desert Falcon 2.0 - MENU"

		@elapsed_time = Gosu::milliseconds/2

		@menu_bg = Gosu::Image.new("./Assets/Images/menu_bg.png", :tileable => true)
		@menu_shader = Gosu::Image.new("./Assets/Images/menu_shader.png", :tileable=> false)
		@menu_player  = Menu_Falcon.new
		@menu_player.warp(100, 380, 1)

		@menu_font = Gosu::Font.new(50, {name:"./Assets/Fonts/8bitlim.ttf"})

		@player_name = "AAA"
		@player_name_position = 0
		@player_name_blink = 0

		@score = player_score

		test_file

	end


	def test_file

		if !File.exist?("scoreboard.txt")
			scoreboard_file = File.open("scoreboard.txt", "w+")
			scoreboard_file.puts("1. AAA -- 00002. AAA -- 00003. AAA -- 00004. AAA -- 00005. AAA -- 00006. AAA -- 00007. AAA -- 00008. AAA -- 00009. AAA -- 000010. AAA -- 0000")
			scoreboard_file.close
		end

	end


	#showing cursor
	def needs_cursor?
		true
	end


	def mouse_check
		if (mouse_x>=139 and mouse_x<=340) and (mouse_y>=409 and mouse_y <=451)
			save_score
			close
			MainMenu.new.show
		end
	end


	def increment
		char = @player_name[@player_name_position]
		char.next!
		@player_name[@player_name_position] = char
	end


	def decrement
		char = @player_name[@player_name_position]
		char = (char.ord-1).chr
		@player_name[@player_name_position] = char
	end


	def button_down(id)

		case id
		when Gosu::KB_LEFT, Gosu::GP_LEFT
			if(@player_name_position>0)
				@player_name_position -= 1
			end
		when Gosu::KB_RIGHT, Gosu::GP_RIGHT
			if(@player_name_position<2)
				@player_name_position += 1
			end
		when Gosu::KB_UP, Gosu::GP_BUTTON_0
			if(@player_name[@player_name_position]!='Z')
				increment
			end
		when Gosu::KB_DOWN, Gosu::GP_BUTTON_1
			if(@player_name[@player_name_position]!='A')
				decrement
			end
		when Gosu::MsLeft
			mouse_check
		else
			super
		end
	end

	def update
		@elapsed_time = Gosu::milliseconds/2
	end


	def draw

		@menu_player.draw

		@menu_shader.draw(0, 0, 2)

		#background draw
		(WINDOW_WIDTH / @menu_bg.width + 2).times do |x|
			(WINDOW_HEIGHT / @menu_bg.height + 2).times do |y|
				@menu_bg.draw( x * @menu_bg.width - ((@elapsed_time/GAME_SPEED).round) % @menu_bg.width, (y-1) * @menu_bg.height + ((@elapsed_time/GAME_SPEED).round) % @menu_bg.height, 0)
			end
		end


		case @player_name_position
		when 0
			if @player_name_blink<30
				#letra 1
				@menu_font.draw_rel("#{@player_name[0]}", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel("#{@player_name[1]}", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel("#{@player_name[2]}", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1

			elsif @player_name_blink <45
				#letra 1
				@menu_font.draw_rel(" ", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel("#{@player_name[1]}", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel("#{@player_name[2]}", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1
			else
				@player_name_blink = 0
			end

		when 1
			if @player_name_blink<30

				#letra 1
				@menu_font.draw_rel("#{@player_name[0]}", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel("#{@player_name[1]}", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel("#{@player_name[2]}", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1

			elsif @player_name_blink <45

				#letra 1
				@menu_font.draw_rel("#{@player_name[0]}", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel(" ", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel("#{@player_name[2]}", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1
			else
				@player_name_blink = 0
			end

		when 2
			if @player_name_blink<30

				#letra 1
				@menu_font.draw_rel("#{@player_name[0]}", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel("#{@player_name[1]}", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel("#{@player_name[2]}", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[2]}", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1

			elsif @player_name_blink <45

				#letra 1
				@menu_font.draw_rel("#{@player_name[0]}", 200, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 198, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 202, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[0]}", 200, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 2
				@menu_font.draw_rel("#{@player_name[1]}", 240, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 238, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 242, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel("#{@player_name[1]}", 240, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))
				#letra 3
				@menu_font.draw_rel(" ", 280, 172, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 280, 168, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 278, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 282, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,69,43,43))
				@menu_font.draw_rel(" ", 280, 170, 3, 0.5, 0.5, 1.5, 1.5, Gosu::Color.new(255,255,236,182))

				@player_name_blink+=1
			else
				@player_name_blink = 0
			end

		end

		@menu_font.draw_rel("CONFIRMAR", 240, 430, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("CONFIRMAR", 240, 434, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("CONFIRMAR", 238, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("CONFIRMAR", 242, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("CONFIRMAR", 240, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))

		@menu_font.draw_rel("#{@score}", 240, 52, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("#{@score}", 240, 48, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("#{@score}", 238, 50, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("#{@score}", 242, 50, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("#{@score}", 240, 50, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))

	end


	def save_score
		string = IO.read("scoreboard.txt")
		temp=""

		if @score < 10
			temp = "000" + @score.to_s
		elsif @score < 100
			temp = "00" + @score.to_s
		elsif @score < 1000
			temp = "0" + @score.to_s
		else temp = @score.to_s
		end


		if @score>string[10..13].to_i
			string[10..13] = temp
			string[3..5] = @player_name
			#posicao 1
		elsif @score>string[24..27].to_i
			string[24..27] = temp
			string[17..19] = @player_name
			#posicao 2
		elsif @score>string[38..41].to_i
			string[38..41] = temp
			string[31..33] = @player_name
			#posicao 3
		elsif @score>string[52..55].to_i
			string[52..55] = temp
			string[45..47] = @player_name
			#posicao 4
		elsif @score>string[66..69].to_i
			string[66..69] = temp
			string[59..61] = @player_name
			#posicao 5
		elsif @score>string[80..83].to_i
			string[80..83] = temp
			string[73..75] = @player_name
			#posicao 6
		elsif @score>string[94..97].to_i
			string[94..97] = temp
			string[87..89] = @player_name
			#posicao 7
		elsif @score>string[108..111].to_i
			string[108..111] = temp
			string[101..103] = @player_name
			#posicao 8
		elsif @score>string[122..125].to_i
			string[122..125] = temp
			string[115..117] = @player_name
			#posicao 9
		elsif @score>string[136..139].to_i
			string[136..139] = temp
			string[129..131] = @player_name
			#posicao 10
		end

		IO.write("scoreboard.txt", string, 0)

	end


end
