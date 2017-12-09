require 'spec_helper'
require 'sprite'

RSpec.describe Sprite do
	describe '#initialize' do
		it 'erros de entrada' do
			expect{ Sprite.new("./Assets/Images/falcon.png", 32, 22, 100) }.not_to raise_error ArgumentError
			expect{ Sprite.new("", 32, 22, 100) }.to raise_error
			expect{ Sprite.new(999, 32, 22, 100) }.to raise_error
			expect{ Sprite.new("./Assets/Images/falcon.png", -1, 22, 100) }.to raise_error ArgumentError
			expect{ Sprite.new("./Assets/Images/falcon.png", 32, -1, 100) }.to raise_error ArgumentError
			expect{ Sprite.new("./Assets/Images/falcon.png", 32, 22, -1) }.to raise_error ArgumentError
			expect{ Sprite.new("./Assets/Images/falcon.png", -1, -1, -1) }.to raise_error ArgumentError
			expect{ Sprite.new(-1, -1, -1, -1) }.to raise_error
		end
	end
end