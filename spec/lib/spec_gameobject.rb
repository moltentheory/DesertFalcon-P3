require 'spec_helper'
require 'bullet'

RSpec.describe GameObject do
  describe '#initialize' do
    it 'entrada' do

      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true)}.not_to raise_error ArgumentError

      expect{GameObject.new("a", 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, "b", 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, "c", 4, 5, "./Assets/Images/falcon.png", 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, "d", 5, "./Assets/Images/falcon.png", 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, "e", "./Assets/Images/falcon.png", 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, 9, 7, 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", "f", 8, true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, "g", true)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, 9)}.to raise_error ArgumentError
      expect{GameObject.new("a", "b", "c", "d", "e", 1, "f", "g", 2)}.to raise_error ArgumentError

    end
  end

  describe '#warp' do
    it 'entrada' do
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).warp(1, 2, 3)}.not_to raise_error ArgumentError

      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).warp("a", 2, 3)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).warp(1, "b", 3)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).warp(1, 2, "c")}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).warp("a", "b", "c")}.to raise_error ArgumentError

    end
  end

  describe '#move' do
    it 'entrada' do
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).move(1, 2, 3)}.not_to raise_error ArgumentError

      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).move("a", 2, 3)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).move(1, "b", 3)}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).move(1, 2, "c")}.to raise_error ArgumentError
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).move("a", "b", "c")}.to raise_error ArgumentError

    end
  end

  describe '#draw' do
    it 'draw' do
      expect{GameObject.new(1, 2, 3, 4, 5, "./Assets/Images/falcon.png", 7, 8, true).draw()}.not_to raise_error ArgumentError
    end
  end

end
