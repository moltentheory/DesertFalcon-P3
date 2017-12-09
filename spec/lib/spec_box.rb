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
			expect{ Box.new(1, 2, 3, 4, 5).intersects( 99 ) }.to raise_error ArgumentError
			expect{ Box.new(1, 2, 3, 4, 5).intersects( "uma string" ) }.to raise_error ArgumentError
		end
		it 'erros de saida' do
			expect( Box.new(1, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)		# caixas iguais
			expect( Box.new(3, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)		# Intersecciona pela direita
			expect( Box.new(-1, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)	# intersecciona pela esquerda
			expect( Box.new(1, 6, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)		# intersecciona por cima
			expect( Box.new(1, -2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(true)	# intersecciona por baixo

			expect( Box.new(1, 2, 0, 4, 5).intersects(Box.new(1, 2, 99, 4, 5)) ).to eq(false)	# caixas iguais mas Zs diferentes
			expect( Box.new(5, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(false)
			expect( Box.new(-3, 2, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(false)
			expect( Box.new(1, 7, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(false)
			expect( Box.new(1, -3, 3, 4, 5).intersects(Box.new(1, 2, 3, 4, 5)) ).to eq(false)
		end
	end
end