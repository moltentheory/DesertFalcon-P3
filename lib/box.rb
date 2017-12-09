require 'gosu'
require 'constants'

class Box
	attr_accessor :x, :y, :z, :w, :h
	@x = @y = @z = @w = @h = 0

	def initialize(x, y, z, w, h)
		raise ArgumentError, 'Erro de argumentos' unless (	
															(x.is_a? Numeric) &&
															(y.is_a? Numeric) &&
															(z.is_a? Numeric) &&
															(w.is_a? Numeric) &&
															(h.is_a? Numeric) &&
															w >= 0 &&
															h >= 0
														 )
		@x, @y, @z, @w, @h = x, y, z, w, h
	end

	def intersects(box)
		if(@z == box.z || (@z == 0 && box.z == 1) || (@z == 1 && box.z == 0) )
			return (((@x - box.x).abs * 2 < (@w + box.w)) && ((@y - box.y).abs * 2 < (@h + box.h)));
		else 
			return false
		end
	end
end
