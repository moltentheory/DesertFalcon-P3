require 'spec_helper'
require 'obstacle'

RSpec.describe Obstacle do
  describe '#is_out_of_bounds' do
    it 'tests for out of bounds' do

      expect{Obstacle.new().is_out_of_bounds()}.not_to raise_error ArgumentError

      expect(Obstacle.new().is_out_of_bounds()).to eq(false)

    end
  end
end
