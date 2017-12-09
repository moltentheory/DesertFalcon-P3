require 'spec_helper'
require 'bullet'

RSpec.describe Bullet do
	describe '#initialize' do
		it 'initializes the bullet' do
			expect{Bullet.new(1, 2, 3, 4, 5, 6)}.not_to raise_error ArgumentError
      expect{Bullet.new(1, 2, 3, -4, 5, 6)}.not_to raise_error ArgumentError
      expect{Bullet.new(1, 2, 3, 4, -5, 6)}.not_to raise_error ArgumentError
      expect{Bullet.new(1, 2, 3, -4, -5, 6)}.not_to raise_error ArgumentError

			expect{Bullet.new("a", 2, 3, 4, 5, 6)}.to raise_error ArgumentError
			expect{Bullet.new(1, "b", 3, 4, 5, 6)}.to raise_error ArgumentError
			expect{Bullet.new(1, 2, "c", 4, 5, 6)}.to raise_error ArgumentError
			expect{Bullet.new(1, 2, 3, "d", 5, 6)}.to raise_error ArgumentError
			expect{Bullet.new(1, 2, 3, 4, "e", 6)}.to raise_error ArgumentError
      expect{Bullet.new(1, 2, 3, 4, 5, "f")}.to raise_error ArgumentError
			expect{Bullet.new("1", "2", "3", "4", "5", "6")}.to raise_error ArgumentError



		end
	end

  describe '#move' do
    it 'moves the bullet' do
      expect{Bullet.new(0, 0, 0, 0, 0, 0).move()}.not_to raise_error ArgumentError
      expect{Bullet.new(0, 0, 0, "a", 0, 0).move()}.to raise_error ArgumentError
      expect{Bullet.new(0, 0, 0, 0, "a", 0).move()}.to raise_error ArgumentError
      expect{Bullet.new(0, 0, 0, "a", "b", 0).move()}.to raise_error ArgumentError

    end
  end

  describe '#is_out_of_bounds' do
    it 'out of bounds - argumentos' do
      expect{Bullet.new(0, 0, 0, 0, 0, 0).is_out_of_bounds()}.not_to raise_error ArgumentError

		end

		it 'out of bounds - saida' do
      expect(Bullet.new(WINDOW_WIDTH + 5, 0, 0, 0, 0, 0).is_out_of_bounds()).to eq(true)
      expect(Bullet.new(0, -12, 0, 0, 0, 0).is_out_of_bounds()).to eq(true)
      expect(Bullet.new(WINDOW_WIDTH + 5, -12, 0, 0, 0, 0).is_out_of_bounds()).to eq(true)
      expect(Bullet.new(0, 0, 0, 0, 0, 0).is_out_of_bounds()).to eq(false)

    end
  end
end
