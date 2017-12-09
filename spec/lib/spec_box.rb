require 'spec_helper'
require 'box'

RSpec.describe Box do
	describe '#initialize' do
		it 'initializes the box' do
			expect(Box.new(1, 2, 3, 4, 5)).not_to raise_exception
			expect(Box.new("a", 2, 3, 4, 5)).to raise_exception
			expect(Box.new(1, "b", 3, 4, 5)).to raise_exception
			expect(Box.new(1, 2, "c", 4, 5)).to raise_exception
			expect(Box.new(1, 2, 3, "d", 5)).to raise_exception
			expect(Box.new(1, 2, 3, 4, "e")).to raise_exception
			expect(Box.new("1", "2", "3", "4", "5")).to raise_exception

			expect(Box.new(1, 2, 3, -4, 5)).to raise_exception
			expect(Box.new(1, 2, 3, 4, -5)).to raise_exception
			expect(Box.new(1, 2, 3, -4, -5)).to raise_exception

		end
	end
end