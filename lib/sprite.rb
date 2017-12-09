require 'gosu'

require_relative 'constants'

class Sprite
	def initialize(file_name, width, height, animation_speed)
		raise ArgumentError, 'Erro de argumentos' unless (	
													(file_name.is_a? String) &&
													(width.is_a? Numeric) &&
													(height.is_a? Numeric) &&
													(animation_speed.is_a? Numeric) &&
													!file_name.to_s.strip.empty? &&
													width >= 0 &&
													height >= 0 &&
													animation_speed >= 0
												 )

		@speed, @width, @height = animation_speed, width, height
		@tileset = Gosu::Image.load_tiles(file_name, width, height)
	end

	def frame
		return @tileset[Gosu.milliseconds / @speed % @tileset.size]
	end
end
