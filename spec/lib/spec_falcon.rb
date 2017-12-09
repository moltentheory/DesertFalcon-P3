require 'spec_helper'
require 'falcon'

RSpec.describe Falcon do
  describe '#got_hiero' do
    it 'got hiero' do
      expect{Falcon.new().got_hiero()}.not_to raise_error ArgumentError
    end
  end

  describe '#got_enemy' do
    it 'got hiero' do
      expect{Falcon.new().got_enemy()}.not_to raise_error ArgumentError
    end
  end

  describe '#accelerate_forward' do
    it 'accelerate forward' do
      expect{Falcon.new().accelerate_forward()}.not_to raise_error ArgumentError
    end
  end

  describe '#accelerate_backward' do
    it 'accelerate backward' do
      expect{Falcon.new().accelerate_backward()}.not_to raise_error ArgumentError
    end
  end

  describe '#accelerate_right' do
    it 'accelerate right' do
      expect{Falcon.new().accelerate_right()}.not_to raise_error ArgumentError
    end
  end

  describe '#accelerate_left' do
    it 'accelerate left' do
      expect{Falcon.new().accelerate_left()}.not_to raise_error ArgumentError
    end
  end

  describe '#move_up' do
    it 'move up' do
      expect{Falcon.new().move_up()}.not_to raise_error ArgumentError
    end
  end

  describe '#move_down' do
    it 'move down' do
      expect{Falcon.new().move_down()}.not_to raise_error ArgumentError
    end
  end

  describe '#create_bullet' do
    it 'create a bullet - argumentos' do
      expect{Falcon.new().create_bullet()}.not_to raise_error ArgumentError
    end

    it 'create a bullet - saida' do
      expect(Falcon.new().create_bullet()).to be_a(Bullet)
    end
  end

  describe '#move' do
    it 'move' do
      expect{Falcon.new().move()}.not_to raise_error ArgumentError
    end
  end
  
end
