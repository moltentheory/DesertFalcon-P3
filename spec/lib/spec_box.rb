require 'spec_helper'
require 'box'

RSpec.describe Box do
	describe '#initialize' do
		it 'erros de entrada' do
			expect{ Box.new(1, 2, 3, 4, 5) }.not_to raise_error ArgumentError
			expect{ Box.new("a", 2, 3, 4, 5) }.to raise_error ArgumentError
			expect{ Box.new(1, "b", 3, 4, 5) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, "c", 4, 5) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, 3, "d", 5) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, 3, 4, "e") }.to raise_error ArgumentError
			expect{ Box.new("1", "2", "3", "4", "5") }.to raise_error ArgumentError

			expect{ Box.new(1, 2, 3, -4, 5) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, 3, 4, -5) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, 3, -4, -5) }.to raise_error ArgumentError
		end
	end
	describe '#intersects' do
		it 'erros de entrada' do
			expect{ Box.new(1, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) }.not_to raise_error ArgumentError
		end
		it 'erros de saida' do
			expect( Box.new(1, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)
			expect( Box.new(1, 2, 0, 4, 5).intersects(Box.new(1, 2, 99, 4, 5)) ).to eq(false)
		end
	end
end