require 'gosu'

require_relative 'constants'
require_relative 'sprite'
require_relative 'box'
require_relative 'gameobject'
require_relative 'falcon'

#Placar
#----
class Scoreboard < Gosu::Window


  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = "Desert Falcon 2.0 - PLACAR"

    @elapsed_time = Gosu::milliseconds/2

		@menu_bg = Gosu::Image.new("./Assets/Images/menu_bg.png", :tileable => true)
		@menu_shader = Gosu::Image.new("./Assets/Images/menu_shader.png", :tileable=> false)
		@menu_player  = Menu_Falcon.new
		@menu_player.warp(100, 380, 1)

		@menu_font = Gosu::Font.new(32, {name:"./Assets/Fonts/8bitlim.ttf"})

    test_file

	end


  def mouse_check
    if (mouse_x>=17 and mouse_x<=112) and (mouse_y>=416 and mouse_y <=442)
			close
      MainMenu.new.show
		end
end

  def test_file

    if !File.exist?("scoreboard.txt")
      scoreboard_file = File.open("scoreboard.txt", "w+")
      scoreboard_file.puts("1. AAA -- 00002. AAA -- 00003. AAA -- 00004. AAA -- 00005. AAA -- 00006. AAA -- 00007. AAA -- 00008. AAA -- 00009. AAA -- 000010. AAA -- 0000")
      scoreboard_file.close
    end

  end


  def needs_cursor?
  		true
  end


  def update
    @elapsed_time = Gosu::milliseconds
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

    #scoreboard draw
    file_offset = 0
    score_y_offset = 36
    line_size = 14
    counter = 1
    10.times do |scores|
      @menu_font.draw_rel(IO.read("scoreboard.txt", line_size, file_offset), 240, score_y_offset-2, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
      @menu_font.draw_rel(IO.read("scoreboard.txt", line_size, file_offset), 240, score_y_offset+2, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
      @menu_font.draw_rel(IO.read("scoreboard.txt", line_size, file_offset), 238, score_y_offset, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
      @menu_font.draw_rel(IO.read("scoreboard.txt", line_size, file_offset), 242, score_y_offset, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
      @menu_font.draw_rel(IO.read("scoreboard.txt", line_size, file_offset), 240, score_y_offset, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))
      file_offset += line_size
      score_y_offset += 44
      counter += 1
      if counter == 10
        line_size += 1
      end
    end

    @menu_font.draw_rel("VOLTAR", 65, 430, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("VOLTAR", 65, 434, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("VOLTAR", 63, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("VOLTAR", 67, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,69,43,43))
    @menu_font.draw_rel("VOLTAR", 65, 432, 3, 0.5, 0.5, 1.0, 1.0, Gosu::Color.new(255,255,236,182))

	end


  def button_down(id)
    case id
    when Gosu::KB_ESCAPE
      close
      MainMenu.new.show
    when Gosu::MsLeft
      mouse_check
    else
      super
    end
  end

end
