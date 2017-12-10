require 'spec_helper'
require 'scoreboard'


RSpec.describe Scoreboard do
	describe '#initialize' do
		it 'erros de entrada' do
			expect{ Scoreboard.new }.not_to raise_error ArgumentError
		end
	end
	describe '#button_up' do
		it 'erros de entrada' do
			expect{ Scoreboard.new.button_up("uma string") }.to raise_error
			expect{ Scoreboard.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ Scoreboard.new.button_up(Gosu::KB_UP) }.not_to raise_error ArgumentError
			expect{ Scoreboard.new.button_up(Gosu::KB_DOWN) }.not_to raise_error ArgumentError
		end
	end
	describe '#button_down' do
		it 'erros de entrada' do
			expect{ Scoreboard.new.button_up("uma string") }.to raise_error
			expect{ Scoreboard.new.button_up(999) }.not_to raise_error ArgumentError
			expect{ Scoreboard.new.button_up(Gosu::KB_ESCAPE) }.not_to raise_error ArgumentError
		end
	end
	describe '#update' do
		it 'erros de entrada' do
			expect{ Scoreboard.new.update }.not_to raise_error ArgumentError
		end
	end
	describe '#draw' do
		it 'erros de entrada' do
			expect{ Scoreboard.new.draw }.not_to raise_error ArgumentError
		end
	end
	describe '#needs_cursor?' do
		it 'erros de entrada' do
			expect( Scoreboard.new.needs_cursor? ).to eq(true)
		end
	end
	describe '#test_file' do
		it 'erros de entrada' do
			expect{ Scoreboard.new.test_file }.not_to raise_error
		end
	end

end