require 'constants'

require 'sprite'
require 'box'
require 'gameobject'
require 'falcon'
require 'scoreboard'




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
