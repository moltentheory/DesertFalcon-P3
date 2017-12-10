require 'spec_helper'
require 'menu'


RSpec.describe MainMenu do
	describe '#initialize' do
		it 'erros de entrada' do
			expect{ MainMenu.new }.not_to raise_error ArgumentError
		end
	end
	describe '#button_up' do
		it 'erros de entrada' do
			expect{ MainMenu.new.button_up("uma string") }.to raise_error
			expect{ MainMenu.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ MainMenu.new.button_up(Gosu::KB_UP) }.not_to raise_error ArgumentError
			expect{ MainMenu.new.button_up(Gosu::KB_DOWN) }.not_to raise_error ArgumentError
		end
	end
	describe '#button_down' do
		it 'erros de entrada' do
			expect{ MainMenu.new.button_up("uma string") }.to raise_error
			expect{ MainMenu.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ MainMenu.new.button_up(Gosu::KB_ESCAPE) }.not_to raise_error ArgumentError
		end
	end
	describe '#update' do
		it 'erros de entrada' do
			expect{ MainMenu.new.update }.not_to raise_error ArgumentError
		end
	end
	describe '#draw' do
		it 'erros de entrada' do
			expect{ MainMenu.new.draw }.not_to raise_error ArgumentError
		end
	end
	describe '#needs_cursor?' do
		it 'erros de saida' do
			expect( MainMenu.new.needs_cursor? ).to eq(true)
		end
	end
	describe '#play' do
		it 'erros de entrada' do
			expect{ MainMenu.new }.not_to raise_error ArgumentError
		end
	end
	describe '#mouse_check' do
		it 'erros de entrada' do
			expect{ MainMenu.new.mouse_check }.not_to raise_error ArgumentError
		end
	end

end

RSpec.describe HighScore do
	describe '#initialize' do
		it 'erros de entrada' do
			expect{ HighScore.new }.not_to raise_error ArgumentError
		end
	end
	describe '#button_up' do
		it 'erros de entrada' do
			expect{ HighScore.new.button_up("uma string") }.to raise_error
			expect{ HighScore.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ HighScore.new.button_up(Gosu::KB_UP) }.not_to raise_error ArgumentError
			expect{ HighScore.new.button_up(Gosu::KB_DOWN) }.not_to raise_error ArgumentError
		end
	end
	describe '#button_down' do
		it 'erros de entrada' do
			expect{ HighScore.new.button_up("uma string") }.to raise_error
			expect{ HighScore.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ HighScore.new.button_up(Gosu::KB_ESCAPE) }.not_to raise_error ArgumentError
		end
	end
	describe '#update' do
		it 'erros de entrada' do
			expect{ HighScore.new.update }.not_to raise_error ArgumentError
		end
	end
	describe '#draw' do
		it 'erros de entrada' do
			expect{ HighScore.new.draw }.not_to raise_error ArgumentError
		end
	end
	describe '#needs_cursor?' do
		it 'erros de saida' do
			expect( HighScore.new.needs_cursor? ).to eq(true)
		end
	end
	describe '#play' do
		it 'erros de entrada' do
			expect{ HighScore.new }.not_to raise_error ArgumentError
		end
	end

end