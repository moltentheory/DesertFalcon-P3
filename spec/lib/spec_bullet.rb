require 'spec_helper'
require 'bullet'

RSpec.describe Bullet do
	describe '#initialize' do
		it 'initializes the bullet' do
			expect(Bullet.new(1, 2, 3, 4, 5, 6)).not_to raise_exception
      
			expect(Bullet.new("a", 2, 3, 4, 5, 6)).to raise_exception
			expect(Bullet.new(1, "b", 3, 4, 5, 6)).to raise_exception
			expect(Bullet.new(1, 2, "c", 4, 5, 6)).to raise_exception
			expect(Bullet.new(1, 2, 3, "d", 5, 6)).to raise_exception
			expect(Bullet.new(1, 2, 3, 4, "e", 6)).to raise_exception
      expect(Bullet.new(1, 2, 3, 4, 5, "f")).to raise_exception
			expect(Bullet.new("1", "2", "3", "4", "5", "6")).to raise_exception

			expect(Bullet.new(1, 2, 3, -4, 5, 6)).to raise_exception
			expect(Bullet.new(1, 2, 3, 4, -5, 6)).to raise_exception
      expect(Bullet.new(1, 2, 3, 4, 5, -6)).to raise_exception
			expect(Bullet.new(1, 2, 3, -4, -5, 6)).to raise_exception
      expect(Bullet.new(1, 2, 3, -4, 5, -6)).to raise_exception
      expect(Bullet.new(1, 2, 3, 4, -5, -6)).to raise_exception
      expect(Bullet.new(1, 2, 3, -4, -5, -6)).to raise_exception
      expect(Bullet.new(1, 2, 3, 4, 5, 200)).to raise_exception
      expect(Bullet.new(1, 2, 3, -4, 5, 200)).to raise_exception
      expect(Bullet.new(1, 2, 3, 4, -5, 200)).to raise_exception
      expect(Bullet.new(1, 2, 3, -4, -5, 200)).to raise_exception

		end
	end
end
