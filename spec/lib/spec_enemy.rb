require 'spec_helper'
require 'enemy'

RSpec.describe Enemy do
  describe '#is_out_of_bounds' do
    it 'tests for out of bounds' do

      expect{Enemy.new().is_out_of_bounds()}.not_to raise_error ArgumentError

      expect(Enemy.new().is_out_of_bounds()).to eq(false)

    end
  end
end
