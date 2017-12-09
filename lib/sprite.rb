require 'gosu'

require_relative 'constants'

class Sprite
	def initialize(file_name, width, height, animation_speed)
		@speed, @width, @height = animation_speed, width, height
		@tileset = Gosu::Image.load_tiles(file_name, width, height)
	end

	def frame
		return @tileset[Gosu.milliseconds / @speed % @tileset.size]
	end
end
