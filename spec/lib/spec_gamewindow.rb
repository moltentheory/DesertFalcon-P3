require 'spec_helper'
require 'gamewindow'


RSpec.describe DesertFalconGame do
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
	describe '#on_death' do
		it 'erros de entrada' do
			expect{ MainMenu.new.draw }.not_to raise_error ArgumentError
		end
	end

end